import { Area, Filter, Organization } from "./models";

export const serverUrl = window.origin.includes('4200') ? 'http://localhost:8080' : window.origin;
export const loginUrl = `${serverUrl}/oauth2/authorization/google?redirect_uri=${window.origin}/login`

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
