import { Component, OnInit, ViewChild } from '@angular/core';
import { AppService } from 'src/app/app.service';
import { MatDialog, MatPaginator, MatSort } from '@angular/material';
import { FormBuilder } from '@angular/forms';
import { LookUpComponent } from '../look-up/look-up.component';
import { Area, Filter, Region } from 'src/app/models';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})

 
export class SidebarComponent implements OnInit {

  area = Area;
  areaControl = this.fb.control(Area.ALL);
  masterSelectedRegion: boolean = true;
  masterSelectedSector: boolean = true;
  checklistRegion: any[] = [];
  checklistSector: any[] = [];

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

constructor(private appService: AppService, private dialog: MatDialog, private fb: FormBuilder) {
    this.areaControl.valueChanges.subscribe(() => {
      const filter = new Filter(this.appService.filter.getValue());
      filter.area = this.areaControl.value;
      this.appService.filter.next(filter);
    });
    appService.regions.forEach(region => this.checklistRegion.push({ ...region, isSelected: true }));
    appService.sectors.forEach(sector => this.checklistSector.push({ ...sector, isSelected: true }));
  }

  ngOnInit() {}
  
  toggleSelectAllRegions() {
    this.masterSelectedRegion = !this.masterSelectedRegion;
    this.checklistRegion.forEach(region => region.isSelected = this.masterSelectedRegion);
    const filter = new Filter(this.appService.filter.getValue());
    if (this.masterSelectedRegion) {
      filter.regionIds = new Set(this.checklistRegion.map(reg => reg.id));
    } else {
      filter.regionIds.clear();
    }
    this.appService.filter.next(filter);
  }

  toggleSelectAllSectors() {
    this.masterSelectedSector = !this.masterSelectedSector;
    this.checklistSector.forEach(sector => sector.isSelected = this.masterSelectedSector);
    const filter = new Filter(this.appService.filter.getValue());
    if (this.masterSelectedSector) {
      filter.sectorIds = new Set(this.checklistSector.map(sector => sector.id));
    } else {
      filter.sectorIds.clear();
    }
    this.appService.filter.next(filter);
  }

  getFistName(): string {
    return this.appService.user.getValue().firstName;
  }

  onRegionChange(idx: number): void {
    const filter = new Filter(this.appService.filter.getValue());
    if (filter.regionIds.has(this.checklistRegion[idx].id)) {
      filter.regionIds.delete(this.checklistRegion[idx].id);
    } else {
      filter.regionIds.add(this.checklistRegion[idx].id);
    }
    this.checklistRegion[idx].isSelected = !this.checklistRegion[idx].isSelected;
    this.masterSelectedRegion = filter.regionIds.size == this.checklistRegion.length;
    this.appService.filter.next(filter);
  }

  onSectorChange(idx: number): void {
    const filter = new Filter(this.appService.filter.getValue());
    if (filter.sectorIds.has(this.checklistSector[idx].id)) {
      filter.sectorIds.delete(this.checklistSector[idx].id);
    } else {
      filter.sectorIds.add(this.checklistSector[idx].id);
    }
    this.checklistSector[idx].isSelected = !this.checklistSector[idx].isSelected;
    this.masterSelectedSector = filter.sectorIds.size == this.checklistSector.length;
    this.appService.filter.next(filter);
  }

  openLookUpDialog(): void {
    this.dialog.open(LookUpComponent, {
      panelClass: 'mat-dialog--sm'
    });
  }
}
