import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, Router, CanActivate } from '@angular/router';
import { AppService } from '../app.service';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivate {

  constructor(private appService: AppService, private router: Router) {}

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): boolean {
    if (this.appService.isAdmin()) {
      return true;
    } else if (this.appService.isSignedIn()) {
      this.router.navigateByUrl('/');
    } else {
      this.router.navigateByUrl('/login');
    }
    return false;
  }
}
