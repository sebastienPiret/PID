import {EmprunteurData} from './emprunteur-data';
import {BibliothecaireData} from './bibliothecaire-data';

export interface QuestionData {
  idQuestion: number;
  titre: string;
  contenu: string;
  date: string;
  reponse?: string;
  bibliothecaire?: BibliothecaireData;
  emprunteur: EmprunteurData;
}
