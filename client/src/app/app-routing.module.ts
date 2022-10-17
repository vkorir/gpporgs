import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './admin/admin.component';
import { AdminGuard } from './admin/admin.guard';
import { HomeComponent } from './home/home.component';
import { HomeGuard } from './home/home.guard';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    component: HomeComponent,
    canLoad: [HomeGuard],
    canActivate: [HomeGuard]
  },
  {
    path: 'admin',
    pathMatch: 'full',
    component: AdminComponent,
    canLoad: [AdminGuard],
    canActivate: [AdminGuard]
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: '**',
    redirectTo: 'login'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
