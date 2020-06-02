import {AuteurData} from './auteur-data';

export interface PaysData {
  paysId?: number;
  nom?: string;
  // adresse?: AdresseData[];
  auteur?: AuteurData[];
}
