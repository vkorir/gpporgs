import { Component, ElementRef, Inject, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Organization } from '../model/organization';
import { AppService } from '../app.service';
import { MAT_DIALOG_DATA, MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { SubmissionState } from '../model/submission.state';
import { Contact } from '../model/contact';
import { Review } from '../model/review';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

@Component({
  selector: 'app-main-modal',
  templateUrl: './main-modal.component.html',
  styleUrls: ['./main-modal.component.scss']
})
export class MainModalComponent implements OnInit {

  organization: FormGroup;
  review: FormGroup;
  reviews: Review[] = [];

  regions: number[];
  countries: string[];
  affiliations: number[];
  types: number[];
  sectors: number[];
  languages: string[];
  contacts: number[];
  disableControl: boolean;

  isAddrDiffControl = this.fb.control(true);
  languageControl = this.fb.control(null);
  selectedLanguages: string[];
  filteredLanguages: Observable<string[]>;
  organizationView = true;
  numTypes = this.appService.types.size;
  numSectors = this.appService.sectors.size;

  isSubmitting = false;

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<MainModalComponent>,
              private state: SubmissionState,
              private fb: FormBuilder,
              @Inject(MAT_DIALOG_DATA) public data: any) {
    this.disableControl = data.disableControl;
    const organization = data.organization ? new Organization(data.organization) : new Organization();
    this.organization = this.buildFormGroup(organization, data.disableControl) as FormGroup;
    this.review = this.buildFormGroup(new Review(), data.disableControl) as FormGroup;
    this.regions = [...this.appService.regions.keys()];
    this.countries = [...this.appService.countries.keys()];
    this.affiliations = [...this.appService.affiliations.keys()];
    this.types = [...this.appService.types.keys()];
    this.sectors = [...this.appService.sectors.keys()];
    this.languages = [...this.appService.languages.keys()];
    this.contacts = [...Array(Organization.numContacts).keys()];
    if (data.reviews) {
      this.reviews = data.reviews.map(review => new Review(review));
    }
  }

  private static roundCurrency(amount: number): number {
    if (amount && amount > 900) {
      return (Math.round(amount / 500) * 500);
    }
    if (amount && amount > 100) {
      return Math.round(amount / 100) * 100;
    }
    return amount;
  }

  ngOnInit() {
    this.review.controls.reviewerId.setValue(this.appService.userValue().id);
    this.selectedLanguages = this.review.controls.languages.value;
    this.filteredLanguages = this.languageControl.valueChanges.pipe(
      startWith(null),
      map(value => value ? this.filter(value) : this.languages.slice())
    );
  }

  region(id: number): string {
    return this.appService.regions.get(id);
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  affiliation(id: number): string {
    return this.appService.affiliations.get(id);
  }

  type(id: number): string {
    return this.appService.types.get(id);
  }

  filteredTypes(): number[] {
    return this.types.filter(id => {
      return !this.disableControl || (this.disableControl && this.organization.controls.type.value === id);
    });
  }

  sector(id: number): string {
    return this.appService.sectors.get(id);
  }

  language(id: string): string {
    return this.appService.languages.get(id);
  }

  orgDateAdded(): string {
    return this.date(this.organization.controls.dateAdded.value);
  }

  date(timestamp: number): string {
    const postingDate = new Date(timestamp);
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const day = days[postingDate.getDay()];
    const month = months[postingDate.getMonth()];
    const date = postingDate.getDate();
    const year = postingDate.getFullYear();
    const hours = postingDate.getHours();
    const minutes = postingDate.getMinutes();
    return `${day}, ${month} ${date}, ${year} ${hours}:${minutes}`;
  }

  reviewLanguages(ids: string[]): string {
    return ids.map(id => this.language(id)).join(', ');
  }

  reviewSectors(review: any): string {
    const sectors = [];
    review.sectors.forEach(id => {
      if (id !== this.appService.sectors.size) {
        sectors.push(this.sector(id));
      } else {
        sectors.push(review.sectorOther);
      }
    });
    return sectors.join('\n');
  }

  checked(formControl: AbstractControl, id: number): boolean {
    return formControl.value.includes(id);
  }

  onCheckboxChange(formControl: AbstractControl, id: number): void {
    const index = formControl.value.indexOf(id);
    if (index > 0) {
      formControl.value.splice(index, 1);
    } else {
      formControl.value.push(id);
    }
  }

  onSliderChange(formControl: AbstractControl, amount: number): void {
    formControl.setValue(MainModalComponent.roundCurrency(amount));
  }

  contactControl(index: number, field: string): FormControl {
    const contacts = this.organization.controls.contacts as FormArray;
    const contact = contacts.controls[index] as FormGroup;
    return contact.controls[field] as FormControl;
  }

  reviewer(review: Review): boolean {
    return this.appService.isAdmin() || !review.anonymous;
  }

  formatSliderLabel(value: number): string | number {
    const rounded = MainModalComponent.roundCurrency(value);
    if (value > 900) {
      return parseFloat(`${rounded / 1000}`).toFixed(1) + 'k';
    }
    return rounded;
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    this.review.controls.languages.value.push(event.option.value);
    this.languageInput.nativeElement.value = '';
    this.languageControl.setValue(null);
  }

  removeLanguage(language: any): void {
    const index = this.review.controls.languages.value.indexOf(language);
    if (index >= 0) {
      this.review.controls.languages.value.splice(index, 1);
    }
  }

  private buildFormGroup(source: any, disableControl: boolean): AbstractControl {
    if (source instanceof Object && !Array.isArray(source)) {
      const target = this.fb.group({});
      Object.keys(source).forEach(key => {
        target.setControl(key, this.buildFormGroup(source[key], disableControl));
      });
      return target;
    }
    if (Array.isArray(source) && source.length > 0 && source[0] instanceof Contact) {
      const items = [];
      for (const contact of source) {
        items.push(this.buildFormGroup(contact, disableControl));
      }
      return this.fb.array(items);
    }
    return this.fb.control({ value: source, disabled: disableControl });
  }

  private filter(filterValue: string): string[] {
    const filtered = [];
    this.appService.languages.forEach((value, key, _) => {
      if (value.toLowerCase().indexOf(filterValue.toLowerCase()) === 0
        && !this.selectedLanguages.includes(key)) {
        filtered.push(key);
      }
    });
    return filtered;
  }

  segue(formGroup: FormGroup, flag: boolean): void {
    if (this.disableControl || formGroup.valid || (flag && !this.isAddrDiffControl.value && formGroup.controls.workDone.valid
      && formGroup.controls.evaluation.valid)) {
      this.organizationView = flag;
    } else {
      formGroup.markAllAsTouched();
    }
  }

  editReview(review: Review): void {

  }

  saveReview(): void {

  }

  submit(): void {
    const organization = this.organization.value;
    const review = this.review.value;
    if (!this.isAddrDiffControl.value) {
      review.address = organization.address;
      review.region = organization.region;
    }
    const variables = `organization: ${SubmissionState.queryFy(organization)}, review: ${SubmissionState.queryFy(review)}`;
    const mutation = `mutation { createReview(${variables}) { id } }`;
    this.appService.mutationService(mutation).subscribe(data => {
      this.isSubmitting = data.loading;
      this.appService.openSnackBar(this.snackBar, 'Organization successfully submitted');
      this.dialogRef.close();
    });
  }
}
