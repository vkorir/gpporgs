import { Injectable } from '@angular/core';
import { CanActivate, CanLoad, Route, UrlSegment, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import {UserService} from '../user.service';

@Injectable({
  providedIn: 'root'
})
export class HomeGuard implements CanActivate, CanLoad {
  constructor(private userService: UserService, private router: Router) { }
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
    return true;
  }
}
