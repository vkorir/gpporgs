import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { Area } from '../model/area';
import {FormArray, FormBuilder, FormControl, FormGroup} from '@angular/forms';
import { LookUpComponent } from '../look-up/look-up.component';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})

export class SidebarComponent implements OnInit {

  area = Area;
  areaControl = this.fb.control(this.area.ALL);
  sectorControls = this.buildSectorControls();

  constructor(private appService: AppService,
              private dialog: MatDialog,
              private fb: FormBuilder) { }

  ngOnInit() {
    this.areaControl.valueChanges.subscribe(value => console.log(value));
  }

  buildSectorControls(): FormArray {
    const formArray = this.fb.array([]);
    for (const _ of this.appService.sectors) {
      const control = this.fb.control(true);
      control.valueChanges.subscribe(value => console.log(value));
      formArray.push(control);
    }
    return formArray;
  }

  control(index: number): FormControl {
    return this.sectorControls.controls[index] as FormControl;
  }

  sectors(): Iterable<number> {
    return [...this.appService.sectors.keys()];
  }

  sector(id: number): string {
    return this.appService.sectors.get(id);
  }

  getFistName(): string {
    return this.appService.userValue().firstName;
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
    const query = '{ organizations { id name address { country }} }';
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(LookUpComponent, {
        panelClass: 'mat-dialog--sm',
        data
      });
    });
  }
}
