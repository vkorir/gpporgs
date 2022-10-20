import { Component, ElementRef, Inject, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';
import { Address, Affiliation, Contact, Country, Language, Organization, Region, Review, Sector, Type } from 'src/app/models';
import { AppService } from 'src/app/app.service';
import { MAT_DIALOG_DATA, MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

@Component({
  selector: 'app-main-modal',
  templateUrl: './main-modal.component.html',
  styleUrls: ['./main-modal.component.scss']
})
export class MainModalComponent implements OnInit {
  
  organizationView = false;

  organizationReviews: Review[] = [];

  orgReviewBtnText = 'Add Review for This Organization';
  orgInfoBtnText = 'Organization Info';

  constructor(private appService: AppService, private dialogRef: MatDialogRef<MainModalComponent>, private fb: FormBuilder, @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
  }

  segue(): void {
    this.organizationView = !this.organizationView;
  }

}