export class User {
  id: number = null;
  email: string;
  firstName: string;
  lastName: string;
  isAdmin: boolean = false;
  creationTime: Date;
  numberOfLogin: number = 0;
  lastLogin: Date;
}
