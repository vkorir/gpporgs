import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { AuthService } from 'src/app/auth.service';
import { User } from '../models';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  searchControl: FormControl;
  user: User;

  constructor(private authService: AuthService) {
    this.searchControl = new FormControl();
    this.user = new User();
  }

  ngOnInit(): void {
    this.authService.currentUser.subscribe(user => this.user = user);
  }

  login(): void {
    window.location.assign(this.authService.getLoginUrl());
  }

  logout(): void {
    this.authService.logout();
  }

}
