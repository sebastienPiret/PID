import {ExemplaireData} from './exemplaire-data';
import {EmprunteurData} from './emprunteur-data';

export interface PanierData {
  idPanier: number;
  cotisation?: number;
  amende?: number;
  exemplaire?: Array<ExemplaireData>;
  emprunteur: EmprunteurData;
}
