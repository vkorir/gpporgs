import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";

import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { GraphQLModule } from "./graphql.module";
import { HTTP_INTERCEPTORS, HttpClientModule } from "@angular/common/http";
import { HomeComponent } from "./home/home.component";
import { HeaderComponent } from "./header/header.component";
import { SidebarComponent } from "./sidebar/sidebar.component";
import { TableComponent } from "./table/table.component";
import { DetailsComponent } from "./details/details.component";
import { AdminComponent } from "./admin/admin.component";
import { LoginComponent } from "./login/login.component";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
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
  MatSliderModule,
  MatProgressBarModule,
  MatProgressSpinnerModule,
  MatCardModule,
} from "@angular/material";
import { FlexLayoutModule } from "@angular/flex-layout";
import { LayoutModule } from "@angular/cdk/layout";
import { TokenInterceptor } from "./token.interceptor";
import { AppService } from "./app.service";
import { ReactiveFormsModule } from "@angular/forms";
import { LookUpComponent } from "./look-up/look-up.component";
import { RouteReuseStrategy } from "@angular/router";
import { CacheRouteReuseStrategy } from "./cache-route-reuse.strategy";
import { MainModalComponent } from "./main-modal/main-modal.component";
import { AddUserComponent } from "./admin/add-user/add-user.component";
import { ManageUsersComponent } from "./admin/manage-users/manage-users.component";
import { ManageOrganizationsComponent } from "./admin/manage-organizations/manage-organizations.component";

const materialModules = [
  MatButtonModule,
  MatCheckboxModule,
  MatDividerModule,
  MatFormFieldModule,
  MatProgressSpinnerModule,
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
  MatSliderModule,
  MatProgressBarModule,
  MatCardModule,
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
    AddUserComponent,
    ManageUsersComponent,
    ManageOrganizationsComponent,
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
    MatSelectModule,
  ],
  providers: [
    AppService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true,
    },
    {
      provide: RouteReuseStrategy,
      useClass: CacheRouteReuseStrategy,
    },
  ],
  bootstrap: [AppComponent],
  entryComponents: [
    AdminComponent,
    MainModalComponent,
    LookUpComponent,
    DetailsComponent,
    AddUserComponent,
    ManageUsersComponent,
    ManageOrganizationsComponent,
  ],
})
export class AppModule {}
