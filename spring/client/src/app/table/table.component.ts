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

  displayedColumns: string[] = ['name', 'type', 'location', 'sectors'];
  dataSource: MatTableDataSource<any> = new MatTableDataSource();
  organizations: any[] = [];
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
      this.organizations = data.organizations.map(organization => this.organization(organization));
      this.dataSource = new MatTableDataSource<any>(this.organizations);
    });
    this.filter.subscribe(filter => {
      this.dataSource.filter = filter.searchString.trim().toLocaleLowerCase();
    });
  }

  type(id: number): string {
    return this.appService.types.get(id);
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  sectors(ids: number[]): string {
    return ids.map(id => this.appService.sectors.get(id)).join('\n\t');
  }

  private organization(data: any): any {
    return {
      id: data.id,
      name: data.name,
      type: this.type(data.type),
      country: this.country(data.address.country),
      sectors: this.sectors(data.sectors)
    };
  }

  openDetailsModal(id: number) {
    const address = 'address { street city state zip country }';
    const details = 'name region phone email website affiliations type sectors';
    const contacts = 'contacts { name role email phone }';
    const attributes = `{ ${details} ${address} ${contacts} }`;
    const reviewInfo = 'id region languages sectors cost stipend workDone evaluation';
    const reviews = `reviews (organizationId: ${id}) { address { city country } ${reviewInfo} }`;
    const query = `{ organization(id: ${id}) ${attributes} ${reviews} }`;
    this.appService.queryService(query).subscribe(data => {
      this.dialog.open(DetailsComponent, {
        panelClass: 'mat-dialog--md',
        data
      });
    });
    // console.log(this.paginator.pageSize);
    // console.log(this.paginator.pageIndex);
  }
}
