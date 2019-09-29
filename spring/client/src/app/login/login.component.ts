import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppService } from '../app.service';
import gql from 'graphql-tag';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  loginUrl = '';
  loading = false;

  constructor(private appService: AppService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.loginUrl = this.appService.getLoginUrl();
    this.route.queryParams.subscribe(params => {
      if (params.token != null) {
        this.loading = true;
        localStorage.setItem('token', params.token);
        this.appService.queryService(gql('{ currentUser { username firstName isAdmin } }'))
          .subscribe(({ data }) => {
            if (data.currentUser != null) {
              this.appService.setCurrentUser(data.currentUser);
              this.appService.getUser().subscribe(user => {
                window.location.href = '/';
              });
            } else if (data.error) {
              console.log(data.message);
            }
            this.loading = false;
          });
      }
    });
  }

  login() {
    window.location.href = this.loginUrl;
  }
}
