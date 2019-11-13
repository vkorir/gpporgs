import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatAutocomplete, MatAutocompleteSelectedEvent, MatChipInputEvent, MatDialogRef, MatSnackBar } from '@angular/material';
import { AppService } from '../app.service';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { SubmissionState } from '../model/submission.state';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {

  state: SubmissionState;
  firstPage = true;
  regions: any[] = [];
  countries: any[] = [];
  affiliations: any[] = [];
  types: any[] = [];
  sectors: any[] = [];
  languages: any[] = [];
  selectedLanguages: string[] = [];
  filteredLanguages: Observable<any[]>;
  contactKeys: any[];

  // status
  siteLocState = true;
  private submitting = false;

  durations = ['<2 months', '2-4 months', '4-6 months', '6-12 months', '>1 year'];

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<ReviewComponent>,
              private fb: FormBuilder) {
    this.state = new SubmissionState(fb, appService);
  }

  ngOnInit() {
    this.__populateItems(this.appService.regions, this.regions);
    this.__populateItems(this.appService.countries, this.countries);
    this.__populateItems(this.appService.affiliations, this.affiliations);
    this.__populateItems(this.appService.types, this.types);
    this.__populateItems(this.appService.sectors, this.sectors);
    this.__populateItems(this.appService.languages, this.languages);
    this.contactKeys = this.state.getContactKeys();

    this.filteredLanguages = this.state.review.controls.languages.valueChanges.pipe(
      startWith(null),
      map((language: string | null) => language ? this.__filterLanguages(language) : this.languages.slice())
    );
  }

  private __populateItems(source: Map<any, string>, target: any[]): void {
    source.forEach((value, key) => {
      target.push({ id: key, value });
    });
  }

  private __filterLanguages(value: string): any[] {
    const filterValue = value.toLowerCase();
    return this.languages.filter(language => {
      return language.value.toLowerCase().indexOf(filterValue) === 0 && !this.selectedLanguages.includes(language.id);
    });
  }

  getControls(group: FormGroup, controlKey: string): FormControl[] {
    const formArray = group.controls[controlKey] as FormArray;
    return formArray.controls as FormControl[];
  }

  add(event: MatChipInputEvent): void {
    if (!this.matAutocomplete.isOpen) {
      const input = event.input;
      const value = event.value;

      if (this.appService.languages.has(value)) {
        this.selectedLanguages.push(value);
      }
      if (input) {
        input.value = '';
      }

      this.state.review.controls.language.setValue(null);
    }
  }

  getLanguage(code: string): string {
    return this.appService.languages.get(code);
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    if (event.option.value) {
      this.selectedLanguages.push(event.option.value);
      this.languageInput.nativeElement.value = '';
      this.state.review.controls.language.setValue(null);
    }
  }

  popFromList(item: any, list: any[]): void {
    const index = list.indexOf(item);
    if (index >= 0) {
      list.splice(index, 1);
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

  capitalizeFirst(s: string): string {
    return s.charAt(0).toUpperCase() + s.slice(1);
  }
}
