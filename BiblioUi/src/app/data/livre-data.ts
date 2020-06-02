
import {AuteurData} from './auteur-data';
import {EditionData} from './edition-data';


interface GenreData {
  genreId?: number;
  nom?: string;
  livre?: LivreData[];
}

interface TagData {
  tagId?: number;
  nom?: string;
  livre?: LivreData[];
}

interface ThemeData {
  themeId?: number;
  nom?: string;
  livre?: LivreData[];
}

export interface LivreData {
  livreId?: number;
  titre?: string;
  sousTitre?: string;
  resume?: string;
  edition?: EditionData[];
  genre?: GenreData;
  tag?: TagData[];
  theme?: ThemeData[];
  auteur?: AuteurData[];
}



