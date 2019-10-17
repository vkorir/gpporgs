import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import gql from 'graphql-tag';
import { ConfigService } from './config.service';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private readonly tokenKey = 'token';
  private user = new BehaviorSubject<User>(null);

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
    this.queryService('{ currentUser { id firstName isAdmin }}').subscribe(response => {
      if (response.errors) {
        console.log('graphql validation error');
      } else if (response.error) {
        console.log(response.message);
        this.clearToken();
      } else {
        response.data.currentUser.isAdmin = true;
        this.user.next(response.data.currentUser);
      }
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

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges;
  }

  mutationService(mutation: string): Observable<any> {
    return this.apollo.mutate({ mutation: gql(mutation) });
  }
}
