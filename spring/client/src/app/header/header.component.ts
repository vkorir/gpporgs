import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  isSignedIn: Observable<boolean>;
  isAdmin: boolean;

  constructor(private appService: AppService) {}

  ngOnInit() {
    this.isSignedIn = this.appService.isSignedIn();
    this.isAdmin = this.appService.isAdmin();
  }

  login() {
    this.appService.login();
  }

  logout() {
    this.appService.logout();
  }
}
