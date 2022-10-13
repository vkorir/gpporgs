import { Area, Filter, Organization } from "./models";

export const serverUrl = window.origin.includes('4200') ? 'http://localhost:8080' : window.origin;

export function applyFilterToOrg(filter: Filter, org: Organization): boolean {
  let searchMatch = !filter.searchString;
  let areaMatch = filter.area == Area.ALL;
  let regionMatch = false;
  let sectorMatch = org.sectors.length == 0;
  if (filter.searchString) {
    const targetStrings = [org.name, org.type.value, org.typeOther, org.region.value, org.address.country.value, org.sectorOther, ...org.sectors.map(s => s.value)];
    for (let idx = 0; idx < targetStrings.length; idx++) {
      if (!!targetStrings[idx] && targetStrings[idx].toLowerCase().includes(filter.searchString)) {
        searchMatch = true;
        break;
      }
    }
  }
  if (filter.area == Area.INTERNATIONAL && org.address.country.code != 'US') {
    areaMatch = true;
  } else if (filter.area == Area.DOMESTIC && org.address.country.code == 'US') {
    areaMatch = true;
  }
  if (!org.region || (filter.regionIds.has(org.region.id))) {
    regionMatch = true;
  }
  for (let idx = 0; idx < org.sectors.length; idx++) {
    if (filter.sectorIds.has(org.sectors[idx].id)) {
      sectorMatch = true;
      break;
    }
  }
  return searchMatch && areaMatch && regionMatch && sectorMatch;
}

export function deepCopy<Tp>(tgt: Tp): Tp {
  let cp: Tp;
  let ptn: number = 0;
  if (tgt === null) {
    cp = tgt;
  } else if (tgt instanceof Set) {
    cp = new Set() as any;
    (tgt as any).forEach(elem => { (cp as any).add(elem); });
    cp = (cp as any).map((n: any) => deepCopy<any>(n));
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
