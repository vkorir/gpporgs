import { Area } from './area';
import { Sort } from './sort';

export class Filter {
  area = Area.ALL;
  sort = Sort.NAME;
  sectors = new Set<number>();
  searchString = '';
}
