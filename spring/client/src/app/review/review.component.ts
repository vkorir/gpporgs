import { Component, ElementRef, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatAutocomplete, MatAutocompleteSelectedEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { AppService } from '../app.service';
import { FormArray, FormControl, FormGroup } from '@angular/forms';
import { SubmissionState } from '../model/submission.state';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {

  isNewReview: boolean;
  firstPage = true;
  siteLocState = true;
  private submitting = false;
  readonly numContacts = this.state.numContacts;
  readonly numTypes = this.appService.types.size;
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
              private state: SubmissionState,
              @Inject(MAT_DIALOG_DATA) public data: any) {
    this.isNewReview = data.isNewReview;
    this.languages = state.review.controls.languages.value;
    this.allLanguages = [...appService.languages.keys()];
    this.filteredLanguages = this.languageControl.valueChanges.pipe(
      startWith(null),
      map(value => value ? this.filter(value) : this.allLanguages.slice())
    );
    if (!!data.organization) {
      SubmissionState.populateFields(data.organization, state.organization);
    }
  }

  ngOnInit() { }

  organizationFG(): FormGroup {
    return this.state.organization;
  }

  reviewFG(): FormGroup {
    return this.state.review;
  }

  regions(): Iterable<number> {
    return [...this.appService.regions.keys()];
  }

  region(id: number): string {
    return this.appService.regions.get(id);
  }

  countries(): Iterable<string> {
    return [...this.appService.countries.keys()];
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  affiliations(): Iterable<number> {
    return [...this.appService.affiliations.keys()];
  }

  affiliation(id: number): string {
    return this.appService.affiliations.get(id);
  }

  types(): Iterable<number> {
    return [...this.appService.types.keys()];
  }

  type(id: number): string {
    return this.appService.types.get(id);
  }

  sectors(): Iterable<number> {
    return [...this.appService.sectors.keys()];
  }

  sector(id: number): string {
    return this.appService.sectors.get(id);
  }

  language(id: string): string {
    return this.appService.languages.get(id);
  }

  affiliationControls(formGroup: FormGroup, index: number): FormControl {
    return (formGroup.controls.affiliations as FormArray).controls[index] as FormControl;
  }

  sectorControls(formGroup: FormGroup, index: number): FormControl {
    return (formGroup.controls.sectors as FormArray).controls[index] as FormControl;
  }

  contactControl(index: number, field: string): FormControl {
    const contacts = this.organizationFG().controls.contacts as FormArray;
    const contact = contacts.controls[index] as FormGroup;
    return contact.controls[field] as FormControl;
  }

  contacts(): number[] {
    return [...Array(this.numContacts).keys()];
  }

  private filter(filterValue: string): string[] {
    const filtered = [];
    this.appService.languages.forEach((value, key, _) => {
      if (value.toLowerCase().indexOf(filterValue.toLowerCase()) === 0 && !this.languages.includes(key)) {
        filtered.push(key);
      }
    });
    return filtered;
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
