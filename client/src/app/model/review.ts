import { User } from "./user";
import { Address } from "./address";

export class Review {
  id: number = null;
  created: string = null;
  address: Address = new Address();
  region: number = null;
  languages: string[] = [];
  sectors: number[] = [];
  sectorOther: string = null;
  cost: number = 0;
  stipend: number = 0;
  workDone: string = null;
  evaluation: string = null;
  typicalDay: string = null;
  difficulties: string = null;
  safety: number = 0;
  responsiveness: number = 0;
  duration: string = null;
  other: string = null;
  reviewerId: number = null;
  reviewer: User = null;
  anonymous: boolean = true;
}
