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

  livres(): Observable<Array<LivreData>> {
    const url = environment.webServiceUrl + '/livres';

    return this.http.get<any>(url).pipe(
      map(res => res._embedded.livres)
    );
  }

}
