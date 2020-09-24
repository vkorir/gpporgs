import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { AppService } from '../../app.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { User } from 'src/app/model/user';

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.scss']
})
export class AddUserComponent implements OnInit {

  inputControl: FormControl = new FormControl(null, [Validators.required, Validators.email]);

  constructor(private appService: AppService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {}

  addUser(): void {
    const email = this.inputControl.value;
    if (email.substring(email.indexOf('@')) !== '@berkeley.edu') {
      this.appService.openSnackBar(this.snackBar, 'Enter a berkeley.edu email');
      return;
    }
    const user = new User();
    user.email = email;
    const mutation = `mutation { createUser(user: ${this.appService.queryFy(user)}) { email }}`;
    this.appService.mutationService(mutation).subscribe(({ createUser }) => {
      if (createUser && createUser.email) {
        this.appService.openSnackBar(this.snackBar, `Successfully added ${createUser.email} with role 'Student'`);

        const users = this.appService.users.getValue();
        if (Array.isArray(users)) {
          (users as Array<any>).push(user);
        }
        this.appService.users.next(users);
      }
      this.inputControl.setValue(null);
      this.inputControl.markAsUntouched();
    });
  }
}
