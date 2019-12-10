import { Component, Inject, OnInit } from '@angular/core';
import { AppService } from '../app.service';
import { MAT_DIALOG_DATA, MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.scss']
})
export class DetailsComponent implements OnInit {

  constructor(private appService: AppService,
              private snackBar: MatSnackBar,
              @Inject(MAT_DIALOG_DATA) private data: any) { }

  ngOnInit() {
    console.log(this.data);
  }

}
