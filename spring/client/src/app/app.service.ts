import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from './model/user';
import { Language } from './model/language';

@Injectable({
  providedIn: 'root'
})
export class AppService {
  private loginUrl = 'http://localhost:8080/oauth2/authorize/google?redirect_uri=http://localhost:4200/login';
  private graphQLEndpoint = 'http://localhost:8080/graphql';
  private user$: BehaviorSubject<User> = new BehaviorSubject<User>(null);
  private isAuthenticated = false;

  // http://localhost:8080/oauth2/authorize/google?redirect_uri=http://localhost:4200/oauth2/redirect

  constructor(private http: HttpClient) { }

  getLoginUrl() {
    return this.loginUrl;
  }

  getUser(): BehaviorSubject<User> {
    return this.user$;
  }

  isSignedIn(): boolean {
    return this.isAuthenticated;
  }

  isAdmin(): boolean {
    return this.isSignedIn() && this.user$.getValue().isAdmin;
  }

  fetchCurrentUser(): Promise<User> {
    const body = this.getHttpBody(`{ currentUser { username, firstName }}`);
    return this.http.post<User>(this.graphQLEndpoint, body, { headers: this.getHttpHeaders() })
      .pipe(
        tap(user => {
          if (user !== null && user.userId !== null) {
            this.isAuthenticated = true;
          }
          this.user$.next(user);
        })
      )
      .toPromise();
  }

  getLanguages(): Observable<Language[]> {
    const body = this.getHttpBody(`{ languages: { code, name }}`);
    return this.http.post<Language[]>(this.graphQLEndpoint, body, { headers: this.getHttpHeaders() });
  }

  getHttpHeaders() {
    return new HttpHeaders()
      .set('Content-Type', 'application/x-www-form-urlencoded')
      .set('Authorization', `Bearer ${sessionStorage.getItem('accessToken')}`);
  }

  getHttpBody(query: string) {
    return new HttpParams()
      .set('query', query);
  }
}
