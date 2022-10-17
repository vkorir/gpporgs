import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { AppService } from 'src/app/app.service';
import { AuthService } from 'src/app/auth.service';
import { User } from '../models';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit, OnDestroy {

  private subscriptions: Subscription[] = [];

  constructor(private authService: AuthService, private appService: AppService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.subscriptions.push(this.authService.currentUser.subscribe(user => {
      if (user.id != 0) {
        let redirectUrl = ''
        if (user.isAdmin) {
          redirectUrl = 'admin'
        }
        this.router.navigate([redirectUrl]);
      }
    }));
    if (!!this.route.snapshot.queryParams[this.authService.tokenKey]) {
      this.authService.setToken(this.route.snapshot.queryParams[this.authService.tokenKey]);
    }
    if (this.authService.tokenExists()) {
      this.subscriptions.push(this.appService.queryService('{ currentUser { id firstName isAdmin }}').subscribe(({ currentUser }) => {
        if (!!currentUser) {
          this.authService.currentUser.next(Object.assign(new User(), currentUser));
        }
      }));
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }

  login(): void {
    window.location.assign(this.authService.getLoginUrl());
  }

}
