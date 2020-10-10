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
    if (filter.area === Area.INTERNATIONAL && (!!this.address.country && this.address.country === "US")) {
      return false;
    }
    if (filter.area === Area.DOMESTIC && (!!this.address.country && this.address.country !== "US")) {
      return false;
    }
    if (!!this.region && !filter.regions.has(this.region)) {
      return false;
    }
    const sectorsUnion = new Set(
      [...filter.sectors].filter((sector) => this.sectors.includes(sector))
    );
    if (sectorsUnion.size == 0 && this.sectors.length != 0) {
      return false;
    }
    let filterName = true;
    let filterType = true;
    let filterCountry = true;
    if (!!this.name) {
      filterName = this.name.trim().toLowerCase().includes(filter.searchString);
    }
    if (!!this.type) {
      filterType = appService.types
        .get(this.type)
        .trim()
        .toLowerCase()
        .includes(filter.searchString);
      if (this.typeOther) {
        filterType =
          filterType ||
          this.typeOther.trim().toLowerCase().includes(filter.searchString);
      }
    } else if (!!this.typeOther) {
      filterType = this.typeOther
        .trim()
        .toLowerCase()
        .includes(filter.searchString);
    }
    if (!!this.address.country) {
      filterCountry = appService.countries
        .get(this.address.country)
        .trim()
        .toLowerCase()
        .includes(filter.searchString);
    }

    return filterName || filterType || filterCountry;
  }
}
