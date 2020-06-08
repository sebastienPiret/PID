import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { HomeComponent } from './component/home/home.component';
import { LoginComponent } from './component/login/login.component';
import {AppRoutingModule} from './app-routing.module';
import { MenuComponent } from './component/menu/menu.component';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {HttpInterceptorAuthService} from './service/auth/http-interceptor-auth.service';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { BookListingComponent } from './widget/book-listing/book-listing.component';
import {RestangularModule} from 'ngx-restangular';
import { BookSelectedComponent } from './widget/book-selected/book-selected.component';
import { LayoutComponent } from './component/layout/layout.component';
import {PageNotFoundComponent} from './component/page-not-found/page-not-found.component';
import { RegisterComponent } from './component/register/register.component';
import { ProfilComponent } from './component/profil/profil.component';
import { CoordonneeComponent } from './component/profil/coordonnee/coordonnee.component';

export function RestAngularConfigFactory(RestangularProvider) {
  RestangularProvider.setBaseUrl('http://localhost:8080');
  RestangularProvider.addResponseInterceptor((data, operation, what, url, response, deferred) => {
    let extractedData;
    const baseUrl = 'http://localhost:8080/';
    console.log(url);
    if (operation === 'getList') {
      if (url === baseUrl + 'livres/1/auteurByNom') {
        extractedData = data._embedded.auteurs;
      } else if (url === baseUrl + 'livres') {
        extractedData = data._embedded.livres;
      }

    } else {
      extractedData = data;
    }
    return extractedData;
  });
}

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    MenuComponent,
    BookListingComponent,
    BookSelectedComponent,
    PageNotFoundComponent,
    LayoutComponent,
    RegisterComponent,
    ProfilComponent,
    CoordonneeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    RestangularModule.forRoot(RestAngularConfigFactory),
    FormsModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: HttpInterceptorAuthService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
