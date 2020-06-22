import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from '@angular/router';
import {HomeComponent} from './component/home/home.component';
import {LoginComponent} from './component/login/login.component';
import {PageNotFoundComponent} from './component/page-not-found/page-not-found.component';
import {LayoutComponent} from './component/layout/layout.component';
import {RegisterComponent} from './component/register/register.component';
import {ProfilComponent} from './component/profil/profil.component';
import {PanierComponent} from './component/panier/panier.component';
import {AdminLoginComponent} from './component/admin/admin-login/admin-login.component';
import {AdminLayoutComponent} from './component/admin/admin-layout/admin-layout.component';
import {AdminInfoComponent} from './component/admin/admin-info/admin-info.component';

const routes: Routes = [
  { path: '',
    component: LayoutComponent,
    children: [
      { path: 'home', component: HomeComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'profil', component: ProfilComponent },
      { path: 'panier', component: PanierComponent },
      { path: '', component: HomeComponent }
    ]
  },
  { path: 'admin',
    component: AdminLayoutComponent,
    children: [
      { path: 'login', component: AdminLoginComponent},
      { path: 'info', component: AdminInfoComponent},
      { path: '', component: AdminLoginComponent }
    ]
  },
  { path: '**', component: PageNotFoundComponent }

];


@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
