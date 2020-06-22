import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {LivreData} from '../data/livre-data';
import {environment} from '../../environments/environment';
import {catchError, map} from 'rxjs/operators';
import {ExemplaireData} from '../data/exemplaire-data';
import {PanierData} from '../data/panier-data';
import {EmpruntData} from '../data/emprunt-data';

@Injectable({
  providedIn: 'root'
})
export class ProjectService {
  private headers = new HttpHeaders();

  constructor(private http: HttpClient) {
    // this.headers = this.headers.set('Media-Type', 'application/hal+json');
    // this.headers = this.headers.set('Accept', 'application/hal+json');
  }

  exemplaireByEdition(idEdition: number): Observable<Array<ExemplaireData>> {
    const url = environment.webServiceUrl + '/editions/' + idEdition + '/exemplairesByIdEdition';

    return this.http.get<any>(url).pipe(map(data => data._embedded.exemplaires));
  }

  exemplaireByEmprunt(idEmprunt: number): Observable<Array<ExemplaireData>> {
    const url = environment.webServiceUrl + '/emprunts/' + idEmprunt + '/exemplairesByIdEmprunt';

    return this.http.get<any>(url).pipe(map(data => data._embedded.exemplaires));
  }

  emprunt(): Observable<Array<EmpruntData>> {
    const url = environment.webServiceUrl + '/emprunts';

    return this.http.get<any>(url).pipe(map(data => data._embedded.emprunts));
  }

  deleteEmprunt(idEmprunt: number): Observable<{}> {
    const url = environment.webServiceUrl + '/emprunts/' + idEmprunt;

    return this.http.delete(url);
  }



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

  loan(panier: PanierData) {
    console.log(panier);
    // const url = environment.webServiceUrl + '/apiAddPanier';
    const url = environment.webServiceUrl + '/paniers';

    return this.http.post(url, panier);
  }

  rent(emprunt: EmpruntData) {
    console.log(emprunt);
    const url = environment.webServiceUrl + '/emprunts';

    return this.http.post(url, emprunt);
  }

  biblioOfExemplaire(idExemplaire: number) {
    const url = environment.webServiceUrl + '/exemplaires/' + idExemplaire + '/bibliothequeByIdBibliotheque';

    return this.http.get<any>(url);
  }

  exemplaire() {
    const url = environment.webServiceUrl + '/exemplaires/';

    return this.http.get<any>(url);
  }
}
