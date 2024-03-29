import { Component, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog } from '@angular/material';
import { AddUserComponent } from './add-user/add-user.component';
import { ManageUsersComponent } from './manage-users/manage-users.component';
import { ManageOrganizationsComponent } from './manage-organizations/manage-organizations.component';
import { Organization, User } from '../models';

import * as jsonFile from 'src/app/organizations.json'

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
    }
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
    this.appService.queryService(query).subscribe(data => {
      const users = data.users.map(usr => Object.assign(new User(), usr));
      this.appService.usersAll.next(users);
      this.actions[index].isLoading = false;
      this.dialog.open(ManageUsersComponent, {
        panelClass: 'mat-dialog--md',
      });
    });
  }

  manageOrganizations(index: number): void {
    this.actions[index].isLoading = true;
    const query = '{ organizations(approved: false) { id name address { id country { code value } } type { id value } region { id value } created approved }}';
    this.appService.queryService(query).subscribe(data => {
      const organizations = data.organizations.map(org => new Organization(org));
      this.appService.organizationsAll.next(organizations);
      this.actions[index].isLoading = false;
      this.dialog.open(ManageOrganizationsComponent, {
        panelClass: 'mat-dialog--md'
      });
    });
  }

  // loadOrgs() {
  //   const orgs = (jsonFile as any).default as any[];
  //   let mutation;
  //   orgs.forEach(org => {
  //     org['approved'] = org['approved'] == 1;
  //     const revs = org['reviews'];
  //     delete org['reviews'];
  //     mutation = `mutation { createOrganization(org: ${this.appService.queryFy(org)}) { id } }`
  //     this.appService.mutationService(mutation).subscribe(data => {
  //       if (!!data) {
  //         revs.forEach(rev => {
  //           rev['anonymous'] = rev['anonymous'] == 1;
  //           mutation = `mutation { createReview(orgId:${data.createOrganization.id}, rev: ${this.appService.queryFy(rev)}) { id } }`
  //           this.appService.mutationService(mutation).subscribe(data => {
  //             if (!data) {
  //               console.log(mutation);
  //             }
  //           });
  //         });
  //       } else {
  //         console.log(mutation);
  //       }
  //     });
  //   });
  // }
}
