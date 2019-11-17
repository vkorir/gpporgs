import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { AppService } from '../app.service';
import { FormArray, FormControl, FormGroup} from '@angular/forms';
import { SubmissionState } from '../model/submission.state';
import {Observable} from 'rxjs';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {

  firstPage = true;
  siteLocState = true;
  private submitting = false;
  readonly numContacts = this.state.numContacts;
  durations = ['<2 months', '2-4 months', '4-6 months', '6-12 months', '>1 year'];

  filteredLanguages: any[];
  languagesPtr = this.state.review.controls.languages;
  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<ReviewComponent>,
              private state: SubmissionState) { }

  ngOnInit() {
    this.filteredLanguages = this.appService.languages.filter(language => {
      return !this.state.review.controls.languages.value.includes(language);
    });
  }

  organizationFG(): FormGroup {
    return this.state.organization;
  }

  reviewFG(): FormGroup {
    return this.state.review;
  }

  regions(): any[] {
    return this.appService.regions;
  }

  countries(): any[] {
    return this.appService.countries;
  }

  affiliations(): any[] {
    return this.appService.affiliations;
  }

  types(): any[] {
    return this.appService.types;
  }

  sectors(): any[] {
    return this.appService.sectors;
  }

  languages(): any[] {
    return this.appService.languages;
  }

  languagesSelected(): any[] {
    return this.state.review.controls.languages.value;
  }

  affiliationControls(formGroup: FormGroup): FormControl[] {
    return (formGroup.controls.affiliations as FormArray).controls as FormControl[];
  }

  sectorControls(formGroup: FormGroup): FormControl[] {
    return (formGroup.controls.sectors as FormArray).controls as FormControl[];
  }

  contactControl(index: number, field: string): FormControl {
    const contacts = this.organizationFG().controls.contacts as FormArray;
    const contact = contacts.controls[index] as FormGroup;
    return contact.controls[field] as FormControl;
  }

  contactsIterator(): number[] {
    return [...Array(this.numContacts).keys()];
  }

  filterLanguages(): void {
    this.filteredLanguages = this.filter(this.languageInput.nativeElement.value);
  }

  private filter(value: string): any[] {
    const filterValue = value.toLowerCase();
    return this.appService.languages.filter(language => {
      return language.value.toLowerCase().indexOf(filterValue) === 0 &&
        !this.state.review.controls.languages.value.includes(language);
    });
  }

  formatSliderLabel(value: number): string | number {
    const rounded = SubmissionState.roundCurrency(value);
    if (value > 900) {
      return parseFloat(`${rounded / 1000}`).toFixed(1) + 'k';
    }
    return rounded;
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    if (event.option.value) {
      this.languageInput.nativeElement.value = '';
      this.state.review.controls.languages.value.push(event.option.value);
    }
  }

  removeLanguage(language: any): void {
    const languages = this.reviewFG().controls.languages.value;
    const index = languages.indexOf(language);
    if (index !== -1) {
      languages.splice(index, 1);
    }
  }

  submit(): void {
    const { organization, review } = this.state.submission();
    // organization.contacts = this.__readContacts();
    const mutation = `mutation { addReview(organization: ${organization}, review: ${review}) }`;
    // this.appService.mutationService(mutation).subscribe(data => {
    //   // this.submitting = data.sub
    //   console.log(data);
    //   this.appService.openSnackBar(this.snackBar, 'Organization successfully submitted');
    //   this.dialogRef.close();
    // });
    console.log(organization, review);
  }
}
