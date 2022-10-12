import { Component, OnInit } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";
import { AppService } from "src/app/app.service";
import { MatSnackBar } from "@angular/material/snack-bar";
import { User } from "src/app/models";
import { deepCopy } from "src/app/util";

@Component({
  selector: "app-add-user",
  templateUrl: "./add-user.component.html",
  styleUrls: ["./add-user.component.scss"],
})
export class AddUserComponent implements OnInit {
  inputControl: FormControl = new FormControl(null, [Validators.required]);
  domain: string = "@berkeley.edu";

  constructor(private appService: AppService, private snackBar: MatSnackBar) {}

  ngOnInit() {}

  addUser(): void {
    const user = {
      id: null,
      email: `${this.inputControl.value}${this.domain}`,
      hasAccess: true
    };
    const details = "{ id email firstName lastName isAdmin created lastLogin numberOfLogin }";
    const mutation = `mutation { createUser(user: ${this.appService.queryFy(user)}) ${details}}`;
    this.appService.mutationService(mutation).subscribe(({ createUser }) => {
      if (createUser && createUser.id) {
        const users = deepCopy<Array<User>>(this.appService.usersAll.getValue());
        users.push(deepCopy<User>(createUser));
        this.appService.usersAll.next(users);
        this.appService.openSnackBar(`Successfully added ${createUser.email}`);
      }
      this.inputControl.setValue(null);
      this.inputControl.markAsUntouched();
    });
  }
}
