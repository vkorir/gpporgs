import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Apollo, gql } from 'apollo-angular';

@Injectable({
  providedIn: 'root'
})
export class AppService {

  constructor(private apollo: Apollo) { }

  queryService(query: string): Observable<any> {
    return this.apollo.watchQuery<any>({ query: gql(query) }).valueChanges.pipe(map(response => {
      return response.data || response;
    }));
  }
}
