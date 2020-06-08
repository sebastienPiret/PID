import {PaysData} from './pays-data';

export interface AdresseData {

  rue: string;
  numero: string;
  cp: string;
  localite: string;
  pays: PaysData;
}
