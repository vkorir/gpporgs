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
  dataSource = new MatTableDataSource<Organization>([]);
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
    const query = '{ organizations { id name type typeOther region address { country } sectors } }';
    this.appService.queryService(query).subscribe(data => {
      this.organizations = data.organizations.map(organization => new Organization(organization));
      this.dataSource = new MatTableDataSource<Organization>(this.organizations);
      this.dataSource.sort = this.sort;
    });
    this.filter.subscribe(() => this._filter());
  }

  type(organization: Organization): string {
    if (organization.type === this.appService.types.size) {
      return organization.typeOther;
    }
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
    // tslint:disable-next-line:max-line-length
    const organization = '{ id name description region phone email website affiliations type typeOther sectors sectorOther approved contacts { id name role email phone } address { id street city state zip country } dateAdded numReviews }';
    // tslint:disable-next-line:max-line-length
    const review = '{ id submitted region languages address { id street city state zip country } sectors sectorOther cost stipend workDone evaluation typicalDay difficulties safety responsiveness duration other reviewerId reviewer { id firstName } anonymous lastEdited }';
    const query = `{ organization(id: ${id}) ${organization} reviews (organizationId: ${id}) ${review} }`;
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(MainModalComponent, {
        panelClass: 'mat-dialog--md',
        data: { ...data, disableControl: true }
      });
    });
  }
}
