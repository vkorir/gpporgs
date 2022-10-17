import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppService } from '../app.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(private appService: AppService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit() {
    this.appService.user.subscribe(user => {
      if (!!user) {
        let redirectUrl = '/';
        if (this.appService.user.getValue().isAdmin) {
          redirectUrl = '/admin';
        }
        this.router.navigateByUrl(redirectUrl);
      }
    });
    const token = this.route.snapshot.queryParams.token;
    if (!!token) {
      this.appService.setToken(token);
    }
    if (this.appService.tokenExists()) {
      this.appService.initializeState();
    }

    const error = this.route.snapshot.queryParams.error;
    if (error) {
      this.appService.openSnackBar(error || 'An error occurred.');
      this.router.navigateByUrl('/login');
    }
  }

  login(): void {
    window.location.assign(this.appService.loginUrl());
  }
}
