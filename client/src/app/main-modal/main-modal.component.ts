import { AfterViewInit, Component, ElementRef, Inject, OnChanges, OnDestroy, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange } from '@angular/material/radio';
import { Address, Affiliation, Contact, Country, Language, Mode, Organization, Region, Review, Sector, Type, View } from 'src/app/models';
import { AppService } from 'src/app/app.service';
import { MAT_DIALOG_DATA, MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { Observable, Subject, Subscription } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { OrganizationComponent } from './organization/organization.component';

@Component({
  selector: 'app-main-modal',
  templateUrl: './main-modal.component.html',
  styleUrls: ['./main-modal.component.scss']
})
export class MainModalComponent implements OnInit, OnDestroy, AfterViewInit {

  isAdmin: boolean;

  View = View;
  Mode = Mode;
  
  view: View = View.ORG;
  initial: Mode = Mode.VIEW;
  mode: Mode;

  orgAction: Subject<Mode> = new Subject();
  revAction: Subject<any> = new Subject();

  private subscription: Subscription;

  constructor(private appService: AppService, private dialogRef: MatDialogRef<MainModalComponent>, private fb: FormBuilder, @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
    this.subscription = this.appService.user.subscribe(user => this.isAdmin = user.isAdmin);
    this.mode = this.data.mode;
    if (this.mode == Mode.READONLY) {
      this.initial = this.mode;
    }
  }

  ngAfterViewInit() {
    this.orgAction.next(this.mode);
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  canEditOrg(): boolean {
    return this.isAdmin && this.view == View.ORG && this.mode != Mode.EDIT;
  }

  canSaveOrg(): boolean {
    return this.isAdmin && this.view == View.ORG && this.mode == Mode.EDIT;
  }

  canAddRev(): boolean {
    return this.view == View.ORG && this.mode == Mode.VIEW;
  }

  canSaveRev(): boolean {
    return this.view == View.REV && this.mode == Mode.EDIT;
  }

  canViewRevs(): boolean {
    return this.view == View.ORG && this.mode == Mode.READONLY;
  }

  canViewOrgInfo(): boolean {
    return this.view == View.REV && this.mode != Mode.EDIT;
  }

  onOrgAction(mode: Mode): void {
    this.mode = mode;
    this.orgAction.next(mode);
  }

  onRevAction(mode: Mode): void {
    this.mode = mode;
    if (mode == Mode.EDIT) {
      this.segue(View.REV);
    } else if (mode == Mode.VIEW) {
      this.segue(View.ORG);
    }
    this.revAction.next();
  }

  segue(view: View): void {
    this.view = view;
  }

}