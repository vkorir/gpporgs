import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AppService } from '../app.service';

@Injectable({
  providedIn: 'root'
})
export class LoginGuard implements CanActivate {

  constructor(private appService: AppService, private router: Router) { }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): boolean {
    if (this.appService.isAdmin()) {
      this.router.navigateByUrl('/admin');
      return false;
    } else if (this.appService.isSignedIn()) {
      this.router.navigateByUrl('/');
      return false;
    }
    return true;
  }
}
