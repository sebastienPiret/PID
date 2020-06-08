import {AdresseData} from './adresse-data';
import {AvisData} from './avis-data';
import {QuestionData} from './question-data';
import {ExemplaireData} from './exemplaire-data';
import {EmpruntData} from './emprunt-data';
import {PanierData} from './panier-data';

export interface EmprunteurData {
  idEmprunteur: number;
  nom: string;
  prenom: string;
  mdp: string;
  pseudo?: string;
  tel?: string;
  actif: number;
  role: string;
  mail: string;
  enabled: boolean;
  panier?: PanierData;
  adresse?: AdresseData;
  question?: Array<QuestionData>;
  avis?: Array<AvisData>;
  exemplaire?: Array<ExemplaireData>;
  emprunt?: Array<EmpruntData>;
}
