import {EditionData} from './edition-data';

export interface EditeurData {
  idEditeur: number;
  nom: string;
  editions?: EditionData[];
}
