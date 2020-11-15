import { deepCopy } from 'deep-copy-ts';

export class Contact {
  id: number = null;
  name: string = null;
  role: string = null;
  phone: string = null;
  email: string = null;

  clone(): Contact {
    return Object.assign(new Contact(), deepCopy(this));
  }
}
