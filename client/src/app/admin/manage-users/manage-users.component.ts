import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material';
import { User } from '../../model/user';
import { AppService } from '../../app.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatPaginator } from '@angular/material/paginator';
import { animate, state, style, transition, trigger } from '@angular/animations';

@Component({
  selector: 'app-all-users',
  templateUrl: './manage-users.component.html',
  styleUrls: ['./manage-users.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '44px', padding: '8px' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)'))
    ])
  ]
})
export class ManageUsersComponent implements OnInit {

  dataSource = new MatTableDataSource<User>();
  columns = ['name', 'accessLevel', 'creationTime', 'lastLogin', 'numberOfLogin', 'manageRole'];

  expandedElement = null;

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar) {
    this.appService.users.subscribe(value => {
      this.dataSource = new MatTableDataSource<User>(value);
      setTimeout(() => this.dataSource.paginator = this.paginator);
    });
  }

  ngOnInit() {}

  displayName(user: User): string {
    if (user.firstName && user.lastName) {
      return `${user.lastName}, ${user.firstName}`;
    }
    return user.email;
  }

  date(timestamp: number | null): string {
    if (!timestamp) {
      return '-';
    }
    const lastAccess = new Date(timestamp);
    const month = `0${lastAccess.getMonth() + 1}`.slice(-2);
    const date = `0${lastAccess.getDate() + 1}`.slice(-2);
    const year = lastAccess.getFullYear();
    const hours = `0${lastAccess.getHours()}`.slice(-2);
    const minutes = `0${lastAccess.getMinutes()}`.slice(-2);
    const seconds = `0${lastAccess.getSeconds()}`.slice(-2);
    return `${month}/${date}/${year} ${hours}:${minutes}:${seconds}`;
  }

  roleChanged(user: User): void {
    if (user.id === this.appService.user.getValue().id) {
      this.appService.openSnackBar(this.snackBar, 'Cannot change own roles');
      return;
    }
    const mutation = `mutation { updateUser(id: "${user.id}", details: { isAdmin: ${!user.isAdmin} }) { id, firstName } }`;
    this.appService.mutationService(mutation).subscribe(({ updateUser }) => {
      if (updateUser && updateUser.id) {
        setTimeout(() => user.isAdmin = !user.isAdmin, 300);
        user.isAdmin
        this.appService.openSnackBar(this.snackBar, `Updated roles for ${updateUser.firstName}`);
      } else {
        this.appService.openSnackBar(this.snackBar, 'An error occurred');
      }
    });
  }
}
