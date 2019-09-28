import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppService } from '../app.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  loginUrl = '';

  constructor(private appService: AppService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.loginUrl = this.appService.getLoginUrl();
    this.route.queryParams.subscribe(params => {
      if (params.token != null) {
        sessionStorage.setItem('accessToken', params.token);
        this.appService.fetchCurrentUser().then(user => {
          if (user != null) {
            this.router.navigateByUrl('/');
          }
        });
      }
    });
  }

  login() {
    window.location.href = this.loginUrl;
  }
}
