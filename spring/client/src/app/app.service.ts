import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import { ConfigService } from './config.service';
import gql from 'graphql-tag';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Filter } from './model/filter';

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

  constructor(private apollo: Apollo, private configService: ConfigService, private snackBar: MatSnackBar) {}

  login(): void {
    window.location.href = `${this.configService.getServerUrl()}/oauth2/authorize/google?redirect_uri=${window.location.origin}/login`;
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

  clearToken() {
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
        filter.sectors = new Set<number>(this.sectors.keys());
        this.updateFilter(filter);
      } else {
        this.openSnackBar(this.snackBar, data.message);
      }
    });
  }

  __populateSources(data, source): void {
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
    return this.isSignedIn() && this.user.getValue().isAdmin && false;
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
    return this.apollo.mutate({ mutation: gql(mutation) });
  }

  openSnackBar(snackBar: MatSnackBar, message: string) {
    snackBar.open(message, '', {
      duration: 2000,
      panelClass: ['snack-bar-custom']
    });
  }
}
