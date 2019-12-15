import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';
import {catchError, map} from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Filter } from './model/filter';
import { baseUrl } from './baseUrl';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  private user: BehaviorSubject<User> = new BehaviorSubject<User>(null);
  private organizationsFilter = new BehaviorSubject<Filter>(new Filter());
  public regions = new Map<number, string>();
  public countries = new Map<string, string>();
  public affiliations = new Map<number, string>();
  public types = new Map<number, string>();
  public sectors = new Map<number, string>();
  public languages = new Map<string, string>();

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
        this.user.next(data.currentUser as User);
        this.__populateSources(data.regions, this.regions);
        this.__populateSources(data.countries, this.countries);
        this.__populateSources(data.affiliations, this.affiliations);
        this.__populateSources(data.types, this.types);
        this.__populateSources(data.sectors, this.sectors);
        this.__populateSources(data.languages, this.languages);

        const filter = this.organizationsFilter.getValue();
        filter.regions = new Set(this.regions.keys());
        filter.sectors = new Set(this.sectors.keys());
        this.updateFilter(filter);
      } else {
        this.openSnackBar(this.snackBar, data.message);
      }
    });
  }

  private __populateSources(data: any, source: Map<any, any>): void {
    data.map(item => source.set(item.id || item.code, item.value));
  }

  userValue(): User {
    return this.user.getValue();
  }

  userState(): Observable<User> {
    return this.user.asObservable();
  }

  isSignedIn(): boolean {
    return this.user.getValue() != null;
  }

  isAdmin(): boolean {
    return this.isSignedIn() && this.user.getValue().isAdmin;
  }

  updateFilter(filter: Filter): void {
    this.organizationsFilter.next(filter);
  }

  filterValue(): Filter {
    return this.organizationsFilter.getValue();
  }

  filterState(): Observable<Filter> {
    return this.organizationsFilter.asObservable();
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
        .join();
      return `{${props}}`;
    }
    return JSON.stringify(object);
  }

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges.pipe(map(response => {
      if (response.errors) {
        this.clearToken();
        // window.location.reload();
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

  openSnackBar(snackBar: MatSnackBar, message: string) {
    snackBar.open(message, '', {
      duration: 2000,
      panelClass: ['snack-bar-custom']
    });
  }
}
