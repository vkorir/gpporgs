import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { AppService } from '../app.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit, OnDestroy {

  subscription: Subscription;

  user = 'currentUser { id firstName isAdmin }';
  affiliations = 'affiliations { id value }';
  types = 'types { id value }';
  sectors = 'sectors { id value }';
  regions = 'regions { id value }';
  countries = 'countries { code value }';
  languages = 'languages { code value }';

  constructor(private appService: AppService, private router: Router, private route: ActivatedRoute) { }

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
      const queries = `{ ${this.user} ${this.affiliations} ${this.types} ${this.sectors} ${this.regions} ${this.countries} ${this.languages} }`;
      this.subscription = this.appService.queryService(queries).subscribe(data => this.appService.initializeState(data));
    }

    const error = this.route.snapshot.queryParams.error;
    if (error) {
      this.appService.openSnackBar(error || 'An error occurred.');
      this.router.navigateByUrl('/login');
    }
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  login(): void {
    window.location.assign(this.appService.loginUrl());
  }
}
