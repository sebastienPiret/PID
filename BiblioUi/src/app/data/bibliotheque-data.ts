import {ExemplaireData} from './exemplaire-data';
import {AdresseData} from './adresse-data';

export interface BibliothequeData {
  idBibliotheque: number;
  nom: string;
  actif: boolean;
  exemplaires: Array<ExemplaireData>;
  adresse: AdresseData;
  paiementsByIdBibliotheque: Array<any>;
}
