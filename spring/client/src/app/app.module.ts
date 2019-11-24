import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GraphQLModule } from './graphql.module';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { HomeComponent } from './home/home.component';
import { HeaderComponent } from './header/header.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { TableComponent } from './table/table.component';
import { DetailsComponent } from './details/details.component';
import { AdminComponent } from './admin/admin.component';
import { LoginComponent } from './login/login.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MatButtonModule,
  MatCheckboxModule,
  MatDividerModule,
  MatFormFieldModule,
  MatGridListModule,
  MatInputModule,
  MatToolbarModule,
  MatRadioModule,
  MatTableModule,
  MatPaginatorModule,
  MatSortModule,
  MatDialogModule,
  MatSnackBarModule,
  MatIconModule,
  MatAutocompleteModule,
  MatSelectModule,
  MatExpansionModule,
  MatSlideToggleModule,
  MatChipsModule,
  MatSliderModule
} from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LayoutModule } from '@angular/cdk/layout';
import { TokenInterceptor } from './token.interceptor';
import { AppService } from './app.service';
import { ConfigService } from './config.service';
import { ReactiveFormsModule } from '@angular/forms';
import { LookUpComponent } from './look-up/look-up.component';
import { SubmissionState } from './model/submission.state';
import { RouteReuseStrategy } from '@angular/router';
import { CacheRouteReuseStrategy } from './cache-route-reuse.strategy';
import { MainModalComponent } from './main-modal/main-modal.component';

const materialModules = [MatButtonModule, MatCheckboxModule, MatDividerModule, MatFormFieldModule,
  MatGridListModule, MatInputModule, MatToolbarModule, MatRadioModule, MatTableModule, MatPaginatorModule,
  MatSortModule, MatDialogModule, MatSnackBarModule, MatIconModule, MatAutocompleteModule, MatSelectModule,
  MatExpansionModule, MatSlideToggleModule, MatChipsModule, MatSliderModule
];

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    HeaderComponent,
    SidebarComponent,
    TableComponent,
    DetailsComponent,
    AdminComponent,
    LoginComponent,
    LookUpComponent,
    MainModalComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    GraphQLModule,
    HttpClientModule,
    BrowserAnimationsModule,
    LayoutModule,
    FlexLayoutModule,
    materialModules,
    ReactiveFormsModule,
    MatSelectModule
  ],
  providers: [
    ConfigService,
    AppService,
    SubmissionState,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true
    },
    {
      provide: RouteReuseStrategy,
      useClass: CacheRouteReuseStrategy
    }
  ],
  bootstrap: [AppComponent],
  entryComponents: [
    AdminComponent,
    MainModalComponent,
    LookUpComponent,
    DetailsComponent
  ]
})
export class AppModule { }
