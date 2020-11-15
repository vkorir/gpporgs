import { Component, OnInit, ViewChild } from "@angular/core";
import { MatTableDataSource } from "@angular/material/table";
import { MatPaginator } from "@angular/material/paginator";
import { AppService } from "../../app.service";
import { FormControl } from "@angular/forms";
import { deepCopy } from 'deep-copy-ts';

@Component({
  selector: "app-manage-organizations",
  templateUrl: "./manage-organizations.component.html",
  styleUrls: ["./manage-organizations.component.scss"],
})
export class ManageOrganizationsComponent implements OnInit {
  organizations: Array<any> = new Array();
  dataSource: MatTableDataSource<any>;
  displayedColumns = ["name", "location", "created", "approved"];

  approvedControl = new FormControl(true);

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService) {
    this.appService.organizations.getValue().map(value => this.organizations.push(deepCopy(value)));
    this.approvedControl.valueChanges.subscribe(() => this.applyFilter(deepCopy(this.organizations)));
    this.dataSource = new MatTableDataSource(deepCopy(this.organizations));
    setTimeout(() => this.dataSource.paginator = this.paginator);
  }

  ngOnInit() {}

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  formatDate(creationDate: string): string {
    const date = this.appService.formatDate(creationDate);
    return date.substring(0, date.length - 6);
  }

  applyFilter(filtered: Array<any>): void {
    filtered = filtered.filter(value => this.approvedControl.value || !value.approved);
    this.dataSource.connect().next(filtered);
  }

  toggleApproved(id: number, approved: boolean): void {
    const input = this.appService.queryFy({ id, approved });
    const mutation = `mutation { updateOrganization(organization: ${input}) { id, name, approved } }`;
    this.appService.mutationService(mutation).subscribe(({ updateOrganization }) => {
      if (updateOrganization && updateOrganization.id) {
        const updated = this.organizations.map(value => {
          const organization = deepCopy(value);
          if (organization.id == updateOrganization.id) {
            organization.approved = updateOrganization.approved;
          }
          return organization;
        });
        this.applyFilter(updated);
        if (approved) {
          this.appService.openSnackBar(`${updateOrganization.name} is now approved.`);
        } else {
          this.appService.openSnackBar(`${updateOrganization.name} is now marked as unapproved.`);
        }
      }
    });
  }
}
