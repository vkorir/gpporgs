import { Component, ElementRef, Inject, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';
import { Address, Affiliation, Contact, Country, Language, Mode, Organization, Region, Review, Sector, Type } from 'src/app/models';
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
  
  organizationView = true;
  mode: Mode;
  Mode = Mode;

  constructor(private appService: AppService, private dialogRef: MatDialogRef<MainModalComponent>, private fb: FormBuilder, @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
    this.mode = this.data.mode;
  }

  segue(): void {
    this.organizationView = !this.organizationView;
  }

}