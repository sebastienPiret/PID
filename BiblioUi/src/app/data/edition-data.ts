import {AvisData} from './avis-data';
import {LivreData} from './livre-data';
import {ExemplaireData} from './exemplaire-data';
import {EditeurData} from './editeur-data';

export interface EditionData {
  idEdition: number;
  datePubli?: string;
  isbn?: string;
  image?: string;
  avis?: AvisData[];
  livre?: LivreData[];
  exemplaire?: ExemplaireData[];
  editeur?: EditeurData[];
}
