export class Contact {
  private static default = {
    id: null,
    name: null,
    role: null,
    phone: null,
    email: null
  };
  id: number;
  name: string = null;
  role: string = null;
  phone: string = null;
  email: string = null;

  constructor(object: any = {}) {
    for (const [key, value] of Object.entries(Contact.default)) {
      if (!object[key]) {
        this[key] = value;
      } else {
        this[key] = object[key];
      }
    }
  }
}
