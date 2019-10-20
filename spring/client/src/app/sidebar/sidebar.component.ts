import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { Sector } from '../model/sector';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {

  private fistName: string;
  private areas = ['all', 'domestic', 'international'];
  private sectors: Sector[] = [{ id: 0, name: 'agriculture' }, { id: 1, name: 'education' }];

  constructor(private appService: AppService) { }

  ngOnInit() {
    this.appService.userState().subscribe(user => {
      this.fistName = user.firstName;
    });
    this.appService.queryService('{ sectors { id name }}').subscribe(({ sectors }) => {
      // this.sectors = sectors;
    });
  }
}
