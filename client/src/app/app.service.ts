import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Filter } from './model/filter';
import { baseUrl } from './baseUrl';
import { Organization } from './model/organization';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  user = new BehaviorSubject<User>(null);
  filter = new BehaviorSubject<Filter>(new Filter());
  users = new BehaviorSubject<Array<User>>(new Array());
  isShowSearchBar = new BehaviorSubject<boolean>(true);
  organizations = new BehaviorSubject<Array<any>>([]);
  regions = new Map<number, string>();
  countries = new Map<string, string>();
  affiliations = new Map<number, string>();
  types = new Map<number, string>();
  sectors = new Map<number, string>();
  languages = new Map<string, string>();

  constructor(private apollo: Apollo, private snackBar: MatSnackBar) {}

  loginUrl(): string {
    return`${baseUrl}/oauth2/authorize/google?redirect_uri=${window.origin}/login`;
  }

  logout(): void {
    this.clearToken();
    this.user.next(null);
  }

  setToken(token: string): void {
    localStorage.setItem(this.tokenKey, token);
  }

  tokenExists(): boolean {
    return this.getToken() != null;
  }

  getToken(): string {
    return localStorage.getItem(this.tokenKey);
  }

  clearToken(): void {
    localStorage.removeItem(this.tokenKey);
  }

  initializeState(): void {
    const user = 'currentUser { id firstName isAdmin }';
    const affiliations = 'affiliations { id value }';
    const types = 'types { id value }';
    const sectors = 'sectors { id value }';
    const regions = 'regions { id value }';
    const countries = 'countries { code value }';
    const languages = 'languages { code value }';
    const query = `{ ${user} ${affiliations} ${types} ${sectors} ${regions} ${countries} ${languages} }`;
    this.queryService(query).subscribe(data => {
      if (!data.message) {
        this.user.next(data.currentUser);
        this.populateDate(data.regions, this.regions);
        this.populateDate(data.countries, this.countries);
        this.populateDate(data.affiliations, this.affiliations);
        this.populateDate(data.types, this.types);
        this.populateDate(data.sectors, this.sectors);
        this.populateDate(data.languages, this.languages);

        const value = this.filter.getValue();
        value.regions = new Set(this.regions.keys());
        value.sectors = new Set(this.sectors.keys());
        this.filter.next(value);
      } else {
        this.openSnackBar(data.message);
      }
    });
  }

  private populateDate(data: any, source: Map<any, any>): void {
    data.map(item => source.set(item.id || item.code, item.value));
  }

  formatDate(date: string): string {
    if (!date) {
      return '-';
    }
    const lastLogin = new Date(date);
    const formatNum = value => { return value < 10 ? `0${value}` : value; }
    let month = formatNum(lastLogin.getMonth() + 1);
    const day = formatNum(lastLogin.getDate());
    const year = formatNum(lastLogin.getFullYear());
    const hours = formatNum(lastLogin.getHours());
    const minutes = formatNum(lastLogin.getMinutes());
    return `${month}/${day}/${year} ${hours}:${minutes}`;
  }

  queryFy(object: any): any {
    if (!object && typeof object !== 'boolean' && typeof object !== 'number') {
      return 'null';
    }
    if (typeof object === 'number') {
      return object;
    }
    if (Array.isArray(object)) {
      return `[${object.map(value => `${this.queryFy(value)}`).join()}]`;
    }
    if (typeof object === 'object') {
      const props = Object.keys(object)
        .filter(key => key !== '__typename')
        .map(key => `${key}: ${this.queryFy(object[key])}`)
        .join(', ');
      return `{ ${props} }`;
    }
    return JSON.stringify(object);
  }

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges.pipe(map(response => {
      if (response.errors) {
        this.clearToken();
      }
      return response.data || response;
    }));
  }

  mutationService(mutation: string): Observable<any> {
    return this.apollo.mutate({ mutation: gql(mutation) }).pipe(
      map(response => {
        if (response.errors) {
          this.clearToken();
        }
        return response.data || response;
      })
    );
  }

  openSnackBar(message: string) {
    this.snackBar.open(message, '', {
      duration: 2000,
      panelClass: ['snack-bar-custom']
    });
  }
}
