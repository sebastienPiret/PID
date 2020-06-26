import {EmprunteurData} from './emprunteur-data';
import {ExemplaireData} from './exemplaire-data';

export interface EmpruntData {
  idEmprunt: number;
  dateEmprunt: string;
  dateRetour: string;
  emprunteurByIdEmprunteur: string;
  exemplairesByIdEmprunt: string;
  isActif: number;
  exemplaire: ExemplaireData;
  emprunteur: EmprunteurData;
  // exemplareArr: Array<string>;
}
