import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {LivreData} from '../data/livre-data';
import {environment} from '../../environments/environment';
import {catchError, map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ProjectService {

  constructor(private http: HttpClient) { }

  livres(): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/livres';

    return this.http.get<any>(url).pipe(map(data => data._embedded.livres));
  }

  auteurs(): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/auteurs';

    return this.http.get<any>(url).pipe(map(data => data._embedded.auteurs));
  }

  auteurByLivre(idLivre: number): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/livres/' + idLivre + '/auteurByNom';

    return this.http.get<any>(url).pipe(map(data => data._embedded.auteurs));
  }

  editionByLivre(idLivre: number): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/livres/' + idLivre + '/editionsByIdLivre';

    return this.http.get<any>(url).pipe(map(data => data._embedded.editions));
  }

  genreByLivre(idLivre: number): Observable<any> {
    const url = environment.webServiceUrl + '/livres/' + idLivre + '/genreByNom';

    return this.http.get<any>(url).pipe(map(data => data.nom));
  }

  themeByLivre(idLivre: number): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/livres/' + idLivre + '/themeByNom';

    return this.http.get<any>(url).pipe(map(data => data._embedded.themes));
  }

  tagByLivre(idLivre: number): Observable<Array<any>> {
    const url = environment.webServiceUrl + '/livres/' + idLivre + '/tagByNom';

    return this.http.get<any>(url).pipe(map(data => data._embedded.tags));
  }

}
