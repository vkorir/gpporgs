import { Injectable } from '@angular/core';
import { CanActivate, CanLoad, Route, UrlSegment, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HomeGuard implements CanActivate, CanLoad {

  constructor(private appService: AppService, private router: Router) { }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> {
    return this.checkAuthentication();
  }

  canLoad(
    route: Route,
    segments: UrlSegment[]): Observable<boolean> {
    return this.checkAuthentication();
  }

  checkAuthentication(): Observable<boolean> {
    return this.appService.userState().pipe(map(user => {
      if (user == null) {
        this.router.navigateByUrl('/login');
      }
      if (!!user) {
        this.appService.isShowSearchBar.next(true);
        return true;
      }
      return false;
    }));
  }
}
