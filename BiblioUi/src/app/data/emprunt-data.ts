import {EmprunteurData} from './emprunteur-data';
import {ExemplaireData} from './exemplaire-data';

export interface EmpruntData {
  idEmprunt: number;
  dateEmprunt: string;
  dateRetour: string;
  emprunteurByIdEmprunteur: string;
  exemplairesByIdEmprunt: string;
  // exemplareArr: Array<string>;
}
