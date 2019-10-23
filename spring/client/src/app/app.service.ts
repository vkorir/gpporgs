import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import { ConfigService } from './config.service';
import gql from 'graphql-tag';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { Filter } from './model/filter';
import { Type } from './model/type';
import { Sector } from './model/sector';
import { Country } from './model/country';
import { Language } from './model/language';
import { Region } from './model/region';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  private user: BehaviorSubject<User> = new BehaviorSubject<User>(null);
  private organizationsFilter = new BehaviorSubject<Filter>(new Filter());
  public types: [Type];
  public sectors: [Sector];
  public regions: [Region];
  public countries: [Country];
  public languages: [Language];

  constructor(private apollo: Apollo, private configService: ConfigService) {}

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
    const types = 'types { id value }';
    const sectors = 'sectors { id value }';
    const regions = 'regions { id value }';
    const countries = 'countries { code value }';
    const languages = 'languages { code value }';
    const query = `{ ${user} ${types} ${sectors} ${regions} ${countries} ${languages} }`;
    this.queryService(query).subscribe(data => {
      if (!!data) {
        this.user.next(data.currentUser as User);
        this.types = data.types as [Type];
        this.sectors = data.sectors as [Sector];
        this.regions = data.regions as [Region];
        this.countries = data.countries as [Country];
        this.languages = data.languages as [Language];

        const filter = this.organizationsFilter.getValue();
        filter.sectors = new Set<number>(this.sectors.map(sector => sector.id) as [number]);
        this.updateFilter(filter);
      }
    });
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

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges.pipe(map(response => {
      if (response.errors) {
        this.clearToken();
        alert('session timed out');
        window.location.reload();
      }
      return response.data;
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
