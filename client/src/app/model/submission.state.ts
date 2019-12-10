// import {AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
// import { AppService } from '../app.service';
// import { Injectable } from '@angular/core';
// import {Organization} from './organization';
// import {Review} from './review';
//
// @Injectable({
//   providedIn: 'root'
// })
// export class SubmissionState {
//
//   readonly numContacts = 3;
//   private organization = this.fb.group({
//     id: this.fb.control(null),
//     name: this.fb.control(null, [Validators.required]),
//     address: this.fb.group({
//       street: this.fb.control(null),
//       city: this.fb.control(null),
//       state: this.fb.control(null),
//       zip: this.fb.control(null),
//       country: this.fb.control(null, [Validators.required])
//     }),
//     region: this.fb.control(null, [Validators.required]),
//     email: this.fb.control(null),
//     phone: this.fb.control(null),
//     website: this.fb.control(null),
//     type: this.fb.control(null),
//     typeOther: this.fb.control(null),
//     description: this.fb.control(null),
//     affiliations: this.fb.control([]),
//     sectors: this.fb.control([]),
//     sectorOther: this.fb.control(null),
//     approved: this.fb.control(false),
//     contacts: this.buildContactControls()
//   });
//   private review = this.fb.group({
//     siteLocState: this.fb.control(true),
//     timestamp: this.fb.control(new Date().toUTCString()),
//     address: this.fb.group({
//       street: this.fb.control(null),
//       city: this.fb.control(null),
//       state: this.fb.control(null),
//       zip: this.fb.control(null),
//       country: this.fb.control(null, [Validators.required])
//     }),
//     region: this.fb.control(null, [Validators.required]),
//     languages: this.fb.control([]),
//     difficulties: this.fb.control(null),
//     sectors: this.fb.control([]),
//     sectorOther: this.fb.control(null),
//     cost: this.fb.control(0),
//     stipend: this.fb.control(0),
//     duration: this.fb.control(null),
//     workDone: this.fb.control(null, [Validators.required]),
//     typicalDay: this.fb.control(null),
//     evaluation: this.fb.control(null, [Validators.required]),
//     other: this.fb.control(null),
//     safety: this.fb.control(null, [Validators.required]),
//     responsiveness: this.fb.control(null),
//     anonymous: this.fb.control(true),
//     reviewerId: this.fb.control(this.appService.userValue().id)
//   });
//
//   constructor(private fb: FormBuilder, private appService: AppService) {}
//
//   static roundCurrency(amount: number): number {
//     if (amount && amount > 900) {
//       return (Math.round(amount / 500) * 500);
//     }
//     if (amount && amount > 100) {
//       return Math.round(amount / 100) * 100;
//     }
//     return amount;
//   }
//
//   static queryFy(object: any): any {
//     if (!object && typeof object !== 'boolean') {
//       return 'null';
//     }
//     if (typeof object === 'number') {
//       return object;
//     }
//     if (Array.isArray(object)) {
//       return `[${object.map(value => `${this.queryFy(value)}`).join()}]`;
//     }
//     if (typeof object === 'object') {
//       const props = Object.keys(object)
//         .map(key => `${key}: ${this.queryFy(object[key])}`)
//         .join();
//       return `{${props}}`;
//     }
//     return JSON.stringify(object);
//   }
//
//   static populateFields(source: any, target: AbstractControl): void {
//     if (target instanceof FormGroup) {
//       Object.keys(target.controls).forEach(key => {
//         if (key === 'languages') {
//           target.controls.languages.setValue(source[key]);
//         } else if (key === 'affiliations' || key === 'sectors') {
//           for (let i = 0; i < (target.controls[key] as FormArray).controls.length; i++) {
//             SubmissionState.populateFields(source[key].includes(i + 1), (target.controls[key] as FormArray).controls[i]);
//           }
//         }
//         SubmissionState.populateFields(source[key], target.controls[key]);
//       });
//     } else if (target instanceof FormArray) {
//       for (let i = 0; i < source.length; i++) {
//         SubmissionState.populateFields(source[i], target.controls[i]);
//       }
//     } else if (!!target) {
//       target.setValue(source);
//     }
//   }
//
//   static enableDisableControls(control: AbstractControl, flag: boolean): void {
//     if (control instanceof FormGroup) {
//       Object.keys(control.controls).forEach(key => {
//         SubmissionState.enableDisableControls(control.controls[key], flag);
//       });
//     } else if (control instanceof FormArray) {
//       for (const ctrl of control.controls) {
//         SubmissionState.enableDisableControls(ctrl, flag);
//       }
//     } else {
//       flag ? control.enable() : control.disable();
//     }
//   }
//
//   private buildContactControls(): FormArray {
//     const contacts = new FormArray([]);
//     for (const _ of [...Array(this.numContacts).keys()]) {
//       const contact = this.fb.group({
//         name: this.fb.control(''),
//         role: this.fb.control(''),
//         email: this.fb.control(''),
//         phone: this.fb.control('')
//       });
//       contacts.push(contact);
//     }
//     return contacts;
//   }
//
//   public submission(): any {
//     const organization = this.organization.value;
//     const review = this.review.value;
//
//     if (this.review.controls.siteLocState.value) {
//       review.address = organization.address;
//     }
//     review.cost = SubmissionState.roundCurrency(review.cost);
//     review.stipend = SubmissionState.roundCurrency(review.stipend);
//
//     delete review.siteLocState;
//
//     return { organization, review };
//   }
// }
