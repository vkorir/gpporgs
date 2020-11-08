import { Address } from "./address";
import { Contact } from "./contact";
import { Area } from "./area";
import { Filter } from "./filter";
import { AppService } from "../app.service";

export class Organization {
  static readonly numContacts = 3;
  id: number = null;
  name: string = null;
  type: number = null;
  address: Address = new Address();
  typeOther: string = null;
  region: number = null;
  affiliations: number[] = [];
  sectors: number[] = [];
  sectorOther: string = null;
  description: string = null;
  email: string = null;
  phone: string = null;
  website: string = null;
  approved: boolean = false;
  contacts: Contact[] = [new Contact(), new Contact(), new Contact()];
  created: string = null;

  applyFilter(filter: Filter, appService: AppService): boolean {
    const subString = filter.searchString;
    const containsSubstring = (string: string): boolean => {
      if (!string) {
        return false;
      }
      return string.trim().toLowerCase().includes(subString);
    }
    if (!!subString) {
      if (containsSubstring(this.name)) {
        return true;
      }
      if (containsSubstring(appService.types.get(this.type))) {
        return true;
      }
      if (containsSubstring(this.typeOther)) {
        return true;
      }
      if (containsSubstring(appService.regions.get(this.region))) {
        return true;
      }
      if (containsSubstring(appService.countries.get(this.address.country))) {
        return true;
      }
      this.sectors.forEach(id => {
        if (containsSubstring(appService.sectors.get(id))) {
          return true;
        }
      });
      if (containsSubstring(this.sectorOther)) {
        return true;
      }
    } else {
      let filterArea = false;
      let filterRegions = false;
      let filterSectors = false;
      if (filter.area == Area.ALL) {
        filterArea = true;
      } else if (filter.area == Area.INTERNATIONAL && this.address.country != 'US') {
        filterArea = true;
      } else if (filter.area == Area.DOMESTIC && this.address.country == 'US') {
        filterArea = true;
      }
      if (!this.region || (!!this.region && filter.regions.has(this.region))) {
        filterRegions = true;
      }
      if (this.sectors.length == 0) {
        filterSectors = true;
      } else {
        filter.sectors.forEach(id => {
          if (this.sectors.includes(id)) {
            filterSectors = true;
          }
        });
      }

      return filterArea && filterRegions && filterSectors;
    }
    
    return false;
  }
}
