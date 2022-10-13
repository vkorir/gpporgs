import { Component, ElementRef, Inject, OnChanges, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
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
export class MainModalComponent implements OnInit, OnChanges {

  organization: FormGroup;
  review: FormGroup;
  reviews: Review[] = [];
  reviewControls: FormArray = new FormArray([]);

  regions: Region[];
  countries: Country[];
  affiliations: Affiliation[];
  types: Type[];
  sectors: Sector[];
  languages: Language[];
  contacts: Contact[];
  disableControl: boolean;

  isAddrDiffControl = this.fb.control(true);
  languageControl = this.fb.control(null);
  selectedLanguages: Set<string>;
  filteredLanguages: Observable<Language[]>;
  organizationView = true;
  numTypes = this.appService.types.length;
  numSectors = this.appService.sectors.length;

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
              private dialogRef: MatDialogRef<MainModalComponent>,
              private fb: FormBuilder,
              @Inject(MAT_DIALOG_DATA) public data: any) {
    this.disableControl = data.disableControl;
    this.organization = this.buildFormGroup(new Organization(data.organization), data.disableControl) as FormGroup;
    this.review = this.buildFormGroup(new Review(), data.disableControl) as FormGroup;
    this.regions = this.appService.regions.map(reg => Object.assign(new Region(), reg));
    this.countries = this.appService.countries.map(cou => Object.assign(new Country(), cou));
    this.affiliations = this.appService.affiliations.map(aff => Object.assign(new Affiliation(), aff));
    this.types = this.appService.types.map(typ => Object.assign(new Type(), typ));
    this.sectors = this.appService.sectors.map(sec => Object.assign(new Sector(), sec));
    this.languages = this.appService.languages.map(lan => Object.assign(new Language(), lan));
    this.contacts = [new Contact(), new Contact(), new Contact()];
    if (data.reviews) {
      this.reviews = data.reviews.map(review => {
        const rev = Object.assign(new Review(), review);
        this.reviewControls.push(this.buildFormGroup(rev, true));
        return rev;
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
    // (this.review.controls.reviewer as FormGroup).controls.id.setValue(this.appService.user.getValue().id);
    // this.selectedLanguages = new Set(); //this.review.controls.);
    // this.filteredLanguages = this.languageControl.valueChanges.pipe(
    //   startWith(null),
    //   map(value => value ? this.filter(value) : this.languages.slice())
    // );
  }

  ngOnChanges(changes: SimpleChanges): void {
    console.log('changed');
  }

  isAdmin(): boolean {
    return this.appService.user.getValue().isAdmin;
  }

  filteredTypes(): Type[] {
    return this.types.filter(type => {
      return !this.disableControl || (this.disableControl && this.organization.controls.type.value === type.id);
    });
    return [];
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

  reviewLanguages(languages: Language[]): string {
    return languages.map(lan => lan.value).join(', ');
  }

  reviewSectors(sectors: Sector[], other: string): string {
    const result = sectors.map(sec => sec.value);
    if (!!other) {
      result.push(other);
    }
    return sectors.join('\n');
  }

  checked(formControl: FormArray, id: number | string): boolean {
    for (let idx = 0; idx < formControl.length; idx++) {
      if ((formControl[idx].id || formControl[idx].id) == id) {
        return true;
      }
    }
    return false;
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
    // const contacts = this.organization.controls.contacts as FormArray;
    // const contact = contacts.controls[index] as FormGroup;
    // return contact.controls[field] as FormControl;
  }

  isAnonymousReview(review: Review): boolean {
    return !!review.reviewer.id && (this.appService.user.getValue().isAdmin || !review.anonymous);
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

  private buildFormGroup(data: any, disableControl: boolean): AbstractControl {
    if (Array.isArray(data)) {
      return this.fb.array(data.map((item, index) => this.buildFormGroup(item, disableControl)));
    }
    if (data instanceof Organization || data instanceof Review || data instanceof Address || data instanceof Contact) {
      const fgContent = {};
      Object.keys(data).forEach(key => fgContent[key] = this.buildFormGroup(data[key], disableControl));
      return this.fb.group(fgContent);
    }
    return this.fb.control({ value: data, disabled: disableControl });
  }

  private filter(filterValue: string): Language[] {
    const filtered = [];
    this.languages.forEach(lan => {
      if (lan.value.toLowerCase().indexOf(filterValue.toLowerCase()) === 0
        && !this.selectedLanguages.has(lan.code)) {
        filtered.push(lan);
      }
    })
    // this.appService.languages.forEach((value, key, _) => {
    //   if (value.toLowerCase().indexOf(filterValue.toLowerCase()) === 0
    //     && !this.selectedLanguages.includes(key)) {
    //     filtered.push(key);
    //   }
    // });
    return filtered;
  }

  segue(formGroup: FormGroup, flag: boolean): void {
    if (this.reviews.length == 0 && this.disableControl) {
      this.appService.openSnackBar('No reviews have been submitted for this organization');
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
    console.log(this.organization.getRawValue());
    console.log(this.organization.controls.affiliations);
    // this.organization.markAsUntouched();
    // const mutation = `mutation { updateOrganization(org: ${this.appService.queryFy(this.organization.value)}) { id name }}`;
    // this.appService.mutationService(mutation).subscribe(response => {
    //   if (response.updateOrganization.id) {
    //     this.appService.openSnackBar(`${response.updateOrganization.name} successfully updated.`);
    //   } else {
    //     this.appService.openSnackBar(`Error. ${response.updateOrganization.name} could not be updated.`);
    //   }
    //   this.closeEditOrganization();
    // });
  }

  closeEditOrganization(): void {
    this.isEditOrganization = false;
    this.disableControl = true;
    this.organization.disable();
  }

  canEditReview(review: Review): boolean {
    return this.appService.user.getValue().isAdmin || this.appService.user.getValue().id === review.reviewer.id;
  }

  editReview(review: Review): void {
    this.review = this.buildFormGroup(review, false) as FormGroup;
    // this.selectedLanguages = new Set(review.languages);
    this.disableControl = false;
    this.isEditReview = true;
  }

  saveReview(): void {
    this.review.markAsUntouched();
    this.disableControl = true;
    this.isEditReview = false;
    setTimeout(() => this.updateReviewFields(), 1000);
    const mutation = `mutation { updateReview(rev: ${this.appService.queryFy(this.review.value)}) { id }}`;
    this.appService.mutationService(mutation).subscribe(response => {
      if (response.updateReview.id) {
        this.appService.openSnackBar('Review successfully updated.');
      } else {
        this.appService.openSnackBar('Error. Review could not be updated.');
      }
    });
    this.closeEditReview();
  }

  private updateReviewFields(): void {
    // const review = this.review.value;
    // let index = -1;
    // for (let i = 0; i < this.reviews.length; i++) {
    //   if (this.reviews[i].id === review.id) {
    //     index = i;
    //   }
    // }
    // if (index >= 0) {
    //   this.reviews.splice(index, 1, review);
    // }
    // for (const field of this.reviewEditableFields) {
    //   let value = review[field];
    //   switch (field) {
    //     case 'country':
    //       value = this.country(review.address.country);
    //       break;
    //     case 'city':
    //       value = review.address.city;
    //       break;
    //     case 'region':
    //       value = this.region(review.region);
    //       break;
    //     case 'languages':
    //       value = this.reviewLanguages(review.languages);
    //       break;
    //     case 'sectors':
    //       value = review.sectors.map(id => {
    //         if (id === this.numSectors) {
    //           return review.sectorOther;
    //         }
    //         return this.sector(id);
    //       });
    //       break;
    //   }
    //   document.querySelector(`#review-${review.id} #${field}`).innerHTML = value;
    // }
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
    console.log(mutation);
    this.appService.mutationService(mutation).subscribe(response => {
      this.isSubmitting = response.loading;
      this.appService.openSnackBar('Successfully submitted');
      this.dialogRef.close();
    });
  }
}
