import { Component, OnInit, ViewChild } from "@angular/core";
import { AppService } from "src/app/app.service";
import { MatDialog, MatPaginator, MatSort, MatTableDataSource } from "@angular/material";
import { Filter, Organization } from "src/app/models";
import { MainModalComponent } from "../main-modal/main-modal.component";
import { applyFilterToOrg } from "../util";

@Component({
  selector: "app-table",
  templateUrl: "./table.component.html",
  styleUrls: ["./table.component.scss"],
})
export class TableComponent implements OnInit {
  displayedColumns: string[] = ['name', 'type', 'location', 'sectors'];
  dataSource: MatTableDataSource<Organization>;
  organizations: Organization[] = [];

  isLoading: boolean;

  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  private readonly organizationsQeury = '{ organizations(approved: true) { id name type { id value } typeOther region { id value } address { id country { code value } } sectors { id value } sectorOther } }';

  constructor(private appService: AppService, private dialog: MatDialog) {
    this.isLoading = true;
    const filter = new Filter(this.appService.filter.getValue());
    filter.regionIds = new Set(this.appService.regions.map(region => region.id));
    filter.sectorIds = new Set(this.appService.sectors.map(sector => sector.id));
    this.appService.filter.next(filter);
    this.appService.filter.subscribe(() => this.applyFilter());

    this.appService.organizationsApproved.subscribe(orgs => {
      this.organizations = orgs.map(org => new Organization(org));
      this.applyFilter();
    });
    this.appService.queryService(this.organizationsQeury).subscribe(data => {
      if (data.organizations) {
        this.appService.organizationsApproved.next(data.organizations.map(org => new Organization(org)));
        this.isLoading = false;
      }
    });
  }

  ngOnInit() {}

  type(org: Organization): string {
    if (org.type.id == this.appService.types.length) {
      return org.typeOther;
    }
    return org.type.value;
  }

  sectors(org: Organization): string {
    const sectors = org.sectors.map(sector => sector.value);
    if (!!org.sectorOther) {
      sectors.push(org.sectorOther);
    }
    return sectors.join("\n");
  }

  private applyFilter(): void {
    const filtered = this.organizations.filter(org => applyFilterToOrg(this.appService.filter.getValue(), org));
    this.dataSource = new MatTableDataSource<Organization>(filtered);
    setTimeout(() => this.dataSource.paginator = this.paginator);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    this.isLoading = false;
  }

  openDetailsModal(id: number) {
    // tslint:disable-next-line:max-line-length
    const organization = '{ id name description region { id value } phone email website affiliations { id value } type { id value } typeOther sectors { id value } sectorOther approved contacts { id name role email phone } address { id street city state zip country { code value } } created }';
    // tslint:disable-next-line:max-line-length
    const review = '{ id created region { id value } languages { code value } address { id street city state zip country { code value } } sectors { id value } sectorOther cost stipend workDone evaluation typicalDay difficulties safety responsiveness duration other reviewer { id firstName email } anonymous }';
    const query = `{ organization(id: ${id}) ${organization} reviews (orgId: ${id}) ${review} }`;
    this.appService.queryService(query).subscribe((data) => {
      this.dialog.open(MainModalComponent, {
        panelClass: "mat-dialog--md",
        data: { ...data, disableControl: true },
      });
    });
  }
}
