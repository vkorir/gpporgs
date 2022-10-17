import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AddComponent } from './organization/add/add.component';
import { EditComponent } from './organization/edit/edit.component';
import { ListComponent } from './organization/list/list.component';

@NgModule({
  declarations: [
    AppComponent,
    AddComponent,
    EditComponent,
    ListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
