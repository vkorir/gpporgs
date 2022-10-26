import { AfterViewInit, Component, Inject, Input, OnDestroy, OnInit } from '@angular/core';
import { AbstractControl, Form, FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatRadioChange, MAT_DIALOG_DATA } from '@angular/material';
import { BehaviorSubject, Subject } from 'rxjs';
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
  mode = Mode.EDIT;
  Mode = Mode;

  typeOther: boolean;
  sectorOther: boolean;

  validationSchema = {
    name: [Validators.required],
    region: [Validators.required],
    address: { country: [Validators.required] },
    affiliations: [Validators.required],
    type: [Validators.required],
    sectors: [Validators.required]
  }

  @Input()
  orgAction: Subject<Mode>;

  constructor(private fb: FormBuilder, private appService: AppService, @Inject(MAT_DIALOG_DATA) public data: any) {}

  ngOnInit() {
    const org = new Organization(this.data.organization);
    this.affiliations = this.appService.affiliations.map(aff => Object.assign({}, { ...aff, checked: this.contains(org.affiliations, aff.id) }));
    this.regions = this.appService.regions.slice();
    this.sectors = this.appService.sectors.map(sec => Object.assign({}, {...sec, checked: this.contains(org.sectors, sec.id)}));
    this.types = this.appService.types.map(typ => Object.assign({}, {...typ, checked: org.type.id == typ.id}));
    this.countries = this.appService.countries.slice();
    this.isAdmin = this.appService.user.getValue().isAdmin;
    this.mode = this.data.mode;
    this.typeOther = org.type.id == this.types.length ? true : false;
    this.sectorOther = this.contains(org.sectors, this.sectors.length);
    this.orgAction.subscribe(mode => {
      if (mode == Mode.EDIT) {
        this.edit();
      } else if (mode == Mode.VIEW) {
        this.save();
      }
    });
    this.organization = this.buildForm(org, this.data.mode == Mode.VIEW, this.validationSchema) as FormGroup;
  }

  ngOnDestroy() {
    this.orgAction.unsubscribe();
    this.organization.reset();
  }

  buildForm(data: any, disabled: boolean, validators?: any): AbstractControl {
    if (data instanceof Organization || data instanceof Address || data instanceof Contact) {
      const fgContent = {};
      Object.keys(data).forEach(key => fgContent[key] = this.buildForm(data[key], disabled, (validators || {} as any)[key]));
      return this.fb.group(fgContent);
    }
    if (Array.isArray(data) && data.length > 0 && data[0] instanceof Contact) {
      return this.fb.array(data.map((item, idx) => this.buildForm(item, disabled, (validators || {} as any)[idx])), validators);
    }
    return this.fb.control({ value: data, disabled }, (validators || []));
  }

  formatDate(creationDate: string): string {
    return this.appService.formatDate(creationDate);
  }

  checkMode(mode: Mode): boolean {
    return this.mode === mode;
  }
  
  compare(object?: any, other?: any): boolean {
    return !!object && !!other && (object.id || object.code) != undefined && (object.id || object.code == other.id || object.code);
  }

  values(collection: any[], other?: string): string {
    return collection.map(itm => itm.value.toLowerCase() == 'other' ? other : itm.value).join(', ');
  }

  contains(collection: any[], target: number | string): boolean {
    for (let idx = 0; idx < collection.length; idx++) {
      if ((collection[idx].id || collection[idx].code) === target) {
        return true;
      }
    }
    return false;
  }

  onSectorChange(fc: FormControl, value: any) {
    this.onCheckboxChange(fc, value);
    if (value.id == this.sectors.length) {
      this.sectorOther = value.checked;
      if (!value.checked) {
        this.organization.controls.sectorOther.setValue('');
      }
    }
  }

  onCheckboxChange(fc: FormControl, value: any) {
    value.checked = !value.checked;
    const items = [];
    fc.value.forEach(val => {
      if (val.id != value.id) {
        items.push(Object.assign({}, val));
      }
    });
    if (value.checked) {
      items.push({ id: value.id, value: value.value });
    }
    fc.setValue(items);
    console.log(fc.value)
  }

  onRadioChange(event: MatRadioChange): void {
    this.organization.controls.type.setValue({ id: event.value.id, value: event.value.value });
    this.typeOther = event.value.id == this.types.length ? true : false;
    if (!this.typeOther) {
      this.organization.controls.typeOther.setValue('');
      console.log(this.organization.controls.typeOther.value);
    }
    console.log(this.organization.controls.type.value);
  }

  edit() {
    this.organization.enable();
    this.mode = Mode.EDIT;
  }

  save() {
    console.log(this.organization.valid);
    console.log(this.organization.value);
    // this.organization.disable();
    // this.mode = Mode.VIEW;
  }

}
