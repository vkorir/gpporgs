import { Component, OnInit, ViewChild } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog, MatPaginator, MatSort } from '@angular/material';
import { Area } from '../model/area';
import { FormBuilder } from '@angular/forms';
import { LookUpComponent } from '../look-up/look-up.component';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})

 
export class SidebarComponent implements OnInit {

  area = Area;
  areaControl = this.fb.control(Area.ALL);
  masterSelectedRegion: boolean;
  masterSelectedSector: boolean;
  checklistRegion = [];
  checklistSector = [];
  checkedRegions = new Set<number>();
  checkedSectors = new Set<number>();

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

constructor(private appService: AppService, private dialog: MatDialog, private fb: FormBuilder) {
    this.masterSelectedRegion = true;
    this.masterSelectedSector = true;
    this.areaControl.valueChanges.subscribe(() => {
      const value = this.appService.filter.getValue();
      value.area = this.areaControl.value;
      this.appService.filter.next(value);
    });
    appService.regions.forEach((value, id) => {
      this.checklistRegion.push({ id, value, isSelected: true });
      this.checkedRegions.add(id);
    });
    appService.sectors.forEach((value, id) => {
      this.checklistSector.push({ id, value, isSelected: true });
      this.checkedSectors.add(id);
    });
  }

  ngOnInit() {}
  
  toggleSelectAllRegions() {
    this.masterSelectedRegion = !this.masterSelectedRegion;
    this.checklistRegion.forEach(region => {
      region.isSelected = this.masterSelectedRegion;
      if (!this.checkedRegions.has(region.id)) {
        this.checkedRegions.add(region.id);
      } else {
        this.checkedRegions.delete(region.id);
      }
    });
    this.updateFilterRegion();
  }

  toggleSelectAllSectors() {
    this.masterSelectedSector = !this.masterSelectedSector;
    this.checklistSector.forEach(sector => {
      sector.isSelected = this.masterSelectedSector;
      if (!this.checkedSectors.has(sector.id)) {
        this.checkedSectors.add(sector.id);
      } else {
        this.checkedSectors.delete(sector.id);
      }
    });
    this.updateFilterSectors();
  }

  getFistName(): string {
    return this.appService.user.getValue().firstName;
  }

  onRegionChange(index: number): void {
    const region = this.checklistRegion[index];
    region.isSelected = !region.isSelected;
    if (region.isSelected) {
      this.checkedRegions.add(region.id);
    } else {
      this.checkedRegions.delete(region.id);
    }
    this.masterSelectedRegion = this.checkedRegions.size == this.checklistRegion.length;
    this.updateFilterRegion();
  }

  private updateFilterRegion(): void {
    const value = this.appService.filter.getValue();
    value.regions = new Set(this.checkedRegions);
    this.appService.filter.next(value);
  }

  onSectorChange(index: number): void {
    const sector = this.checklistSector[index];
    sector.isSelected = !sector.isSelected;
    if (sector.isSelected) {
      this.checkedSectors.add(sector.id);
    } else {
      this.checkedSectors.delete(sector.id);
    }
    this.masterSelectedSector = this.checkedSectors.size == this.checklistSector.length;
    this.updateFilterSectors();
  }

  private updateFilterSectors(): void {
    const value = this.appService.filter.getValue();
    value.sectors = new Set<number>(this.checkedSectors);
    this.appService.filter.next(value);
  }


  openLookUpDialog(): void {
    const query = '{ allOrganizations { id name address { country }} }';
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(LookUpComponent, {
        panelClass: 'mat-dialog--sm',
        data
      });
    });
  }
}
