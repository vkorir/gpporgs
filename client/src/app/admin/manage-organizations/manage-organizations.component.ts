import { Component, OnInit, ViewChild } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { AppService } from "src/app/app.service";
import { FormControl } from "@angular/forms";
import { Organization } from "src/app/models";

@Component({
  selector: "app-manage-organizations",
  templateUrl: "./manage-organizations.component.html",
  styleUrls: ["./manage-organizations.component.scss"],
})
export class ManageOrganizationsComponent implements OnInit {
  organizations: Array<Organization> = [];
  dataSource: MatTableDataSource<any>;
  displayedColumns = ["name", "location", "created", "approved"];

  approvedControl = new FormControl(true);

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService) {
    this.organizations = this.appService.organizationsAll.getValue().map(org => new Organization(org));
    this.approvedControl.valueChanges.subscribe(() => this.applyFilter(this.organizations));
    this.dataSource = new MatTableDataSource(this.organizations);
    setTimeout(() => this.dataSource.paginator = this.paginator);
  }

  ngOnInit() {}

  formatDate(creationDate: string): string {
    return this.appService.formatDate(creationDate);
  }

  applyFilter(filtered: Array<any>): void {
    filtered = filtered.filter(value => this.approvedControl.value || !value.approved);
    this.dataSource.connect().next(filtered.map(org => new Organization(org)));
  }

  toggleApproved(org: Organization, approved: boolean): void {
    const organization = new Organization(org);
    organization.approved = approved;
    org.approved = approved;
    delete organization['created'];
    const mutation = `mutation { updateOrganization(org: ${this.appService.queryFy(organization)}) { id approved } }`;
    this.appService.mutationService(mutation).subscribe(({ updateOrganization }) => {
      if (updateOrganization && updateOrganization.id) {
        const organizations = this.organizations.map(org => new Organization(org));
        organizations.forEach(org => {
          if (org.id == parseInt(updateOrganization.id)) {
            org.approved = updateOrganization.approved;
          }
        });
        // may need to update behaviorsubject.
        this.applyFilter(organizations);
        if (approved) {
          this.appService.openSnackBar(`${org.name} is now approved.`);
        } else {
          this.appService.openSnackBar(`${org.name} is now marked as unapproved.`);
        }
      }
    });
  }
}
