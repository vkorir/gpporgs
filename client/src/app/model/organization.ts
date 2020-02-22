import { Address } from './address';
import { Contact } from './contact';
import { Area } from './area';
import { Filter } from './filter';
import { AppService } from '../app.service';

export class Organization {
  static readonly numContacts = 3;
  private static default = {
    id: null,
    name: null,
    type: null,
    address: new Address(),
    typeOther: null,
    region: null,
    affiliations: [],
    sectors: [],
    sectorOther: null,
    description: null,
    email: null,
    phone: null,
    website: null,
    approved: false,
    contacts: [],
    dateAdded: Date.now(),
    numReviews: 0
  };
  id: number;
  name: string;
  type: number;
  address: Address;
  typeOther: string;
  region: number;
  affiliations: number[];
  sectors: number[];
  sectorOther: string;
  description: string;
  email: string;
  phone: string;
  website: string;
  approved: boolean;
  contacts: Contact[] = [];
  submitted: number;

  constructor(object: any = {}) {
    for (const [key, value] of Object.entries(Organization.default)) {
      if (key === 'contacts') {
        for (let i = 0; i < Organization.numContacts; i++) {
          if (object.contacts && i < object.contacts.length) {
            this.contacts.push(new Contact(object.contacts[i]));
          } else {
            this.contacts.push(new Contact());
          }
        }
      } else if (!object[key]) {
        this[key] = value;
      } else if (key === 'address') {
        this[key] = new Address(object[key]);
      } else {
        this[key] = object[key];
      }
    }
  }

  applyFilter(filter: Filter, appService: AppService): boolean {
    if (filter.area === Area.INTERNATIONAL && this.address.country === 'US') {
      return false;
    }
    if (filter.area === Area.DOMESTIC && this.address.country !== 'US') {
      return false;
    }
    if (!filter.regions.has(this.region)) {
      return false;
    }
    const sectorsUnion = new Set([...filter.sectors].filter(sector => this.sectors.includes(sector)));
    if (sectorsUnion.size === 0) {
      return false;
    }
    let filterName = true;
    let filterType = true;
    let filterCountry = true;
    if (this.name) {
      filterName = this.name.trim().toLowerCase().includes(filter.searchString);
    }
    if (this.type) {
      filterType = appService.types.get(this.type).trim().toLowerCase().includes(filter.searchString);
      if (this.typeOther) {
        filterType = filterType || this.typeOther.trim().toLowerCase().includes(filter.searchString);
      }
    } else if (this.typeOther) {
      filterType = this.typeOther.trim().toLowerCase().includes(filter.searchString);
    }
    if (this.address.country) {
      filterCountry = appService.countries.get(this.address.country).trim().toLowerCase().includes(filter.searchString);
    }

    return filterName || filterType || filterCountry;
  }
}
