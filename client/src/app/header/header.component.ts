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

  constructor(private appService: AppService, private router: Router) {}

  ngOnInit() {
    this.user = this.appService.userState();
    this.searchControl.valueChanges.subscribe(() => this.updateSearchString());
  }

  private updateSearchString(): void {
    const filter = this.appService.filterValue();
    filter.searchString = this.searchControl.value.trim().toLowerCase();
    this.appService.updateFilter(filter);
  }

  showSearchBar(): void {
    document.getElementById('main-search-bar').style.display = 'block';
  }

  hideSearchBar(): void {
    document.getElementById('main-search-bar').style.display = 'none';
  }

  login(): void {
    window.location.assign(this.appService.loginUrl());
  }

  logout() {
    this.appService.logout();
    this.router.navigateByUrl('/login');
  }
}
