import {EventEmitter, Injectable} from '@angular/core';
import { API_URL } from '../../app.constants';
import {HttpClient} from '@angular/common/http';
import {map} from 'rxjs/operators';
import {Observable} from 'rxjs';

export const TOKEN = 'token';
export const AUTHENTICATED_USER = 'authenticatedUser';

@Injectable({
  providedIn: 'root'
})
export class AuthentificationService {

  constructor(private http: HttpClient) { }

  getAuthenticatedUser() {
    return sessionStorage.getItem(AUTHENTICATED_USER);
  }

  getAuthenticatedToken() {
    return sessionStorage.getItem(TOKEN);
  }

  isUserLoggedIn() {
    const user = sessionStorage.getItem(AUTHENTICATED_USER);

    return !(user === null);
  }

  logout() {
    sessionStorage.removeItem(AUTHENTICATED_USER);
    sessionStorage.removeItem(TOKEN);
  }

  executeJWTAuthenticationService(username, password) {
    return this.http.post<any>(
      `${API_URL}/authenticate`, {
        username,
        password}).pipe(
          map( data => {
            sessionStorage.setItem(AUTHENTICATED_USER, username);
            sessionStorage.setItem(TOKEN, `Bearer ${data.token}`);
            return data;
          })
    );
  }
}
