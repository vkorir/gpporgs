export class Address {
  private static default = {
    id: null,
    street: null,
    city: null,
    state: null,
    zip: null,
    country: null
  };
  id: number;
  street: string;
  city: string;
  state: string;
  zip: string;
  country: string;

  constructor(object: any = {}) {
    for (const [key, value] of Object.entries(Address.default)) {
      if (!object[key]) {
        this[key] = value;
      } else {
        this[key] = object[key];
      }
    }
  }
}
