import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import { ConfigService } from './config.service';
import gql from 'graphql-tag';
import { map } from 'rxjs/operators';
import {MatSnackBar} from '@angular/material';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  private user = new BehaviorSubject<User>(null);
  private organizationsFilter = new BehaviorSubject<string>(null);

  constructor(private apollo: Apollo, private configService: ConfigService) { }

  login() {
    window.location.href = `${this.configService.getServerUrl()}/oauth2/authorize/google?redirect_uri=${window.location.origin}/login`;
  }

  logout() {
    this.clearToken();
    this.user.next(null);
  }

  setToken(token: string) {
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

  fetchUser() {
    this.queryService('{ currentUser { id firstName isAdmin }}').subscribe(({ currentUser }) => {
      this.user.next(currentUser);
    });
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

  getOrganizationsFilter(): Observable<string> {
    return this.organizationsFilter.asObservable();
  }

  applyFilter(filterValue: string): void {
    this.organizationsFilter.next(filterValue);
  }

  openSnackBar(snackBar: MatSnackBar, message: string) {
    snackBar.open(message, '', {
      duration: 2000,
      horizontalPosition: 'start',
      panelClass: ['snack-bar-custom']
    });
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
}
