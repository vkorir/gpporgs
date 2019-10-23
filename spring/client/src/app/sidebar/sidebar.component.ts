import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { ReviewComponent } from '../review/review.component';
import { Area } from '../model/area';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})

export class SidebarComponent implements OnInit {

  private fistName: string;
  private area = Area;

  constructor(private appService: AppService, private dialog: MatDialog) { }

  ngOnInit() {
    this.fistName = this.appService.userValue().firstName;
  }

  isAreaChecked(area: Area) {
    return area === this.appService.filterValue().area;
  }

  isSectorChecked(id: number) {
    return this.appService.filterValue().sectors.has(id);
  }

  updateArea(area: Area) {
    const filter = this.appService.filterValue();
    filter.area = area;
    this.appService.updateFilter(filter);
  }

  updateSectors(id: number) {
    const filter = this.appService.filterValue();
    if (filter.sectors.has(id)) {
      filter.sectors.delete(id);
    } else {
      filter.sectors.add(id);
    }
    this.appService.updateFilter(filter);
  }

  openReviewDialog() {
    this.dialog.open(ReviewComponent, {
      panelClass: 'mat-dialog--md',
      disableClose: true
    });
  }
}
