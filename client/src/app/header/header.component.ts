import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';
import { Router} from '@angular/router';
import { FormControl } from '@angular/forms';
import { Filter, User } from '../models';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  user: Observable<User>;
  searchControl = new FormControl();
  isShowSearchBar: boolean;

  constructor(private appService: AppService, private router: Router) {
    this.user = this.appService.user.asObservable();
    this.searchControl.valueChanges.subscribe(() => this.updateSearchString());
    this.appService.isShowSearchBar.subscribe(value => {
      this.isShowSearchBar = value;
    });
  }

  ngOnInit() {}

  private updateSearchString() {
    const filter = new Filter(this.appService.filter.getValue());
    filter.searchString = this.searchControl.value.trim().toLowerCase();
    this.appService.filter.next(filter);
  }

  login() {
    window.location.assign(this.appService.loginUrl());
  }

  logout() {
    this.appService.logout();
    this.router.navigateByUrl('/login');
  }
}
