import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AdminGuard } from './admin/admin.guard';
import { AdminComponent } from './admin/admin.component';
import { HomeGuard } from './home/home.guard';


const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    component: HomeComponent,
    canActivate: [HomeGuard],
    canLoad: [HomeGuard]
  },
  {
    path: 'admin',
    pathMatch: 'full',
    component: AdminComponent,
    canActivateChild: [AdminGuard]
  },
  {
    path: '**',
    redirectTo: ''
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
