import { Injectable } from '@angular/core';
import {HttpEvent, HttpHandler, HttpInterceptor, HttpRequest} from '@angular/common/http';
import {Observable} from 'rxjs';
import {AuthentificationService} from './authentification.service';

@Injectable({
  providedIn: 'root'
})
export class HttpInterceptorAuthService implements HttpInterceptor {

  constructor(private authenticationService: AuthentificationService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const authHeaderString = this.authenticationService.getAuthenticatedToken();
    const username = this.authenticationService.getAuthenticatedUser();

    let reqAuth;

    if (authHeaderString && username) {
      // console.log(authHeaderString);
      // console.log(username);

      reqAuth = req.clone( {
        setHeaders: {
          Authorization: authHeaderString
        }
      });
      return next.handle(req);
    }

    return next.handle(req);
  }
}
