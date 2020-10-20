import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { AddUserComponent } from './add-user/add-user.component';
import { ManageUsersComponent } from './manage-users/manage-users.component';
import { OrganizationsComponent } from './manage-organizations/manage-organizations.component';
import { Organization } from '../model/organization';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss'],
})
export class AdminComponent implements OnInit {
  actions = [
    {
      title: 'Add User',
      action: (_) => this.addUser(),
      icon: 'person_add',
      description:
        'Add a new user from CAS. A user will not be able to access this site before they are added.',
      isLoading: false,
    },
    {
      title: 'Manage Users',
      action: (index) => this.manageUsers(index),
      icon: 'group',
      description:
        'View and manage roles for all the current GPPORGS users (student & admin roles)',
      isLoading: false,
    },
    {
      title: 'Manage Organizations',
      action: (index) => this.manageOrganizations(index),
      icon: 'list',
      description: 'View and filter all the GPPORGS organizations',
      isLoading: false,
    },
  ];

  constructor(private appService: AppService, private dialog: MatDialog) {}

  ngOnInit() {}

  addUser(): void {
    this.dialog.open(AddUserComponent, {
      panelClass: 'mat-dialog--xm',
      disableClose: true,
    });
  }

  manageUsers(index: number): void {
    this.actions[index].isLoading = true;
    const query = '{ users { id email firstName lastName isAdmin created lastLogin numberOfLogin hasAccess } }';
    this.appService.queryService(query).subscribe((data) => {
      this.appService.users.next(data.users);
      this.actions[index].isLoading = false;
      this.dialog.open(ManageUsersComponent, {
        panelClass: 'mat-dialog--md',
      });
    });
  }

  manageOrganizations(index: number): void {
    this.actions[index].isLoading = true;
    const query = '{ organizations { id name address { country } created approved }}';
    this.appService.queryService(query).subscribe((data) => {
      if (!!data.organizations) {
        this.appService.organizations.next(data.organizations.map(value => Object.assign(new Organization(), value)));
      }
      this.actions[index].isLoading = false;
      this.dialog.open(OrganizationsComponent, {
        panelClass: 'mat-dialog--md'
      });
    });
  }
}
