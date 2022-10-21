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

	constructor(data: any = {}) {
		data = data || {};
		Object.keys(data).forEach(key => {
			this[key] = data[key];
		});
	}
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
		data = data || {};
		Object.keys(data).forEach(key => {
			if (key == 'type') {
				this[key] = Object.assign(new Type(), data[key]);
			} else if (key == 'region') {
				this[key] = Object.assign(new Region(), data[key]);
			} else if (key == 'address') {
				this[key] = new Address(data[key]);
			} else if (key == 'affiliations') {
				data[key].forEach(aff => this[key].push(Object.assign(new Affiliation(), aff)));
			} else if (key == 'sectors') {
				data[key].forEach(sec => this[key].push(Object.assign(new Sector(), sec)));
			} else if (key == 'contacts') {
				data[key].forEach((con, idx) => Object.assign(this[key][idx], con));
			} else {
				this[key] = data[key];
			}
		});
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
		data = data || {};
		Object.keys(data).forEach(key => {
			if (key == 'region') {
				Object.assign(this[key], data[key]);
			} else if (key == 'address') {
				this[key] = new Address(data[key]);
			} else if (key == 'reviewer') {
				this[key] = new User(data[key]);
			} else if (key == 'languages') {
				data[key].forEach(lan => this[key].push(Object.assign(new Language(), lan)));
			} else if (key == 'sectors') {
				data[key].forEach(sec => this[key].push(Object.assign(new Sector(), sec)));
			} else {
				this[key] = data[key];
			}
		});
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
		data = data || {};
		Object.keys(data).forEach(key => {
			if (key == 'country') {
				this[key].code = data[key].code || this[key].code;
				this[key].value = data[key].value || this[key].value;
			} else {
				this[key] = data[key];
			}
		});
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
		data = data || {};
		Object.keys(data).forEach(key => {
			if (key == 'regionIds') {
				this[key] = new Set(data.regionIds);
			} else if (key == 'sectorIds') {
				this[key] = new Set(data.sectorIds);
			} else {
				this[key] = data[key];
			}
		});
	}
}

export enum Area {
    ALL, DOMESTIC, INTERNATIONAL
}

export enum Sort {
    NAME, TYPE, LOCATION
}

export enum Mode {
	EDIT, VIEW, READONLY
}

export enum View {
	ORG, REV
}