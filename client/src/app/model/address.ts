import { deepCopy } from 'deep-copy-ts';

export class Address {
  id: number = null;
  street: string = null;
  city: string = null;
  state: string = null;
  zip: string = null;
  country: string = null;

  clone(): Address {
    return Object.assign(new Address(), deepCopy(this));
  }
}
