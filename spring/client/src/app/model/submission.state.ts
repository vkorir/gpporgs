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
    type: this.fb.control(''),
    description: this.fb.control(''),
    affiliations: this.buildCheckboxControls(this.appService.affiliations.length),
    sectors: this.buildCheckboxControls(this.appService.sectors.length),
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
    languages: this.fb.array([]),
    difficulties: this.fb.control(''),
    sectors: this.buildCheckboxControls(this.appService.sectors.length),
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
    reviewerId: this.fb.control('')
  });

  constructor(private fb: FormBuilder, private appService: AppService) { }

  static roundCurrency(amount: number): number {
    if (amount > 900) {
      return (Math.round(amount / 500) * 500);
    }
    if (amount > 100) {
      return Math.round(amount / 100) * 100;
    }
    return amount;
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
    // review.languages = this.languages;

    if (this.review.controls.siteLocState.value) {
      review.address = organization.address;
    }

    return { organization, review };
  }
}
