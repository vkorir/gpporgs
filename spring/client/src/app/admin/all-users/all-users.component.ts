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
    const lastAccess = new Date(timestamp);
    const month = lastAccess.getMonth() + 1;
    const date = lastAccess.getDate() + 1;
    const year = lastAccess.getFullYear();
    const hours = lastAccess.getHours();
    const minutes = lastAccess.getMinutes();
    return `${month}/${date}/${year} ${hours}:${minutes < 10 ? '0' + minutes : minutes}`;
  }
}
