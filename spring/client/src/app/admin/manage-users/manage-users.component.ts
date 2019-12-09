import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA, MatTableDataSource } from '@angular/material';
import { User } from '../../model/user';
import { MatDialogRef } from '@angular/material/dialog';
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

  dataSource: MatTableDataSource<User>;
  columns = ['name', 'accessLevel', 'lastLogin', 'numberOfLogin', 'manageRole'];

  expandedElement = null;

  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

  constructor(private dialogRef: MatDialogRef<ManageUsersComponent>,
              private appService: AppService,
              private snackBar: MatSnackBar,
              @Inject(MAT_DIALOG_DATA) private data: any) {
    this.dataSource = new MatTableDataSource<User>(data.users);
    this.dataSource.paginator = this.paginator;
    // data.users.map(user => user.adminControl = new FormControl(user.isAdmin));
  }

  ngOnInit() {}

  date(timestamp: number): string {
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
    if (user.id === this.appService.userValue().id) {
      this.appService.openSnackBar(this.snackBar, 'Cannot manage your roles');
      return;
    }
    const mutation = `mutation { updateUser(id: "${user.id}", details: { isAdmin: ${!user.isAdmin} }) { id, firstName } }`;
    this.appService.mutationService(mutation).subscribe(({ updateUser }) => {
      if (updateUser && updateUser.id) {
        setTimeout(() => user.isAdmin = !user.isAdmin, 300);
        this.appService.openSnackBar(this.snackBar, `Updated roles for ${updateUser.firstName}`);
      } else {
        this.appService.openSnackBar(this.snackBar, 'An error occurred');
      }
    });
  }
}
