import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {MatAutocomplete, MatAutocompleteSelectedEvent, MatChipInputEvent, MatDialogRef, MatSnackBar} from '@angular/material';
import { AppService } from '../app.service';
import { FormBuilder, FormControl } from '@angular/forms';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {

  private firstPage = true;
  private regions: any[] = [];
  private countries: any[] = [];
  private affiliations: any[] = [];
  private types: any[] = [];
  private sectors: any[] = [];
  private languages: any[] = [];
  private selectedLanguages: string[] = [];
  private filteredLanguages: Observable<any[]>;
  private orgInfoFieldNames = ['Name', 'Street', 'Phone', 'City',
    'Email', 'State', 'Website', 'Country', 'Region', 'Zip'];
  private addressFields = ['Street', 'City', 'State', 'Zip', 'Region', 'Country'];
  private formFields = [
    'Please describe the work that you did with your organization',
    'What was a typical day like while on your PE? (please consider housing, food, travel, weather, etc)',
    'What were your organization\'s strengths and weaknesses?',
    'Is there anything else you would like to share with other students who may work with this organization?'
  ];
  private siteLocState = true;
  organizationFormGroup = this.fb.group({
    name: new FormControl(''),
    street: new FormControl(''),
    city: new FormControl(''),
    state: new FormControl(''),
    zip: new FormControl(''),
    region: new FormControl(''),
    country: new FormControl(''),
    phone: new FormControl(''),
    email: new FormControl(''),
    website: new FormControl(),
    contacts: [
      {
        name: new FormControl(''),
        role: new FormControl(''),
        phone: new FormControl(''),
        email: new FormControl('')
      },
      {
        name: new FormControl(''),
        role: new FormControl(''),
        phone: new FormControl(''),
        email: new FormControl('')
      },
      {
        name: new FormControl(''),
        role: new FormControl(''),
        phone: new FormControl(''),
        email: new FormControl('')
      }
    ]
  });
  reviewFormGroup = this.fb.group({
    isDifferentAddress: new FormControl(),
    street: new FormControl(),
    city: new FormControl(),
    state: new FormControl(),
    zip: new FormControl(),
    region: new FormControl(),
    country: new FormControl(),
    language: new FormControl(),
    difficulties: new FormControl(),
    type: new FormControl(),
    sectors: new FormControl(),
    cost: new FormControl(),
    stipend: new FormControl(),
    duration: new FormControl(),
    workDone: new FormControl(),
    typicalDay: new FormControl(),
    evaluation: new FormControl(),
    other: new FormControl(),
    safety: new FormControl(),
    responsiveness: new FormControl(),
    anonymous: new FormControl()
  });

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<ReviewComponent>,
              private fb: FormBuilder) {

  }

  ngOnInit() {
    this.__populateItems(this.appService.regions, this.regions);
    this.__populateItems(this.appService.countries, this.countries);
    this.__populateItems(this.appService.affiliations, this.affiliations);
    this.__populateItems(this.appService.types, this.types);
    this.__populateItems(this.appService.sectors, this.sectors);
    this.__populateItems(this.appService.languages, this.languages);
    this.filteredLanguages = this.reviewFormGroup.controls.language.valueChanges.pipe(
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

  add(event: MatChipInputEvent): void {
    if (!this.matAutocomplete.isOpen) {
      const input = event.input;
      const value = event.value;

      if ((value || '').trim()) {
        this.selectedLanguages.push(value.trim());
      }
      if (input) {
        input.value = '';
      }

      this.reviewFormGroup.controls.language.setValue(null);
    }
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    this.selectedLanguages.push(event.option.value);
    this.languageInput.nativeElement.value = '';
    this.reviewFormGroup.controls.language.setValue(null);
  }

  removeLanguage(language: string): void {
    const index = this.selectedLanguages.indexOf(language);
    if (index >= 0) {
      this.selectedLanguages.splice(index, 1);
    }
  }
}
