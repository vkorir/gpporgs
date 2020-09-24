export class User {
  id: number;
  email: string;
  firstName: string;
  lastName: string;
  isAdmin: boolean;
  creationTime: number = Date.now();
  numberOfLogin: number = 0;
  lastLogin: number;
}
