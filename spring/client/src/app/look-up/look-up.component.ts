import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog, MatDialogRef, MatSnackBar } from '@angular/material';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { debounceTime, map } from 'rxjs/operators';
import {ReviewComponent} from '../review/review.component';

@Component({
  selector: 'app-look-up',
  templateUrl: './look-up.component.html',
  styleUrls: ['./look-up.component.scss']
})
export class LookUpComponent implements OnInit {

  searchControl = new FormControl();
  organizations: any[] = [];
  searchResults: Observable<any[]>;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<LookUpComponent>,
              private dialog: MatDialog) {
    const query = '{ organizations { id name address { country }} }';
    this.appService.queryService(query).subscribe(data => {
      if (data.message) {
        this.appService.openSnackBar(this.snackBar, data.message);
      } else if (!!data) {
        this.organizations = data.organizations;
      }
    });
  }

  ngOnInit() {
    this.searchResults = this.searchControl.valueChanges.pipe(
      debounceTime(1000),
      map(value => this._filter(value))
    );
  }

  _filter(organization) {
    const filterValue = organization.name;
    if (filterValue === '') {
      return [];
    }
    return this.organizations.filter(option => option.name.toLowerCase().includes(filterValue));
  }

  getCountry(code) {
    return this.appService.countries.get(code);
  }

  notFound(name) {
    if (!!name) {
      for (const organization of this.organizations) {
        if (organization.name.toLowerCase() === name.toLowerCase()) {
          return false;
        }
      }
    }
    return true;
  }

  fetchOrganization(id: number) {
    const info = '{ id name region phone email address { street city state zip country } contacts { name role phone email }}';
    const query = `{ organization(id: ${id}) ${info}`;
    this.appService.queryService(query).subscribe(data => {
      this.openReviewDialog(data);
    });
  }

  openReviewDialog(data: any) {
    this.dialogRef.close();
    this.dialog.open(ReviewComponent, {
      panelClass: 'mat-dialog--md',
      disableClose: true,
      data
    });
  }
}
