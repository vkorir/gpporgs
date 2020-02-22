import { User } from './user';
import { Address } from './address';

export class Review {
  private static default = {
    id: null,
    submitted: new Date().getTime(),
    address: new Address(),
    region: null,
    languages: [],
    sectors: [],
    sectorOther: null,
    cost: 0,
    stipend: 0,
    workDone: null,
    evaluation: null,
    typicalDay: null,
    difficulties: null,
    safety: null,
    responsiveness: null,
    duration: null,
    other: null,
    reviewerId: null,
    reviewer: null,
    anonymous: true
  };
  id: number;
  submitted: number;
  address: Address;
  region: number;
  languages: string[];
  sectors: number[];
  sectorOther: string;
  cost: number;
  stipend: number;
  workDone: string;
  evaluation: string;
  typicalDay: string;
  difficulties: string;
  safety: number;
  responsiveness: number;
  duration: string;
  other: string;
  reviewerId: number;
  reviewer: User;
  anonymous: boolean;

  constructor(object: any = {}) {
    for (const [key, value] of Object.entries(Review.default)) {
      if (!object[key]) {
        this[key] = value;
      } else if (key === 'address') {
        this[key] = new Address(object[key]);
      } else {
        this[key] = object[key];
      }
    }
  }
}
