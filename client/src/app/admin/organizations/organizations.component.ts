import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material';
import { MatTableDataSource } from '@angular/material/table';
import { Organization } from '../../model/organization';
import { MatPaginator } from '@angular/material/paginator';
import { AppService } from '../../app.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-organizations',
  templateUrl: './organizations.component.html',
  styleUrls: ['./organizations.component.scss']
})
export class OrganizationsComponent implements OnInit {

  organizations: Organization[] = [];
  dataSource: MatTableDataSource<Organization>;
  displayedColumns = ['name', 'location', 'submitted', 'approved'];

  approvedControl = new FormControl(true);

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              @Inject(MAT_DIALOG_DATA) private data: any) {
    this.dataSource = new MatTableDataSource<Organization>(data.organizations);
    setTimeout(() => this.dataSource.paginator = this.paginator);
    this.organizations = data.organizations;
    this.approvedControl.valueChanges.subscribe(() => this.filter());
  }

  ngOnInit() {}

  private filter(): void {
    const filtered = this.organizations.filter(organization => this.approvedControl.value || !organization.approved);
    this.dataSource = new MatTableDataSource<Organization>(filtered);
    this.dataSource.paginator = this.paginator;
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  date(timestamp: number): string {
    const dateAdded = new Date(timestamp);
    const month = `0${dateAdded.getMonth() + 1}`.slice(-2);
    const date = `0${dateAdded.getDate() + 1}`.slice(-2);
    const year = dateAdded.getFullYear();
    return `${month}/${date}/${year}`;
  }

  approveOrg(organization: Organization): void {
    const mutation = `mutation { updateOrganization(organization: { id: ${organization.id} approved: true }) { id } }`;
    this.appService.mutationService(mutation).subscribe(response => {
      if (response.updateOrganization.id) {
        organization.approved = true;
        this.appService.openSnackBar(this.snackBar, `${organization.name} is now approved.`);
        this.filter();
      }
    });
  }
}
