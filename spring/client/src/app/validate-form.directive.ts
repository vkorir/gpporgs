import { Directive, EventEmitter, HostListener, Output } from '@angular/core';
import { NgForm } from '@angular/forms';

@Directive({
  selector: '[appValidateForm]'
})
export class ValidateFormDirective {

  // tslint:disable-next-line:no-output-rename
  @Output('appValidateForm') valid = new EventEmitter<void>();

  constructor(private formRef: NgForm) { }

  @HostListener('click')
  handleClick(): void {
    this.markFieldsAsDirty();
    this.emitIfValid();
  }

  private markFieldsAsDirty(): void {
    Object.keys(this.formRef.controls).forEach(controlKey => {
      this.formRef.controls[controlKey].markAsDirty();
    });
  }

  private emitIfValid(): void {
    if (this.formRef.valid) {
      this.valid.emit();
    }
  }
}
