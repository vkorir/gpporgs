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

  inputControl: FormControl = new FormControl(null, [Validators.required]);

  constructor(private dialogRef: MatDialogRef<AddUserComponent>,
              private appService: AppService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {}

  addUser(): void {
    const now = new Date().getTime();
    const mutation = `mutation { createUser(user: { id: "${this.inputControl.value}", creationTime: ${now} }) { id }}`;
    this.appService.mutationService(mutation).subscribe(response => {
      if (response.data.createUser.id != null) {
        this.appService.openSnackBar(this.snackBar, `Successfully added ${response.data.createUser.id}`);
      }
      this.inputControl.setValue(null);
      this.inputControl.markAsUntouched();
    });
  }
}
