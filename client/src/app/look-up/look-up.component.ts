import { Component, Inject, OnInit } from "@angular/core";
import { AppService } from "../app.service";
import { MatDialog, MatDialogRef } from "@angular/material";
import { FormControl } from "@angular/forms";
import { Observable } from "rxjs";
import { map, startWith } from "rxjs/operators";
import { MainModalComponent } from "src/app/main-modal/main-modal.component";
import { Mode } from "../models";

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
        return this.appService.organizationsApproved.getValue().filter(organization =>
          organization.name.toLowerCase().includes(value.toLowerCase())
        );
      })
    );
  }

  ngOnInit() {}

  addReviewToOrg(id: number) {
    // tslint:disable-next-line:max-line-length
    const orgInfo = 'id name region { id value } phone email website description affiliations { id value } type { id value } typeOther sectors { id value } sectorOther approved created';
    const revInfo = 'id '
    const orgAddress = 'address { id street city state zip country { code value } }';
    const orgContacts = 'contacts { id name role phone email }';
    const query = `{ organization(id: ${id}) { ${orgInfo} ${orgAddress} ${orgContacts} }}`;
    this.appService.queryService(query).subscribe(({ organization }) => {
      this.openAddReviewModal(organization, Mode.VIEW);
    });
  }

  openAddReviewModal(organization: any = {}, mode: Mode = Mode.EDIT) {
    this.dialogRef.close();
    this.dialog.open(MainModalComponent, {
      panelClass: "mat-dialog--md",
      data: { organization, mode },
    });
  }
}
