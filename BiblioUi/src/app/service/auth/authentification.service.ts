import {EventEmitter, Injectable} from '@angular/core';
import { API_URL } from '../../app.constants';
import {HttpClient} from '@angular/common/http';
import {map} from 'rxjs/operators';
import {BehaviorSubject, Observable} from 'rxjs';
import {EmprunteurData} from '../../data/emprunteur-data';
import {BibliothecaireData} from '../../data/bibliothecaire-data';

export const TOKEN = 'token';
export const AUTHENTICATED_USER = 'authenticatedUser';

@Injectable({
  providedIn: 'root'
})
export class AuthentificationService {
  private logged = false;
  private message = new BehaviorSubject(this.logged);
  sharedMessage = this.message.asObservable();

  private loggedAdmin = false;
  private messageAdmin = new BehaviorSubject(this.loggedAdmin);
  sharedMessageAdmin = this.messageAdmin.asObservable();

  private user: EmprunteurData = null;
  private userMessage = new BehaviorSubject(this.user);
  userSharedMessage = this.userMessage.asObservable();

  private admin: BibliothecaireData = null;
  private adminMessage = new BehaviorSubject(this.admin);
  adminSharedMessage = this.adminMessage.asObservable();

  constructor(private http: HttpClient) { }

  nextMessage(logged: boolean) {
    this.message.next(logged);
  }

  nextUserMessage(user: EmprunteurData) {
    this.userMessage.next(user);
  }

  nextMessageAdmin(logged: boolean) {
    this.messageAdmin.next(logged);
  }

  nextAdminMessage(admin: BibliothecaireData) {
    this.adminMessage.next(admin);
  }

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
