import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from '@angular/router';
import {HomeComponent} from './component/home/home.component';
import {LoginComponent} from './component/login/login.component';
import {PageNotFoundComponent} from './component/page-not-found/page-not-found.component';
import {LayoutComponent} from './component/layout/layout.component';
import {RegisterComponent} from './component/register/register.component';
import {ProfilComponent} from './component/profil/profil.component';

const routes: Routes = [
  { path: '',
    component: LayoutComponent,
    children: [
      { path: 'home', component: HomeComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'profil/:idEmprunteur', component: ProfilComponent },
      { path: '', component: HomeComponent }
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
