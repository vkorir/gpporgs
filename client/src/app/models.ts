import { deepCopy } from "./util";

export class User {
    id: number;
	email: string;
	firstName: string;
	lastName: string;
	isAdmin: boolean;
	created: string;
	numberOfLogin: number;
	lastLogin: string;
	hasAccess: boolean;
}

export class Organization {
    id: number;
	name: string;
	description: string;
	address: Address;
	phone: string;
	email: string;
	website: string;
	affiliations: Affiliation[];
	type: Type;
	typeOther: string;
	region: Region;
	sectors: Sector[];
	sectorOther: string;
	approved: boolean;
	contacts: Contact[];
	created: string;

	prepare() {
		delete this['created'];
	}
}

export class Review {
    id: number;
	created: string;
	address: Address;
	region: Region;
	languages: Language[];
	difficulties: string;
	sectors: Sector[];
	sectorOther: string;
	stipend: number;
	cost: number;
	duration: string;
	workDone: string;
	typicalDay: string;
	evaluation: string;
	other: string;
	safety: number;
	responsiveness: number;
	anonymous: boolean;
	reviewer: User;
}

export class Address {
    id: number;
    street: string;
    city: string;
    state: string;
    zip: string;
    country: Country;
}

export class Contact {
    id: number;
    name: string;
    role: string;
    email: string;
    phone: string;
}

export class Affiliation {
    id: number;
    value: string;
}

export class Region {
    id: number;
    value: string;
}

export class Type {
    id: number;
    value: string;
}

export class Sector {
    id: number;
    value: string;
}

export class Country {
    code: string;
    value: string;
}

export class Language {
    code: string;
    value: string;
}

export class Filter {
    area = Area.ALL;
    sort = Sort.NAME;
    regionIds = new Set<number>();
    sectorIds = new Set<number>();
    searchString = '';

	clone() {
		const clone = new Filter();
		clone.area = this.area;
		clone.sort = this.sort;
		clone.regionIds = new Set(this.regionIds);
		clone.sectorIds = new Set(this.sectorIds);
		clone.searchString = this.searchString;
		return clone;
	}
}

export enum Area {
    ALL, DOMESTIC, INTERNATIONAL
}

export enum Sort {
    NAME, TYPE, LOCATION
}