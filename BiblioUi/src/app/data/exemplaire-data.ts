import {EmprunteurData} from './emprunteur-data';
import {PanierData} from './panier-data';
import {EmpruntData} from './emprunt-data';
import {EditionData} from './edition-data';
import {BibliothequeData} from './bibliotheque-data';

export interface ExemplaireData {
  idExemplaire: number;
  etat: string;
  prixAchat: number;
  format: string;
  enStock: number;
  actif: boolean;
  emprunteur?: EmprunteurData;
  bibliotheque: BibliothequeData;
  panier?: PanierData;
  emprunt?: EmpruntData;
  edition: EditionData;
}
