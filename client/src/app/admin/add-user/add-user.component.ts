import { Component, OnInit } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";
import { AppService } from "src/app/app.service";
import { MatSnackBar } from "@angular/material/snack-bar";
import { User } from "src/app/models";

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
      id: 0,
      email: `${this.inputControl.value}${this.domain}`,
      hasAccess: true
    };
    const details = "{ id email firstName lastName isAdmin created lastLogin numberOfLogin }";
    const mutation = `mutation { createUser(user: ${this.appService.queryFy(user)}) ${details}}`;
    this.appService.mutationService(mutation).subscribe(({ createUser }) => {
      if (createUser && createUser.id) {
        const users = this.appService.usersAll.getValue().map(usr => Object.assign(new User(), usr));
        users.push(Object.assign(new User(), createUser));
        this.appService.usersAll.next(users);
        this.appService.openSnackBar(`Successfully added ${createUser.email}`);
      }
      this.inputControl.setValue(null);
      this.inputControl.markAsUntouched();
    });
  }
}
