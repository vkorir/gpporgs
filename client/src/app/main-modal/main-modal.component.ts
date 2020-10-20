import { Component, ElementRef, Inject, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Organization } from '../model/organization';
import { AppService } from '../app.service';
import { MAT_DIALOG_DATA, MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { Review } from '../model/review';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

@Component({
  selector: 'app-main-modal',
  templateUrl: './main-modal.component.html',
  styleUrls: ['./main-modal.component.scss']
})
export class MainModalComponent implements OnInit, OnChanges {

  organization: FormGroup;
  review: FormGroup;
  reviews: Review[] = [];
  reviewControls: FormArray = new FormArray([]);

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
  isEditOrganization = false;
  isEditReview = false;

  orgReviewBtnText = 'Add Review for This Organization';
  orgInfoBtnText = 'Organization Info';

  // tslint:disable-next-line:max-line-length
  reviewEditableFields = ['country', 'city', 'region', 'languages', 'sectors', 'sectorOther', 'cost', 'stipend', 'workDone', 'evaluation', 'typicalDay', 'difficulties', 'safety', 'responsiveness', 'duration', 'other'];

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<MainModalComponent>,
              private fb: FormBuilder,
              @Inject(MAT_DIALOG_DATA) public data: any) {
    this.disableControl = data.disableControl;
    this.organization = this.buildFormGroup(data.organization, data.disableControl) as FormGroup;
    this.review = this.buildFormGroup(new Review(), data.disableControl) as FormGroup;
    this.regions = [...this.appService.regions.keys()];
    this.countries = [...this.appService.countries.keys()];
    this.affiliations = [...this.appService.affiliations.keys()];
    this.types = [...this.appService.types.keys()];
    this.sectors = [...this.appService.sectors.keys()];
    this.languages = [...this.appService.languages.keys()];
    this.contacts = [...Array(Organization.numContacts).keys()];
    if (data.reviews) {
      this.reviews = data.reviews.map(review => {
        this.reviewControls.push(this.buildFormGroup(review, true));
        return review;
      });
    }

    if (this.disableControl) {
      this.orgReviewBtnText = 'View Past Student Reviews of This Organization';
      this.orgInfoBtnText = 'View Organization Info';
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
    this.review.controls.reviewerId.setValue(this.appService.user.getValue().id);
    this.selectedLanguages = this.review.controls.languages.value;
    this.filteredLanguages = this.languageControl.valueChanges.pipe(
      startWith(null),
      map(value => value ? this.filter(value) : this.languages.slice())
    );
  }

  ngOnChanges(changes: SimpleChanges): void {
    console.log('changed');
  }

  isAdmin(): boolean {
    return this.appService.user.getValue().isAdmin;
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

  formatDate(creationDate: string): string {
    return this.appService.formatDate(creationDate);
  }

  date(timestamp: number): string {
    const fullDate = new Date(timestamp);
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const day = days[fullDate.getDay()];
    const month = months[fullDate.getMonth()];
    const date = fullDate.getDate();
    const year = fullDate.getFullYear();
    const hours = fullDate.getHours();
    const minutes = fullDate.getMinutes();
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
    if (this.isEditOrganization || this.isEditReview) {
      formControl.markAsDirty();
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

  isAnonymousReview(review: Review): boolean {
    return !!review.reviewerId && (this.appService.user.getValue().isAdmin || !review.anonymous);
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
    if (this.isEditReview) {
      this.review.markAsDirty();
    }
  }

  removeLanguage(language: any): void {
    const index = this.review.controls.languages.value.indexOf(language);
    if (index >= 0) {
      this.review.controls.languages.value.splice(index, 1);
      if (this.isEditReview) {
        this.review.markAsDirty();
      }
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
    if (Array.isArray(source) && source.length == Organization.numContacts) {
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
    if (this.reviews.length == 0 && this.disableControl) {
      this.appService.openSnackBar(this.snackBar, 'No reviews have been posted for this organization');
      return;
    }
    if (this.disableControl || formGroup.valid || (flag && !this.isAddrDiffControl.value && formGroup.controls.workDone.valid
      && formGroup.controls.evaluation.valid)) {
      this.organizationView = flag;
    } else {
      formGroup.markAllAsTouched();
    }
  }

  reviewValid(): boolean {
    if (this.review.valid) {
      return true;
    }
    return !this.isAddrDiffControl.value && this.review.controls.workDone.valid && this.review.controls.evaluation.valid;
  }

  editOrganization(): void {
    this.isEditOrganization = true;
    this.disableControl = false;
    this.organization.enable();
  }

  saveOrganization(): void {
    this.organization.markAsUntouched();
    const mutation = `mutation { updateOrganization(organization: ${this.appService.queryFy(this.organization.value)}) { id name }}`;
    this.appService.mutationService(mutation).subscribe(response => {
      if (response.updateOrganization.id) {
        this.appService.openSnackBar(this.snackBar, `${response.updateOrganization.name} successfully updated.`);
      } else {
        this.appService.openSnackBar(this.snackBar, `Error. ${response.updateOrganization.name} could not be updated.`);
      }
      this.closeEditOrganization();
    });
  }

  closeEditOrganization(): void {
    this.isEditOrganization = false;
    this.disableControl = true;
    this.organization.disable();
  }

  canEditReview(review: Review): boolean {
    return this.appService.user.getValue().isAdmin || this.appService.user.getValue().id === review.reviewerId;
  }

  editReview(review: Review): void {
    this.review = this.buildFormGroup(review, false) as FormGroup;
    this.selectedLanguages = review.languages;
    this.disableControl = false;
    this.isEditReview = true;
  }

  saveReview(): void {
    this.review.markAsUntouched();
    this.disableControl = true;
    this.isEditReview = false;
    setTimeout(() => this.updateReviewFields(), 1000);
    const mutation = `mutation { updateReview(review: ${this.appService.queryFy(this.review.value)}) { id }}`;
    this.appService.mutationService(mutation).subscribe(response => {
      if (response.updateReview.id) {
        this.appService.openSnackBar(this.snackBar, 'Review successfully updated.');
      } else {
        this.appService.openSnackBar(this.snackBar, 'Error. Review could not be updated.');
      }
    });
    this.closeEditReview();
  }

  private updateReviewFields(): void {
    const review = this.review.value;
    let index = -1;
    for (let i = 0; i < this.reviews.length; i++) {
      if (this.reviews[i].id === review.id) {
        index = i;
      }
    }
    if (index >= 0) {
      this.reviews.splice(index, 1, review);
    }
    for (const field of this.reviewEditableFields) {
      let value = review[field];
      switch (field) {
        case 'country':
          value = this.country(review.address.country);
          break;
        case 'city':
          value = review.address.city;
          break;
        case 'region':
          value = this.region(review.region);
          break;
        case 'languages':
          value = this.reviewLanguages(review.languages);
          break;
        case 'sectors':
          value = review.sectors.map(id => {
            if (id === this.numSectors) {
              return review.sectorOther;
            }
            return this.sector(id);
          });
          break;
      }
      document.querySelector(`#review-${review.id} #${field}`).innerHTML = value;
    }
  }

  closeEditReview(): void {
    this.disableControl = true;
    this.isEditReview = false;
    setTimeout(() => {
      document.querySelector(`#review-${this.review.controls.id.value}`)
        .scrollIntoView({ behavior: 'smooth' });
    }, 700);
  }

  submit(): void {
    const organization = this.organization.value;
    const review = this.review.value;
    if (!this.isAddrDiffControl.value) {
      review.address = organization.address;
      review.region = organization.region;
    }
    const variables = `organization: ${this.appService.queryFy(organization)}, review: ${this.appService.queryFy(review)}`;
    const mutation = `mutation { createReview(${variables}) { id } }`;
    this.appService.mutationService(mutation).subscribe(response => {
      this.isSubmitting = response.loading;
      this.appService.openSnackBar(this.snackBar, 'Successfully submitted');
      this.dialogRef.close();
    });
  }
}
