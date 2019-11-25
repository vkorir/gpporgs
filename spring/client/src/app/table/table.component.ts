import { Component, OnInit, ViewChild } from '@angular/core';
import { AppService } from '../app.service';
import { MatDialog, MatPaginator, MatSort, MatTableDataSource } from '@angular/material';
import { Observable } from 'rxjs';
import { Filter } from '../model/filter';
import { Organization } from '../model/organization';
import { MainModalComponent } from '../main-modal/main-modal.component';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {

  displayedColumns: string[] = ['name', 'type', 'location', 'sectors'];
  dataSource: MatTableDataSource<Organization> = new MatTableDataSource();
  organizations: Organization[] = [];
  private filter: Observable<Filter>;

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

  constructor(private appService: AppService, private dialog: MatDialog) {
    this.filter = this.appService.filterState();
  }

  ngOnInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    const query = '{ organizations { id name type address { country } sectors } }';
    this.appService.queryService(query).subscribe(data => {
      this.organizations = data.organizations.map(organization => new Organization(organization));
      this.dataSource = new MatTableDataSource<Organization>(this.organizations);
    });
    this.filter.subscribe(() => this._filter());
  }

  type(organization: Organization): string {
    return this.appService.types.get(organization.type);
  }

  country(organization: Organization): string {
    return this.appService.countries.get(organization.address.country);
  }

  sectors(organization: Organization): string {
    const sectors = organization.sectors.map(id => this.appService.sectors.get(id));
    if (!!organization.sectorOther) {
      sectors.push(organization.sectorOther);
    }
    return sectors.join('\n');
  }

  private _filter(): void {
    const filter = this.appService.filterValue();
    const filtered = this.organizations.filter(organization => organization.applyFilter(filter, this.appService));
    this.dataSource = new MatTableDataSource<any>(filtered);
  }

  openDetailsModal(id: number) {
    const organization = '{ id name description region phone email website affiliations type typeOther sectors sectorOther approved ' +
      'contacts { name role email phone } address { street city state zip country } dateAdded }';
    const review = '{ id submitted region languages address { city country } sectors cost stipend workDone evaluation ' +
      'difficulties safety responsiveness duration other reviewer { id firstName } anonymous lastEdited }';
    const query = `{ organization(id: ${id}) ${organization} reviews (organizationId: ${id}) ${review} }`;
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(MainModalComponent, {
        panelClass: 'mat-dialog--md',
        data: { ...data, disableControl: true }
      });
    });
  }
}
