import { Component, Inject, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef, MatSnackBar } from '@angular/material';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { MainModalComponent } from '../main-modal/main-modal.component';

@Component({
  selector: 'app-look-up',
  templateUrl: './look-up.component.html',
  styleUrls: ['./look-up.component.scss']
})
export class LookUpComponent implements OnInit {

  organizations: any[] = [];
  lookUpControl = new FormControl();
  lookUpResults: Observable<any[]>;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<LookUpComponent>,
              private dialog: MatDialog,
              @Inject(MAT_DIALOG_DATA) private data: any) {
    this.organizations = data.organizations;
    this.lookUpResults = this.lookUpControl.valueChanges.pipe(
      startWith(null),
      map(value => {
        if (!value || value.length < 2) {
          return [];
        }
        return this.organizations.filter(organization => organization.name.toLowerCase().startsWith(value.toLowerCase()));
      })
    );
  }

  ngOnInit() { }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  fetchOrganization(id: number) {
    const info = 'id name region phone email website description affiliations type typeOther sectors sectorOther approved dateAdded';
    const address = 'address { id street city state zip country }';
    const contacts = 'contacts { id name role phone email }';
    const query = `{ organization(id: ${id}) { ${info} ${address} ${contacts} }}`;
    this.appService.queryService(query).subscribe(data => {
      this.openReviewDialog(data);
    });
  }

  openReviewDialog(data: any) {
    this.dialogRef.close();
    this.dialog.open(MainModalComponent, {
      panelClass: 'mat-dialog--md',
      disableClose: true,
      data: { ...data, disableControl: false }
    });
  }
}
