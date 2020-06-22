import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {EmprunteurData} from '../data/emprunteur-data';
import {environment} from '../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {BibliothecaireData} from '../data/bibliothecaire-data';
import {map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  constructor(private http: HttpClient) { }

  userByMail(mail: string): Observable<BibliothecaireData>{
    const url = environment.webServiceUrl + '/bibliothecaires/search/findByMail?mail=' + mail;

    return this.http.get<any>(url);
  }

  updateUser(user: BibliothecaireData): Observable<any> {
    const url = environment.webServiceUrl + '/bibliothecaires/' + user.idBibliothecaire;

    return this.http.put(url, user);
  }

  questionsByUserId(userId: string) {
    const url = environment.webServiceUrl + '/bibliothecaires/' + userId + '/questionsByIdBibliothecaire';

    return this.http.get<any>(url).pipe(map(data => data._embedded.questions));
  }
}
