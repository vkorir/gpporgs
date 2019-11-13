import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { Area } from '../model/area';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { LookUpComponent } from '../look-up/look-up.component';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})

export class SidebarComponent implements OnInit {

  area = Area;
  sectors: any[] = [];
  sectorsFormGroup: FormGroup = this.fb.group({ });

  constructor(private appService: AppService, private dialog: MatDialog, private fb: FormBuilder) { }

  ngOnInit() {
    this.appService.sectors.forEach((value, key) => {
      const sector = { id: key, value };
      if (sector.value.toLowerCase().startsWith('other')) {
        sector.value = 'Other';
      }
      this.sectorsFormGroup.addControl(sector.id.toString(), new FormControl());
      this.sectors.push(sector);
    });
  }

  getFistName(): string {
    return this.appService.userValue().firstName;
  }

  isAreaChecked(area: Area) {
    return area === this.appService.filterValue().area;
  }

  isSectorChecked(id: number): boolean {
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

  openLookUpDialog() {
    this.dialog.open(LookUpComponent, {
      panelClass: 'mat-dialog--sm'
    });
  }
}
