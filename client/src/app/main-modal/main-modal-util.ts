import { AbstractControl, FormBuilder } from "@angular/forms";
import { Address, Contact, Organization, Review } from "../models";

export function buildForm(fb: FormBuilder, value: any, disabled: boolean, validators?: any): AbstractControl {
    if (value instanceof Organization || value instanceof Review || value instanceof Address || value instanceof Contact) {
        const formGroup = this.fb.group({});
        Object.keys(value).forEach(key => formGroup.setControl(key, this.buildForm(value[key], disabled, (validators || {} as any)[key])));
        return formGroup;
      }
    if (Array.isArray(value) && value[0] instanceof Contact) {
        return this.fb.array(value.map((item, idx) => this.buildForm(item, disabled, (validators || {} as any)[idx])));
    } 
    return fb.control({ value, disabled }, (validators || []));
}