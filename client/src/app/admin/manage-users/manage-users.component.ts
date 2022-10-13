import { Component, OnInit, ViewChild } from "@angular/core";
import { MatTableDataSource } from "@angular/material";
import { User } from "src/app/models";
import { AppService } from "src/app/app.service";
import { MatPaginator } from "@angular/material/paginator";
import {
  animate,
  state,
  style,
  transition,
  trigger,
} from "@angular/animations";
import { deepCopy } from "src/app/util";

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

  constructor(private appService: AppService) {
    this.appService.usersAll.subscribe(users => {
      this.dataSource = new MatTableDataSource<User>(deepCopy<Array<User>>(users));
      setTimeout(() => this.dataSource.paginator = this.paginator);
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
      this.appService.openSnackBar("Cannot change your own roles");
      return;
    }
    const mutation = `mutation { updateUser(user: ${this.appService.queryFy({id, isAdmin})}) { id isAdmin } }`;
    this.appService.mutationService(mutation).subscribe(({ updateUser }) => {
      if (updateUser && updateUser.id) {
        const users = deepCopy<User[]>(this.appService.usersAll.getValue());
        users.forEach(user => {
          if (user.id == updateUser.id) {
            user.isAdmin = updateUser.isAdmin;
            this.expandedUser = user;
          }
        });
        this.appService.usersAll.next(users);
        this.appService.openSnackBar(`Updated roles for ${this.expandedUser.firstName || this.expandedUser.email}`);
      } else {
        this.appService.openSnackBar( "An error occurred");
      }
    });
  }
}
