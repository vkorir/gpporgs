import { Component, OnInit, ViewChild } from "@angular/core";
import { MatTableDataSource } from "@angular/material";
import { User } from "../../model/user";
import { AppService } from "../../app.service";
import { MatSnackBar } from "@angular/material/snack-bar";
import { MatPaginator } from "@angular/material/paginator";
import {
  animate,
  state,
  style,
  transition,
  trigger,
} from "@angular/animations";

@Component({
  selector: "app-all-users",
  templateUrl: "./manage-users.component.html",
  styleUrls: ["./manage-users.component.scss"],
  animations: [
    trigger("detailExpand", [
      state("collapsed", style({ height: "0px", minHeight: "0" })),
      state("expanded", style({ height: "44px", padding: "8px" })),
      transition(
        "expanded <=> collapsed",
        animate("225ms cubic-bezier(0.4, 0.0, 0.2, 1)")
      ),
    ]),
  ],
})
export class ManageUsersComponent implements OnInit {
  dataSource: MatTableDataSource<User>;
  displayedColumns = [
    "name",
    "accessLevel",
    "created",
    "lastLogin",
    "numberOfLogin",
    "hasAccess",
    "manageRole",
  ];

  expandedUser: User;

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService, private snackBar: MatSnackBar) {
    this.appService.users.subscribe((users) => {
      this.dataSource = new MatTableDataSource<User>(users);
      setTimeout(() => (this.dataSource.paginator = this.paginator));
    });
  }

  ngOnInit() {}

  isCurrentUser(id: number): boolean {
    return id == this.appService.user.getValue().id;
  }

  displayName(user: User): string {
    if (user.firstName && user.lastName) {
      return `${user.lastName}, ${user.firstName}`;
    }
    return user.email;
  }

  formatDate(creationDate: string): string {
    return this.appService.formatDate(creationDate);
  }

  roleChanged(id: number, isAdmin: boolean): void {
    if (id === this.appService.user.getValue().id) {
      this.appService.openSnackBar(
        this.snackBar,
        "Cannot change your own roles"
      );
      return;
    }
    const mutation = `mutation { updateUser(user: ${this.appService.queryFy({
      id,
      isAdmin,
    })}) { id } }`;
    this.appService.mutationService(mutation).subscribe(({ updateUser }) => {
      if (updateUser && updateUser.id) {
        const users = this.appService.users.getValue().map((value) => {
          if (value.id == updateUser.id) {
            const user = Object.assign(new User(), value);
            user.isAdmin = !user.isAdmin;
            this.expandedUser = user;
            return user;
          }
          return value;
        });
        this.appService.users.next(users);
        this.appService.openSnackBar(
          this.snackBar,
          `Updated roles for ${
            this.expandedUser.firstName || this.expandedUser.email
          }`
        );
      } else {
        this.appService.openSnackBar(this.snackBar, "An error occurred");
      }
    });
  }
}
