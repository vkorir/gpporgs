import { Component, ElementRef, Inject, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatAutocomplete, MatAutocompleteSelectedEvent, MAT_DIALOG_DATA } from '@angular/material';
import { Observable, Subject } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { AppService } from 'src/app/app.service';
import { Address, Contact, Country, Language, Mode, Region, Review, Sector } from 'src/app/models';
import { MainModalComponent } from '../main-modal.component';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['../main-modal.component.scss']
})
export class ReviewComponent implements OnInit, OnDestroy {

  review: FormGroup;
  addressCtrl: FormControl;
  languageCtrl: FormControl;

  regions: Region[] = [];
  sectors: Sector[] = [];
  countries: Country[] = [];
  languages: Language[] = [];
  selectedLanguages: Set<Language>;
  filteredLanguages: Observable<Language[]>

  isAdmin: boolean;
  mode: Mode;
  Mode = Mode;

  @ViewChild('languageInput', { static: false }) languageInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto', { static: false }) matAutocomplete: MatAutocomplete;

  @Input()
  revAction: Subject<any>;

  constructor(private fb: FormBuilder, private appService: AppService, @Inject(MAT_DIALOG_DATA) public data: any) { }

  ngOnInit() {
    this.regions = this.appService.regions.slice();
    this.sectors = this.appService.sectors.slice();
    this.countries = this.appService.countries.slice();
    this.languages = this.appService.languages.slice();
    this.isAdmin = this.appService.user.getValue().isAdmin;
    this.mode = this.data.mode;
    const reviewObject = new Review(this.data.review || {});
    this.review = this.buildForm(reviewObject, this.mode == Mode.VIEW) as FormGroup;
    this.addressCtrl = this.fb.control(true);
    this.languageCtrl = this.fb.control(null);
    this.selectedLanguages = new Set(reviewObject.languages);
    this.revAction.subscribe(() => this.save());
    this.filteredLanguages = this.languageCtrl.valueChanges.pipe(
      startWith(null),
      map(value => value ? this.filter(value) : this.languages.slice())
    );
  }

  ngOnDestroy() {
    this.revAction.unsubscribe();
  }

  compareId(object: Region | Sector, other: Region | Sector): boolean {
    return object.id == other.id;
  }

  compareCode(object: Country | Language, other: Country | Language): boolean {
    return object.code == other.code;
  }

  contains(collection: any[], target: number | string): boolean {
    for (let idx = 0; idx < collection.length; idx++) {
      if ((collection[idx].id || collection[idx].id) == target) {
        return true;
      }
    }
    return false;
  }

  update(collection: any[], target: number | string): void {

  }

  buildForm(data: any, disabled: boolean, validators?: any): AbstractControl {
    if (data instanceof Review || data instanceof Address || data instanceof Contact) {
      const fgContent = {};
      Object.keys(data).forEach(key => fgContent[key] = this.buildForm(data[key], disabled, (validators || {} as any)[key]));
      return this.fb.group(fgContent);
    }
    if (Array.isArray(data)) {
      return this.fb.array(data.map((item, idx) => this.buildForm(item, disabled, (validators || {} as any)[idx])), validators);
    }
    return this.fb.control({ value: data, disabled }, (validators || []));
  }

  addLanguage(event: MatAutocompleteSelectedEvent): void {
    this.review.controls.languages.value.push(event.option.value);
    this.languageInput.nativeElement.value = '';
    this.languageCtrl.setValue(null);
    // if (this.isEditReview) {
    //   this.review.markAsDirty();
    // }
  }

  removeLanguage(language: any): void {
    const index = this.review.controls.languages.value.indexOf(language);
    if (index >= 0) {
      this.review.controls.languages.value.splice(index, 1);
      // if (this.isEditReview) {
      //   this.review.markAsDirty();
      // }
    }
  }

  onSliderChange(formControl: AbstractControl, amount: number): void {
    formControl.setValue(this.roundCurrency(amount));
  }

  private filter(value: string): Language[] {
    const filtered = [];
    return filtered;
  }

  private roundCurrency(amount: number): number {
    if (amount && amount > 900) {
      return (Math.round(amount / 500) * 500);
    }
    if (amount && amount > 100) {
      return Math.round(amount / 100) * 100;
    }
    return amount;
  }

  private save(): void {
    console.log(this.review);
  }

}
