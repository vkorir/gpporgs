import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { AddUserComponent } from './add-user/add-user.component';
import { ManageUsersComponent } from './manage-users/manage-users.component';
import { OrganizationsComponent } from './organizations/organizations.component';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit {

  actions = [
    {
      title: 'Add User',
      action: () => this.addUser(),
      icon: 'person_add',
      description: 'Add a new user from CAS. A user will not be able to access this site before they are added.'
    }, {
      title: 'Manage Users',
      action: () => this.manageUsers(),
      icon: 'group',
      description: 'View and manage roles for all the current GPPORGS users (student & admin roles)'
    }, {
      title: 'Organizations',
      action: () => this.organizations(),
      icon: 'list',
      description: 'View and filter all the GPPORGS organizations'
    }];

  constructor(private appService: AppService, private dialog: MatDialog) {}

  ngOnInit() {}

  addUser(): void {
    this.dialog.open(AddUserComponent, {
      panelClass: 'mat-dialog--sm',
      disableClose: true
    });
  }

  manageUsers(): void {
    const query = '{ users { id firstName lastName isAdmin creationTime numberOfLogin lastLogin } }';
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(ManageUsersComponent, {
        panelClass: 'mat-dialog--sm',
        data
      });
    });
  }

  organizations(): void {
    const query = '{ organizations { id name address { country } submitted approved }}';
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(OrganizationsComponent, {
        panelClass: 'mat-dialog--md',
        data
      });
    });
  }
}
