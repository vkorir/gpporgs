export class User {
  id: number = null;
  email: string;
  firstName: string;
  lastName: string;
  isAdmin: boolean = false;
  created: Date;
  numberOfLogin: number = 0;
  hasAccess: boolean = false;
  lastLogin: Date;
}
