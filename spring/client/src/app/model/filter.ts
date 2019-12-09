import { Area } from './area';
import { Sort } from './sort';

export class Filter {
  area = Area.ALL;
  sort = Sort.NAME;
  regions = new Set<number>();
  sectors = new Set<number>();
  searchString = '';
}
