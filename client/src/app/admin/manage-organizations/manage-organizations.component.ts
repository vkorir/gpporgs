import { Component, Inject, OnInit, ViewChild } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { Organization } from "../../model/organization";
import { MatPaginator } from "@angular/material/paginator";
import { AppService } from "../../app.service";
import { MatSnackBar } from "@angular/material/snack-bar";
import { FormControl } from "@angular/forms";

@Component({
  selector: "app-organizations",
  templateUrl: "./manage-organizations.component.html",
  styleUrls: ["./manage-organizations.component.scss"],
})
export class OrganizationsComponent implements OnInit {
  organizations: Organization[] = null;
  dataSource: MatTableDataSource<Organization> = new MatTableDataSource([]);
  displayedColumns = ["name", "location", "created", "approved"];

  approvedControl = new FormControl(true);

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(
    private appService: AppService,
    private snackBar: MatSnackBar) {
    this.appService.organizations.subscribe(values => {
      if (this.organizations == null) {
        this.organizations = values;
      }
      this.updateDataSource(values);
    });
    this.approvedControl.valueChanges.subscribe(value => {
      if (value) {
        this.appService.organizations.next(this.organizations);
      } else {
        const unApproved = this.organizations.filter(organization => !organization.approved, this.organizations);
        this.appService.organizations.next(unApproved);
      }
    });
  }

  ngOnInit() {}

  updateDataSource(values: Organization[]): void {
    this.dataSource.data = values;
    // this.dataSource = new MatTableDataSource<Organization>(values);
    setTimeout(() => this.dataSource.paginator = this.paginator);
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  formatDate(creationDate: string): string {
    const date = this.appService.formatDate(creationDate);
    return date.substring(0, date.length - 6);
  }

  approveOrg(org: Organization): void {
    const mutation = `mutation { updateOrganization(organization: { id: ${org.id} approved: true }) { id, name, approved } }`;
    this.appService.mutationService(mutation).subscribe((response) => {
      if (response.updateOrganization.id) {
        const updated = this.organizations.map(value => {
          const organization = Object.assign(new Organization(), value);
          if (organization.id == response.updateOrganization.id) {
            organization.approved = !response.updateOrganization.approved;
          }
          return organization;
        });
        this.appService.organizations.next(updated);
        this.appService.openSnackBar(this.snackBar,`${response.updateOrganization.name} is now approved.`);
      }
    });
  }
}
