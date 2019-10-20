import { Component, OnInit, ViewChild } from '@angular/core';
import { Organization } from '../model/organization';
import { AppService } from '../app.service';
import { MatSort, MatTableDataSource } from '@angular/material';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {

  private displayedColumns: string[] = ['name', 'type', 'location', 'sectors'];
  private dataSource: MatTableDataSource<Organization> = new MatTableDataSource();
  private organizationsFilter: Observable<string>;
  private area = 'all';
  private sectorIds = [];

  @ViewChild(MatSort, { static: true }) sort: MatSort;

  constructor(private appService: AppService) {
    const org1 = {id: 0, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org2 = {id: 1, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    this.dataSource = new MatTableDataSource<Organization>([org1, org2]);
    this.organizationsFilter = this.appService.getOrganizationsFilter();
  }

  ngOnInit() {
    this.dataSource.sort = this.sort;
    const query = `{ organizations { id name type { name } address { country { name } } sectors } }`;
    this.appService.queryService(query).subscribe(({ organizations }) => {
      // this.dataSource = new MatTableDataSource<Organization>(organizations);
    });
    this.organizationsFilter.subscribe(filterValue => {
      if (!!filterValue) {
        this.dataSource.filter = filterValue.trim().toLocaleLowerCase();
      }
    });
  }
}
