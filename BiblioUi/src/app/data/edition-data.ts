import {AvisData} from './avis-data';

export interface EditionData {
  editionId?: number;
  datePubli?: string;
  isbn?: string;
  image?: string;
  avis?: AvisData[];
}
