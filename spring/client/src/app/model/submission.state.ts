import { FormArray, FormBuilder, Validators } from '@angular/forms';
import { AppService } from '../app.service';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SubmissionState {

  readonly numContacts = 3;
  organization = this.fb.group({
    name: this.fb.control('', [Validators.required]),
    address: this.fb.group({
      street: this.fb.control(''),
      city: this.fb.control(''),
      state: this.fb.control(''),
      zip: this.fb.control(''),
      country: this.fb.control('', [Validators.required])
    }),
    region: this.fb.control('', [Validators.required]),
    email: this.fb.control(''),
    phone: this.fb.control(''),
    website: this.fb.control(''),
    type: this.fb.control(null),
    description: this.fb.control(''),
    affiliations: this.buildCheckboxControls(this.appService.affiliations.length),
    sectors: this.buildCheckboxControls(this.appService.sectors.length),
    sectorOther: this.fb.control(''),
    approved: this.fb.control(false),
    contacts: this.buildContactControls()
  });
  review = this.fb.group({
    siteLocState: this.fb.control(true),
    address: this.fb.group({
      street: this.fb.control(''),
      city: this.fb.control(''),
      state: this.fb.control(''),
      zip: this.fb.control(''),
      country: this.fb.control('', [Validators.required])
    }),
    region: this.fb.control('', [Validators.required]),
    languages: this.fb.control([]),
    difficulties: this.fb.control(''),
    sectors: this.buildCheckboxControls(this.appService.sectors.length),
    sectorOther: this.fb.control(''),
    cost: this.fb.control(0),
    stipend: this.fb.control(0),
    duration: this.fb.control(''),
    workDone: this.fb.control('', [Validators.required]),
    typicalDay: this.fb.control(''),
    evaluation: this.fb.control('', [Validators.required]),
    other: this.fb.control(''),
    safety: this.fb.control('', [Validators.required]),
    responsiveness: this.fb.control(''),
    anonymous: this.fb.control(true),
    reviewerId: this.fb.control(this.appService.userValue().id)
  });

  constructor(private fb: FormBuilder, private appService: AppService) { }

  static roundCurrency(amount: number): number {
    if (amount && amount > 900) {
      return (Math.round(amount / 500) * 500);
    }
    if (amount && amount > 100) {
      return Math.round(amount / 100) * 100;
    }
    return amount;
  }

  static readCheckboxIds(states: boolean[]): number[] {
    const ids = [];
    for (let i = 0; i < states.length; i++) {
      if (states[i]) {
        ids.push(i + 1); // id = index + 1
      }
    }
    return ids;
  }

  static queryFy(object: any): any {
    if (!object && typeof object !== 'boolean') {
      return 'null';
    }
    if (typeof object === 'number') {
      return object;
    }
    if (Array.isArray(object)) {
      return `[${object.map(value => `${this.queryFy(value)}`).join()}]`;
    }
    if (typeof object === 'object') {
      const props = Object.keys(object)
        .map(key => `${key}: ${this.queryFy(object[key])}`)
        .join();
      return `{${props}}`;
    }
    return JSON.stringify(object);
  }

  private buildCheckboxControls(size: number): FormArray {
    const checkboxControls = new FormArray([]);
    for (const _ of [...Array(size).keys()]) {
      checkboxControls.push(this.fb.control(false));
    }
    return checkboxControls;
  }

  private buildContactControls(): FormArray {
    const contacts = new FormArray([]);
    for (const _ of [...Array(this.numContacts).keys()]) {
      const contact = this.fb.group({
        name: this.fb.control(''),
        role: this.fb.control(''),
        email: this.fb.control(''),
        phone: this.fb.control('')
      });
      contacts.push(contact);
    }
    return contacts;
  }

  public submission(): any {
    const organization = this.organization.value;
    const review = this.review.value;

    organization.affiliations = SubmissionState.readCheckboxIds(organization.affiliations);
    organization.sectors = SubmissionState.readCheckboxIds(organization.sectors);
    review.sectors = SubmissionState.readCheckboxIds(review.sectors);
    if (this.review.controls.siteLocState.value) {
      review.address = organization.address;
    }
    review.cost = SubmissionState.roundCurrency(review.cost);
    review.stipend = SubmissionState.roundCurrency(review.stipend);

    delete review.siteLocState;

    return { organization, review };
  }
}
