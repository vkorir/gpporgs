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
  private logoutUrl = 'http://localhost:8080/logout';
  private user = new BehaviorSubject<User>(JSON.parse(localStorage.getItem('user')));

  constructor(private apollo: Apollo) { }

  login() {
    return window.location.href = this.loginUrl;
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.user.next(null);
    location.reload();
    return window.location.href = this.logoutUrl;
  }

  getCurrentUser(): User {
    return this.user.value;
  }

  setCurrentUser(user: User) {
    this.user.next(user);
  }

  isSignedIn(): boolean {
    return this.getCurrentUser() !== null;
  }

  isAdmin(): boolean {
    return this.isSignedIn() && this.getCurrentUser().isAdmin;
  }

  queryService(query: DocumentNode): Observable<any> {
    return this.apollo.watchQuery<any>({ query }).valueChanges;
  }
}
