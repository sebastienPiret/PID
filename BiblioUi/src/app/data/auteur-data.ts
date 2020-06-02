import {LivreData} from './livre-data';
import {PaysData} from './pays-data';

export interface AuteurData {
  auteurId?: number;
  nom?: string;
  prenom?: string;
  pseudo?: string;
  pays?: PaysData;
  livre?: LivreData[];
}
