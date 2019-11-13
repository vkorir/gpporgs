import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { User } from '../model/user';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  user: Observable<User>;
  searchControl = new FormControl();

  constructor(private appService: AppService, private router: Router) {}

  ngOnInit() {
    this.user = this.appService.userState();
    this.searchControl.valueChanges.subscribe(value => {
      const filter = this.appService.filterValue();
      filter.searchString = value;
      this.appService.updateFilter(filter);
    });
  }

  login() {
    this.appService.login();
  }

  logout() {
    this.appService.logout();
    this.router.navigateByUrl('/login');
  }
}
