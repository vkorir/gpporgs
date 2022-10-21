import { Component, Inject, Input, OnDestroy, OnInit } from '@angular/core';
import { AbstractControl, Form, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange, MAT_DIALOG_DATA } from '@angular/material';
import { Subject } from 'rxjs';
import { AppService } from 'src/app/app.service';
import { Address, Affiliation, Contact, Country, Language, Mode, Organization, Region, Sector, Type } from 'src/app/models';
import { buildForm } from '../main-modal-util';

@Component({
  selector: 'app-organization',
  templateUrl: './organization.component.html',
  styleUrls: ['../main-modal.component.scss']
})
export class OrganizationComponent implements OnInit, OnDestroy {
  
  organization: FormGroup;
  
  affiliations: Affiliation[] = [];
  regions: Region[] = [];
  sectors: Sector[] = [];
  types: Type[] = [];
  countries: Country[] = [];

  isAdmin: boolean;
  mode: Mode;
  Mode = Mode;

  validationSchema = {
    name: [Validators.required],
    region: [Validators.required],
    address: { country: [Validators.required]},
    affiliations: [Validators.required],
    type: [Validators.required],
    sectors: [Validators.required]
  }

  @Input()
  orgAction: Subject<Mode>;

  constructor(private fb: FormBuilder, private appService: AppService, @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
    this.affiliations = this.appService.affiliations.slice();
    this.regions = this.appService.regions.slice();
    this.sectors = this.appService.sectors.slice();
    this.types = this.appService.types.slice();
    this.countries = this.appService.countries.slice();
    this.isAdmin = this.appService.user.getValue().isAdmin;
    this.mode = this.data.mode;
    this.orgAction.subscribe(mode => {
      if (mode == Mode.EDIT) {
        this.edit();
      } else if (mode == Mode.VIEW) {
        this.save();
      }
    });
    this.organization = this.buildForm(new Organization(this.data.organization), this.mode != Mode.EDIT, this.validationSchema) as FormGroup;
  }

  ngOnDestroy() {
    this.orgAction.unsubscribe();
  }

  contacts(): FormGroup[] {
    return (this.organization.controls.contacts as FormArray).controls as FormGroup[];
  }

  compareId(object: Affiliation | Type | Region, other: Affiliation | Type | Region): boolean {
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

  formatDate(creationDate: string): string {
    return this.appService.formatDate(creationDate);
  }

  checkboxChange(formArr: FormArray, value: any) {
    const items = [];
    let found = false;
    for (let idx = 0; idx < formArr.length; idx++) {
      if (formArr.value[idx].id == value.id) {
        found = true;
        continue;
      }
      if (!found) {
        items.push(Object.assign({}, formArr.value[idx]));
      }
    }
    items.push(Object.assign({}, value));
    formArr.setValue(items);
  }

  radioChange(event: MatRadioChange): void {
    this.organization.controls.type.setValue({ ...event.value });
  }

  buildForm(data: any, disabled: boolean, validators?: any): AbstractControl {
    if (data instanceof Organization || data instanceof Address || data instanceof Contact) {
      const fgContent = {};
      Object.keys(data).forEach(key => fgContent[key] = this.buildForm(data[key], disabled, (validators || {} as any)[key]));
      return this.fb.group(fgContent);
    }
    if (Array.isArray(data)) {
      return this.fb.array(data.map((item, idx) => this.buildForm(item, disabled, (validators || {} as any)[idx])), validators);
    }
    return this.fb.control({ value: data, disabled }, (validators || []));
  }

  edit() {
    this.organization.enable();
    this.mode = Mode.EDIT;
  }

  save() {
    this.organization.disable();
    this.mode = Mode.VIEW;
  }

}
