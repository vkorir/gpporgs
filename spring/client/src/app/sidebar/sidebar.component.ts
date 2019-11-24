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
  checked = new Set<number>(this.appService.sectors.keys());
  private _ = this.fb.control(this.checked);

  constructor(private appService: AppService,
              private dialog: MatDialog,
              private fb: FormBuilder) { }

  ngOnInit() {
    this.areaControl.valueChanges.subscribe(() => this.updateArea());
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

  private updateArea(): void {
    const filter = this.appService.filterValue();
    filter.area = this.areaControl.value;
    this.appService.updateFilter(filter);
  }

  onSectorChange(id: number): void {
    if (this.checked.has(id)) {
      this.checked.delete(id);
    } else {
      this.checked.add(id);
    }
    this.updateSectors();
  }

  private updateSectors(): void {
    const filter = this.appService.filterValue();
    filter.sectors = new Set<number>(this.checked);
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
