export class User {
    id: number = 0;
	email: string = '';
	firstName: string = '';
	lastName: string = '';
	isAdmin: boolean = false;
	created: string = '';
	numberOfLogin: number = 0;
	lastLogin: string = '';
	hasAccess: boolean = false;
}

export class Organization {
    id: number = 0;
	name: string = '';
	description: string = '';
	address: Address = new Address();
	phone: string = '';
	email: string = '';
	website: string = '';
	affiliations: Affiliation[] = [];
	type: Type = new Type();
	typeOther: string = '';
	region: Region = new Region();
	sectors: Sector[] = [];
	sectorOther: string = '';
	approved: boolean = false;
	contacts: Contact[] = [new Contact(), new Contact(), new Contact()];
	created: string = '';

	constructor(data: any = {}) {
		Object.assign(this, data);
		Object.assign(this.type, data.type);
		Object.assign(this.region, data.region);
		this.address = new Address(data.address);
		if (!!data.affiliations) {
			this.affiliations = data.affiliations.map(aff => Object.assign(new Affiliation(), aff));
		}
		if (!!data.sectors) {
			this.sectors = data.sectors.map(sec => Object.assign(new Sector(), sec));
		}
		if (!!data.contacts) {
			for (let i = 0; i < data.contacts.length; i++) {
				Object.assign(this.contacts[i], data.contacts[i]);
			}
		}
	}
}

export class Review {
    id: number = 0;
	created: string = '';
	address: Address = new Address();
	region: Region = new Region();
	languages: Language[] = [];
	difficulties: string = '';
	sectors: Sector[] = [];
	sectorOther: string = '';
	stipend: number = 0;
	cost: number = 0;
	duration: string = '';
	workDone: string = '';
	typicalDay: string = '';
	evaluation: string = '';
	other: string = '';
	safety: number = 0;
	responsiveness: number = 0;
	anonymous: boolean = true;
	reviewer: User = new User();

	constructor(data: any = {}) {
		Object.assign(this, data);
		Object.assign(this.region, data.region);
		Object.assign(this.address, data.address);
		Object.assign(this.reviewer, data.reviewer);
		if (!!data.address) {
			Object.assign(this.address.country, data.address.country);
		}
		if (!!data.languages) {
			this.languages = data.languages.map(lan => Object.assign(new Language(), lan));
		}
		if (!!data.sectors) {
			this.sectors = data.sectors.map(sec => Object.assign(new Sector(), sec));
		}
	}
}

export class Address {
    id: number = 0;
    street: string = '';
    city: string = '';
    state: string = '';
    zip: string = '';
    country: Country = new Country();

	constructor(data: any = {}) {
		Object.assign(this, data);
		Object.assign(this.country, data.country);
	}
}

export class Contact {
    id: number = 0;
    name: string = '';
    role: string = '';
    email: string = '';
    phone: string = '';
}

export class Affiliation {
    id: number = 0;
    value: string = '';
}

export class Region {
    id: number = 0;
    value: string = '';
}

export class Type {
    id: number = 0;
    value: string = '';
}

export class Sector {
    id: number = 0;
    value: string = '';
}

export class Country {
    code: string = '';
    value: string = '';
}

export class Language {
    code: string = '';
    value: string = '';
}

export class Filter {
    area = Area.ALL;
    sort = Sort.NAME;
    regionIds = new Set<number>();
    sectorIds = new Set<number>();
    searchString = '';

	constructor(data: any = {}) {
		Object.assign(this, data);
		if (!!data.regionIds) {
			this.regionIds = new Set(data.regionIds);
		}
		if (!!data.sectorIds) {
			this.sectorIds = new Set(data.sectorIds);
		}
	}
}

export enum Area {
    ALL, DOMESTIC, INTERNATIONAL
}

export enum Sort {
    NAME, TYPE, LOCATION
}