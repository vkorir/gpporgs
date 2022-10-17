import { Injectable, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { User } from './models';
import { serverUrl } from './util';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  readonly tokenKey = 'token';
  currentUser = new BehaviorSubject<User>(new User());

  constructor(private router: Router) { }

  getLoginUrl() {
    return `${serverUrl}/oauth2/authorization/google?redirect_uri=${window.origin}/login`
  }

  setToken(token: string) {
    return localStorage.setItem(this.tokenKey, token);
  }

  tokenExists(): boolean {
    return localStorage.getItem(this.tokenKey) != null;
  }

  logout() {
    localStorage.removeItem(this.tokenKey);
    this.currentUser.next(new User());
    this.router.navigate(['login']);
  }
}
