import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree, Route, UrlSegment, Router, CanLoad } from '@angular/router';
import { map, Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivate, CanLoad {

  constructor(private authService: AuthService, private router: Router) { }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> {
    return this.checkAuthentication();
  }

  canLoad(
    route: Route,
    segments: UrlSegment[]): Observable<boolean> {
    return this.checkAuthentication();
  }

  checkAuthentication(): Observable<boolean> {
    return this.authService.currentUser.asObservable().pipe(map(user => {
      if (user.id == 0 || !user.isAdmin) {
        this.router.navigate(['']);
        return false;
      }
      return true;
    }));
  }
}
