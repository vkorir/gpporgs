import { Component, OnInit } from '@angular/core';
import { Apollo, QueryRef } from 'apollo-angular';
import gql from 'graphql-tag';
import { Affiliation } from '../model/affiliation';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  affiliations: Affiliation[] = [];
  private query: QueryRef<any>;
  constructor(private apollo: Apollo) { }
  ngOnInit() {
    this.query = this.apollo.watchQuery({
      query: AFFILIATIONS_QUERY ,
      variables: {}
    });
    this.query.valueChanges.subscribe(result => {
      this.affiliations = result.data && result.data.affiliations;
    });
  }
}

const AFFILIATIONS_QUERY = gql`query { affiliations { id name }}`;
