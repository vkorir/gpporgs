import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Affiliation, Contact, Country, Filter, Language, Organization, Region, Sector, Type, User } from './models';
import { deepCopy, serverUrl } from './util';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  user = new BehaviorSubject<User>(null);
  filter = new BehaviorSubject<Filter>(new Filter());
  usersAll = new BehaviorSubject<Array<User>>([]);
  isShowSearchBar = new BehaviorSubject<boolean>(true);
  organizationsApproved = new BehaviorSubject<Array<Organization>>([]);
  organizationsAll = new BehaviorSubject<Array<Organization>>([]);
  affiliations: Affiliation[] = [];
  sectors: Sector[] = [];
  regions: Region[] = [];
  types: Type[] = [];
  languages: Language[] = [];
  countries: Country[] = [];

  constructor(private apollo: Apollo, private snackBar: MatSnackBar) {}

  loginUrl(): string {
    return`${serverUrl}/oauth2/authorization/google?redirect_uri=${window.origin}/login`;
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
    const queries = `{ ${user} ${affiliations} ${types} ${sectors} ${regions} ${countries} ${languages} }`;
    this.queryService(queries).subscribe(data => {
      if (!data.message) {
        this.affiliations = data.affiliations;
        this.regions = data.regions;
        this.sectors = data.sectors;
        this.types = data.types;
        this.countries = data.countries;
        this.languages = data.languages;
        this.user.next(data.currentUser);
      } else {
        this.openSnackBar(data.error);
      }
    });
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
    // return this.apollo.mutate({ mutation: gql(mutation) });
    return this.apollo.mutate({ mutation: gql(mutation) }).pipe(
      map(response => {
        if (response.errors) {
          this.clearToken();
        }
        return response.data || response;
      })
    );
  }

  mutation(mutation, variables: any) {
    return this.apollo.mutate({
      mutation,
      variables
    });
  }

  openSnackBar(message: string) {
    this.snackBar.open(message, '', {
      duration: 2000,
      panelClass: ['snack-bar-custom']
    });
  }
}
