import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Apollo } from 'apollo-angular';
import { DocumentNode } from 'graphql';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private loginUrl = 'http://localhost:8080/oauth2/authorize/google?redirect_uri=http://localhost:4200/login';
  private user$ = new BehaviorSubject<User>(null);
  private isAuthenticated = new BehaviorSubject<boolean>(false);

  constructor(private apollo: Apollo) { }

  getLoginUrl() {
    return this.loginUrl;
  }

  getUser(): BehaviorSubject<User> {
    return this.user$;
  }

  setCurrentUser(user: User) {
    this.isAuthenticated.next(true);
    this.user$.next(user);
  }

  isSignedIn(): Observable<boolean> {
    return this.isAuthenticated.asObservable();
  }

  isAdmin(): boolean {
    return this.isSignedIn() && this.user$.getValue().isAdmin;
  }

  queryService(query: DocumentNode): Observable<any> {
    return this.apollo.watchQuery<any>({ query }).valueChanges;
  }
}
