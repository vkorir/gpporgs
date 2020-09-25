import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';
import { Router} from '@angular/router';
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
  isShowSearchBar: boolean;

  constructor(private appService: AppService, private router: Router) {
    this.user = this.appService.userState();
    this.searchControl.valueChanges.subscribe(() => this.updateSearchString());
    this.appService.isShowSearchBar.subscribe(value => {
      this.isShowSearchBar = value;
    });
  }

  ngOnInit() {}

  private updateSearchString(): void {
    const filter = this.appService.filterValue();
    filter.searchString = this.searchControl.value.trim().toLowerCase();
    this.appService.updateFilter(filter);
  }

  // toggeShowSearchBar(value: boolean) {
  //   this.appService.isShowSearchBar.next(value);
  // }

  login(): void {
    window.location.assign(this.appService.loginUrl());
  }

  logout() {
    this.appService.logout();
    this.router.navigateByUrl('/login');
  }
}
