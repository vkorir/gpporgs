import { Component, Inject, OnInit } from "@angular/core";
import { AppService } from "../app.service";
import { MatDialog, MatDialogRef } from "@angular/material";
import { FormControl } from "@angular/forms";
import { Observable } from "rxjs";
import { map, startWith } from "rxjs/operators";
import { MainModalComponent } from "../main-modal/main-modal.component";
import { Organization } from "../model/organization";

@Component({
  selector: "app-look-up",
  templateUrl: "./look-up.component.html",
  styleUrls: ["./look-up.component.scss"],
})
export class LookUpComponent implements OnInit {
  lookUpControl = new FormControl();
  lookUpResults: Observable<any[]>;

  constructor(private appService: AppService,
              private dialogRef: MatDialogRef<LookUpComponent>,
              private dialog: MatDialog) {
    this.lookUpResults = this.lookUpControl.valueChanges.pipe(
      startWith(null),
      map(value => {
        if (!value || value.length < 2) {
          return [];
        }
        return this.appService.approvedOrganizations.getValue().filter(organization =>
          organization.name.toLowerCase().startsWith(value.toLowerCase())
        );
      })
    );
  }

  ngOnInit() {}

  country(id: string): string {
    if (!this.appService.countries.has(id)) {
      return null;
    }
    return ` (${this.appService.countries.get(id)})`;
  }

  fetchOrganization(id: number) {
    // tslint:disable-next-line:max-line-length
    const info = 'id name region phone email website description affiliations type typeOther sectors sectorOther approved created';
    const address = 'address { id street city state zip country }';
    const contacts = 'contacts { id name role phone email }';
    const query = `{ organization(id: ${id}) { ${info} ${address} ${contacts} }}`;
    this.appService.queryService(query).subscribe(({ organization }) => {
      this.openReviewDialog(organization);
    });
  }

  openReviewDialog(organization: any) {
    if (!organization || !organization.id) {
      organization = new Organization();
    }
    this.dialogRef.close();
    this.dialog.open(MainModalComponent, {
      panelClass: "mat-dialog--md",
      disableClose: true,
      data: { organization, disableControl: false },
    });
  }
}
