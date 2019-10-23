import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { User } from '../model/user';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  user: Observable<User>;

  constructor(private appService: AppService, private router: Router) {}

  ngOnInit() {
    this.user = this.appService.userState();
  }

  updateFilter(searchString: string) {
    const filter = this.appService.filterValue();
    filter.updateSearchString(searchString);
    this.appService.updateFilter(filter);
  }

  login() {
    this.appService.login();
  }

  logout() {
    this.appService.logout();
    this.router.navigateByUrl('/login');
  }
}
