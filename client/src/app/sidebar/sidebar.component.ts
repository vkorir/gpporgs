import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
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
  checkedRegions: Set<number>;
  checkedSectors: Set<number>;

  constructor(private appService: AppService, private dialog: MatDialog, private fb: FormBuilder) {
    const filter = appService.filterValue();
    this.checkedRegions = new Set(filter.regions);
    this.checkedSectors = new Set(filter.sectors);
  }

  ngOnInit() {
    this.areaControl.valueChanges.subscribe(() => this.updateArea());
  }

  sectors(): Iterable<number> {
    return [...this.appService.sectors.keys()];
  }

  sector(id: number): string {
    return this.appService.sectors.get(id);
  }

  regions(): Iterable<number> {
    return [...this.appService.regions.keys()];
  }

  region(id: number): string {
    return this.appService.regions.get(id);
  }

  getFistName(): string {
    return this.appService.userValue().firstName;
  }

  private updateArea(): void {
    const filter = this.appService.filterValue();
    filter.area = this.areaControl.value;
    this.appService.updateFilter(filter);
  }

  onRegionChange(id: number): void {
    if (this.checkedRegions.has(id)) {
      this.checkedRegions.delete(id);
    } else {
      this.checkedRegions.add(id);
    }
    const filter = this.appService.filterValue();
    filter.regions = new Set(this.checkedRegions);
    this.appService.updateFilter(filter);
  }

  onSectorChange(id: number): void {
    if (this.checkedSectors.has(id)) {
      this.checkedSectors.delete(id);
    } else {
      this.checkedSectors.add(id);
    }
    this.updateSectors();
  }

  private updateSectors(): void {
    const filter = this.appService.filterValue();
    filter.sectors = new Set<number>(this.checkedSectors);
    this.appService.updateFilter(filter);
  }

  openLookUpDialog(): void {
    const query = '{ organizations { id name address { country }} }';
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(LookUpComponent, {
        panelClass: 'mat-dialog--sm',
        data
      });
    });
  }
}
