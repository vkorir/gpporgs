import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private baseUrl = 'http://localhost:4200';
  private serverUrl = 'http://localhost:8080';
  private tokenKey = 'token';
  private userKey = 'user';
  private user = new BehaviorSubject<User>(JSON.parse(localStorage.getItem(this.userKey)));
  private isAuthenticated = new BehaviorSubject<boolean>(this.user.getValue() != null);

  constructor(private apollo: Apollo) { }

  login() {
    return window.location.href = `${this.serverUrl}/oauth2/authorize/google?redirect_uri=${this.baseUrl}/login`;
  }

  logout() {
    localStorage.removeItem(this.userKey);
    localStorage.removeItem(this.tokenKey);
    this.user.next(null);
    this.isAuthenticated.next(false);
    location.reload();
    // this.mutationService(gql('mutation { logout }'));
    // window.location.href = `${serverUrl}/logout`;
  }

  getUser(): BehaviorSubject<User> {
    return this.user;
  }

  getUsername(): string {
    return this.getUser().getValue().username;
  }

  getFirstName(): string {
    return this.getUser().getValue().firstName;
  }

  setCurrentUser(user: string, token: string) {
    if (user && token) {
      localStorage.setItem(this.userKey, user);
      localStorage.setItem(this.tokenKey, token);
      this.user.next(JSON.parse(user));
      this.isAuthenticated.next(true);
    }
  }

  isSignedIn(): Observable<boolean> {
    return this.isAuthenticated.asObservable();
  }

  isAdmin(): boolean {
    return this.getUser().getValue() != null && this.getUser().getValue().isAdmin;
  }

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges;
  }

  mutationService(mutation: string): Observable<any> {
    return this.apollo.mutate({ mutation: gql(mutation) });
  }
}
