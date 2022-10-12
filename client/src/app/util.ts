import { Area, Filter, Organization } from "./models";

export const serverUrl = window.origin.includes('4200') ? 'http://localhost:8080' : window.origin;

export function applyFilterToOrg(filter: Filter, org: Organization): boolean {
  const subString = filter.searchString;
  if (subString) {
    const targetStrings = [org.name, org.type.value, org.region.value, ...org.sectors.map(s => s.value), org.address.country.value];
    targetStrings.forEach(str => {
      if (!!str && str.toLowerCase().includes(filter.searchString)) {
        return true;
      }
    });
    return false;
  }

  let filterArea = false;
  let filterRegions = false;
  let filterSectors = false;
  if (filter.area == Area.ALL) {
    filterArea = true;
  } else if (filter.area == Area.INTERNATIONAL && org.address.country.code != 'US') {
    filterArea = true;
  } else if (filter.area == Area.DOMESTIC && org.address.country.code == 'US') {
    filterArea = true;
  }
  if (!org.region || (filter.regionIds.has(org.region.id))) {
    filterRegions = true;
  }
  if (org.sectors.length == 0) {
    filterSectors = true;
  } else {
    org.sectors.forEach(sector => {
      if (filter.sectorIds.has(sector.id)) {
        filterSectors = true;
      }
    });
  }
  return filterArea && filterRegions && filterSectors;
}

export function deepCopy<Tp>(tgt: Tp): Tp {
  let cp: Tp;
  let ptn: number = 0;
  if (tgt === null) {
    cp = tgt;
  } else if (tgt instanceof Date) {
    cp = new Date((tgt as any).getTime()) as any;
  } else if (Array.isArray(tgt)) {
    cp = [] as any;
    (tgt as any[]).forEach((v, i, arr) => { (cp as any).push(v); });
    cp = (cp as any).map((n: any) => deepCopy<any>(n));
  } else if ((typeof(tgt) === 'object') && (tgt !== {})) {
    cp = { ...(tgt as Object) } as Tp;
    Object.keys(cp).forEach(k => {
      (cp as any)[k] = deepCopy<any>((cp as any)[k]);
    });
  } else {
    cp = tgt;
  }
  return cp;
}
