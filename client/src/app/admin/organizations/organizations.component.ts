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
  displayedColumns = ['name', 'location', 'created', 'approved'];

  approvedControl = new FormControl(true);

  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              @Inject(MAT_DIALOG_DATA) private data: any) {
    this.organizations = data.organizations.map(value => Object.assign(new Organization(), value));
    this.approvedControl.valueChanges.subscribe(() => this.filter());
    this.filter();
  }

  ngOnInit() {}

  private filter(): void {
    const filtered = this.organizations.filter(organization => this.approvedControl.value || !organization.approved);
    this.dataSource = new MatTableDataSource<Organization>(filtered);
    setTimeout(() => this.dataSource.paginator = this.paginator);
  }

  country(id: string): string {
    return this.appService.countries.get(id);
  }

  formatDate(creationDate: string): string {
    const date = this.appService.formatDate(creationDate);
    return date.substring(0, date.length - 6);
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
