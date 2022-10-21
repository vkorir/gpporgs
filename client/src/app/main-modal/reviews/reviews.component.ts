import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material';
import { AppService } from 'src/app/app.service';
import { Language, Region, Review, Sector, User } from 'src/app/models';

@Component({
  selector: 'app-reviews',
  templateUrl: './reviews.component.html',
  styleUrls: ['../main-modal.component.scss']
})
export class ReviewsComponent implements OnInit {

  reviews: Review[] = [];

  constructor(private fb: FormBuilder, private appService: AppService, @Inject(MAT_DIALOG_DATA) public data: any) { }

  ngOnInit() {
    (this.data.reviews || []).forEach(rev => this.reviews.push(Object.assign(new Review(rev))));
  }

  reviewer(reviewer: User): string {
    if (reviewer.id == 0) {
      return 'anonymous';
    }
    return reviewer.firstName ? reviewer.firstName + ' (' + reviewer.email + ')' : reviewer.email;
  }

  languages(languages: Language[]): string {
    return languages.map(lan => lan.value).join(', ');
  }

  sectors(sectors: Sector[], sectorOther: string): string {
    const sectorVals = sectors.map(sec => sec.value);
    if (!!sectorOther) {
      sectorVals.push(sectorOther || '');
    }
    return sectorVals.join('\n');
  }

  formatDate(dateString: string): string {
    return this.appService.formatDate(dateString);
  }

}
