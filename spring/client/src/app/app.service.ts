import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private tokenKey = 'token';
  private userKey = 'user';
  private user = new BehaviorSubject<User>(JSON.parse(localStorage.getItem(this.userKey)));
  private isAuthenticated = new BehaviorSubject<boolean>(this.user.getValue() != null);

  constructor(private apollo: Apollo, private httpClient: HttpClient, private router: Router) { }

  login() {
    window.location.href = `/oauth2/authorize/google?redirect_uri=${window.location.origin}/login`;
  }

  logout() {
    const headers = new HttpHeaders().set('Authorization', `Bearer ${localStorage.getItem(this.tokenKey)}`);
    this.httpClient.get(`/logout`, { headers });
    localStorage.removeItem(this.userKey);
    localStorage.removeItem(this.tokenKey);
    this.user.next(null);
    this.isAuthenticated.next(false);
    this.router.navigateByUrl('/login');
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
