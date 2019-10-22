import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MatSnackBar } from '@angular/material';
import { AppService } from '../app.service';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              private dialogRef: MatDialogRef<ReviewComponent>) { }

  ngOnInit() {
  }

  submit() {
    this.appService.openSnackBar(this.snackBar, 'Organization successfully submitted');
    this.dialogRef.close();
  }
}
