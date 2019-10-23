import { Component, OnInit, ViewChild } from '@angular/core';
import { Organization } from '../model/organization';
import { AppService } from '../app.service';
import { MatDialog, MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { Observable } from 'rxjs';
import { Filter } from '../model/filter';
import { DetailsComponent } from '../details/details.component';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {

  private displayedColumns: string[] = ['name', 'type', 'location', 'sectors'];
  private dataSource: MatTableDataSource<Organization> = new MatTableDataSource();
  private filter: Observable<Filter>;
  private sectorIds = [];

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

  constructor(private appService: AppService, private dialog: MatDialog) {
    const org1 = {id: 0, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org2 = {id: 1, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org3 = {id: 2, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org4 = {id: 3, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org5 = {id: 4, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org6 = {id: 5, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org7 = {id: 6, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org8 = {id: 7, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org9 = {id: 8, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org10 = {id: 9, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org11 = {id: 10, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org12 = {id: 11, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org121 = {id: 11, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org21 = {id: 11, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org31 = {id: 25, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org41 = {id: 31, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org51 = {id: 47, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org61 = {id: 85, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org71 = {id: 26, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org81 = {id: 76, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org91 = {id: 89, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org1011 = {id: 39, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org111 = {id: 10, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org3121 = {id: 111, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org15 = {id: 39, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    const org67 = {id: 10, type: 'Test Type', name: 'Test', location: 'Kenya', sectors: ['Education', 'Tourism']};
    const org39 = {id: 111, type: 'Type B', name: 'Exam', location: 'US', sectors: ['Policy', 'Politics']};
    this.dataSource = new MatTableDataSource<Organization>([org1, org2, org3, org4, org5, org6, org7, org8, org9, org10, org11, org12,
    org121, org21, org31, org41, org51, org71, org91, org1011, org3121, org111, org61, org81, org15, org67, org39]);
    this.filter = this.appService.filterState();
  }

  ngOnInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    const query = `{ organizations { id name type { value } address { country { value } } sectors } }`;
    this.appService.queryService(query).subscribe(({ organizations }) => {
      // this.dataSource = new MatTableDataSource<Organization>(organizations as [Organization]);
    });
    this.filter.subscribe(filter => {
      this.dataSource.filter = filter.searchString.trim().toLocaleLowerCase();
    });
  }

  updatePagination() {
    console.log(this.paginator.pageSize);
  }

  openDetailsModal(id: number) {
    this.dialog.open(DetailsComponent, {
      panelClass: 'mat-dialog--md'
    });
    console.log(this.paginator.pageSize);
    console.log(this.paginator.pageIndex);
  }
}
