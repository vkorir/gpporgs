import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { AppService } from '../app.service';
import { FormArray, FormControl, FormGroup } from '@angular/forms';
import { SubmissionState } from '../model/submission.state';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import gql from 'graphql-tag';

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

  languageControl = new FormControl();
  languages: string[];
  filteredLanguages: Observable<string[]>;
  allLanguages: string[];

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<ReviewComponent>,
              private state: SubmissionState) {
    this.languages = state.review.controls.languages.value;
    this.allLanguages = appService.languages.map(language => language.id);
    this.filteredLanguages = this.languageControl.valueChanges.pipe(
      startWith(null),
      map(language => language ? this.filter(language) : this.allLanguages.slice())
    );
  }

  ngOnInit() { }

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

  getLanguage(id: string): string {
    for (const language of this.appService.languages) {
      if (language.id === id) {
        return language.value;
      }
    }
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

  private filter(value: string): string[] {
    return this.appService.languages.filter(language => {
      return language.value.toLowerCase().indexOf(value.toLowerCase()) === 0 &&
        !this.languages.includes(language.id);
    }).map(language => language.id);
  }

  formatSliderLabel(value: number): string | number {
    const rounded = SubmissionState.roundCurrency(value);
    if (value > 900) {
      return parseFloat(`${rounded / 1000}`).toFixed(1) + 'k';
    }
    return rounded;
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    this.languages.push(event.option.value);
    this.languageInput.nativeElement.value = '';
    this.languageControl.setValue(null);
  }

  removeLanguage(language: any): void {
    const index = this.languages.indexOf(language);
    if (index >= 0) {
      this.languages.splice(index, 1);
    }
  }

  submit(): void {
    const { organization, review } = this.state.submission();
    const variables = `organization: ${SubmissionState.queryFy(organization)}, review: ${SubmissionState.queryFy(review)}`;
    const mutation = `mutation { createReview(${variables}) { id } }`;
    this.appService.mutationService(mutation).subscribe(data => {
      this.submitting = data.loading;
      console.log(data);
      this.appService.openSnackBar(this.snackBar, 'Organization successfully submitted');
      this.dialogRef.close();
    });
  }
}
