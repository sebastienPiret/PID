import {QuestionData} from './question-data';

export interface BibliothecaireData {
  idBibliothecaire: number;
  nom: string;
  prenom: string;
  mail: string;
  mdp: string;
  actif: boolean;
  role: string;
  questions: Array<QuestionData>;
}
