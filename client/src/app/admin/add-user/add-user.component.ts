import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material';
import { FormControl, Validators } from '@angular/forms';
import { AppService } from '../../app.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.scss']
})
export class AddUserComponent implements OnInit {

  inputControl: FormControl = new FormControl(null, [Validators.required, Validators.email]);

  constructor(private dialogRef: MatDialogRef<AddUserComponent>,
              private appService: AppService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {}

  addUser(): void {
    const now = new Date().getTime();
    const mutation = `mutation { createUser(user: { email: "${this.inputControl.value}", creationTime: ${now} }) { email }}`;
    this.appService.mutationService(mutation).subscribe(({ createUser }) => {
      if (createUser && createUser.email) {
        this.appService.openSnackBar(this.snackBar, `Successfully added ${createUser.email}`);
      }
      this.inputControl.setValue(null);
      this.inputControl.markAsUntouched();
    });
  }
}
