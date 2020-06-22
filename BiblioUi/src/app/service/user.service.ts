import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {EmprunteurData} from '../data/emprunteur-data';
import {environment} from '../../environments/environment';
import {map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) {

  }

  setUser(user: EmprunteurData): Observable<any> {
    const url = environment.webServiceUrl + '/apiaddstu';

    return this.http.post<EmprunteurData>(url, user);
  }

  updateUser(user: EmprunteurData): Observable<any> {
    const url = environment.webServiceUrl + '/emprunteurs/' + user.idEmprunteur;

    return this.http.put(url, user);
  }

  userByMail(mail: string): Observable<EmprunteurData>{
    const url = environment.webServiceUrl + '/emprunteurs/search/findByMail?mail=' + mail;

    return this.http.get<any>(url);
  }

  userById(id: string): Observable<EmprunteurData> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id;

    return this.http.get<any>(url);
  }

  questionsByUserId(id: string): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/questionsByIdEmprunteur';

    return this.http.get<any>(url).pipe(map(data => data._embedded.questions));
  }

  avisByUserId(id: string): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/avisByIdEmprunteur';

    return this.http.get<any>(url).pipe(map(data => data._embedded.avis));
  }

  empruntsByUserId(id: string): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/empruntsByIdEmprunteur';

    return this.http.get<any>(url).pipe(map(data => data._embedded.emprunts));
  }

  exemplaireByUserId(id: string): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/exemplairesByIdEmprunteur';

    return this.http.get<any>(url).pipe(map(data => data._embedded.exemplaires));
  }

  adresseByUserId(id: string): Observable<any> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/adresseByIdAdresse';

    return this.http.get<any>(url);
  }

  paysByAdresseId(id: number): Observable<any> {
    const url = environment.webServiceUrl + '/adresses/' + id + '/paysByIdPays';

    return this.http.get<any>(url);
  }

  panierByUserId(id: string): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/emprunteurs/' + id + '/panier';

    return this.http.get<any>(url).pipe(map(data => data._embedded.paniers));
  }

  exemplaireByPanier(id: number): Observable<any>  {
    const url = environment.webServiceUrl + '/paniers/' + id + '/exemplaire';

    return this.http.get<any>(url);
  }
}
