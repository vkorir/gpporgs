import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { AppService } from '../app.service';

export class SubmissionState {

  readonly numContacts = 3;
  organization: FormGroup;
  review: FormGroup;

  orgInputFields = ['name', 'street', 'phone', 'city', 'email', 'state', 'website', 'zip'];
  orgOtherFields = ['type'];
  reviewInputFields = ['siteLocState', 'languages', 'difficulties', 'type', 'cost', 'stipend', 'duration', 'safety',
    'responsiveness', 'anonymous'];
  reviewTextFields = [
    {
      control: 'workDone',
      placeholder: 'Please describe the work that you did with your organization'
    },
    {
      control: 'typicalDay',
      placeholder: 'What was a typical day like while on your PE? (please consider housing, food, travel, weather, etc)'
    },
    {
      control: 'evaluation',
      placeholder: 'What were your organization\'s strengths and weaknesses?'
    },
    {
      control: 'other',
      placeholder: 'Is there anything else you would like to share with other students who may work with this organization?'
    }
  ];
  addressFields = ['street', 'city', 'state', 'zip', 'country'];
  contactFields = ['name', 'role', 'email', 'phone'];
  selectFields = ['region', 'country'];
  checkboxFields = new Map<string, number>();

  constructor(private fb: FormBuilder, appService: AppService) {
    this.checkboxFields.set('affiliations', appService.affiliations.size);
    this.checkboxFields.set('sectors', appService.sectors.size);
    this.organization = fb.group({
      affiliations: fb.array([]),
      sectors: fb.array([])
    });
    this.review = fb.group({ sectors: fb.array([]) });
    const orgControls = this.orgInputFields.concat(this.orgOtherFields, this.selectFields);
    this.buildControls(this.organization, orgControls);
    const reviewTextControls = this.reviewTextFields.map(field => field.control);
    const reviewControls = this.reviewInputFields.concat(reviewTextControls, this.addressFields, this.selectFields);
    this.buildControls(this.review, reviewControls);
    this.buildCheckboxControls(this.organization);
    this.buildCheckboxControls(this.review);
    this.buildContactControls();
  }

  private buildControls(group: FormGroup, fieldNames: string[]): void {
    fieldNames.forEach(fieldName => {
      group.setControl(fieldName, new FormControl());
    });
  }

  private readControls(group: FormGroup, target: any): void {
    const contactFields = new Set<string>(this.getContactKeys().map(key => key.control));
    Object.keys(group.controls).forEach(controlKey => {
      if (this.addressFields.includes(controlKey)) {
        target.address[controlKey] = group.get(controlKey).value;
      } else if (contactFields.has(controlKey)) {  // read contacts later
        target[controlKey] = group.get(controlKey).value;
      }
    });
  }

  private buildCheckboxControls(group: FormGroup): void {
    for (const key of Array.from(this.checkboxFields.keys())) {
      if (!!group.controls[key]) {
        const numControls = this.checkboxFields.get(key);
        for (let i = 0; i < numControls; i++) {
          const formArray = group.get(key) as FormArray;
          formArray.push(new FormControl(false));
        }
      }
    }
  }

  private readCheckboxControls(group: FormGroup, target: any): void {
    for (const key of Array.from(this.checkboxFields.keys())) {
      if (!!group.controls[key]) {
        target[key] = [];
        const formArray = group.controls[key];
        const numControls = this.checkboxFields.get(key);
        for (let i = 0; i < numControls; i++) {
          if (formArray[i].value) {
            target[key].push(i + 1); // checkbox id = (index + 1)
          }
        }
      }
    }
  }

  private buildContactControls(): void {
    for (const key of this.getContactKeys()) {
      this.organization.setControl(key.control, new FormControl());
    }
  }

  private readContacts(target: any): void {
    const contacts = [];
    for (const _ of [...Array(this.numContacts).keys()]) {
      contacts.push({});
    }
    for (const key of this.getContactKeys()) {
      const control = this.organization.controls[key.control];
      contacts[key.index][key.name] = control.value;
    }
    target.contacts = contacts;
  }

  getContactKeys(): any[] {
    const keys = [];
    for (const i of [...Array(this.numContacts).keys()]) {
      this.contactFields.forEach(fieldName => {
        keys.push({
          control: `contact-${i}-${fieldName}`,
          name: fieldName,
          index: i
        });
      });
    }
    return keys;
  }

  public submission(): any {
    const organization = { address: {}};
    const review = { address: {}};

    this.readControls(this.organization, organization);
    this.readControls(this.review, review);
    this.readCheckboxControls(this.organization, organization);
    this.readCheckboxControls(this.review, review);
    this.readContacts(organization);

    if (this.review.controls.isSameAddr.value) {
      review.address = organization.address;
    }

    return { organization, review };
  }
}
