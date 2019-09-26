import { Injectable } from '@angular/core';
import { CanActivate, CanLoad, Route, UrlSegment, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AppService } from '../app.service';

@Injectable({
  providedIn: 'root'
})
export class HomeGuard implements CanActivate, CanLoad {

  constructor(private appService: AppService, private router: Router) { }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): boolean {
    return this.checkAuthentication();
  }

  canLoad(
    route: Route,
    segments: UrlSegment[]): boolean {
    return this.checkAuthentication();
  }

  checkAuthentication() {
    if (this.appService.isSignedIn()) {
      return true;
    }
    this.router.navigateByUrl('/login');
    return false;
  }
}
