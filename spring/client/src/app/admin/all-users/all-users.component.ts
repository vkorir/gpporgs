import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatTableDataSource } from '@angular/material';
import { User } from '../../model/user';

@Component({
  selector: 'app-all-users',
  templateUrl: './all-users.component.html',
  styleUrls: ['./all-users.component.scss']
})
export class AllUsersComponent implements OnInit {

  users: MatTableDataSource<User>;
  columns = ['name', 'accessLevel', 'lastAccess'];

  constructor(@Inject(MAT_DIALOG_DATA) private data: any) {
    this.users = new MatTableDataSource<User>(data.users);
  }

  ngOnInit() {
  }

  date(timestamp: number): string {
    const date = new Date(timestamp);
    return `${date.getMonth() + 1}/${date.getDate() + 1}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`;
  }
}
