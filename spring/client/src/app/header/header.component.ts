import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  isSignedIn = false;
  constructor(private appService: AppService) { }

  ngOnInit() {
    this.isSignedIn = this.appService.isSignedIn();
  }
}
