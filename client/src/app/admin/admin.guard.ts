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
    if (this.appService.user.getValue() && this.appService.user.getValue().isAdmin) {
      this.appService.isShowSearchBar.next(false);
      return true;
    }
    this.router.navigateByUrl('/');
    return false;
  }
}
