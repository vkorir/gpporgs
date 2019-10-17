import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {

  private fistName: string;

  constructor(private appService: AppService) { }

  ngOnInit() {
    this.appService.userState().subscribe(user => {
      if (!!user) {
        this.fistName = user.firstName;
      }
    });
  }
}
