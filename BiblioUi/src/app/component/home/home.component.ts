import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {LivreData} from '../../data/livre-data';
import {ProjectService} from '../../service/project.service';
import {AuteurData} from '../../data/auteur-data';
import {Restangular} from 'ngx-restangular';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  livres: Array<LivreData>;
  auteurs: Array<AuteurData>;
  selected: boolean;
  selectedBook: LivreData;

  constructor(private route: ActivatedRoute, private projectService: ProjectService, private restangular: Restangular) {
    this.livres = new Array<LivreData>();
    this.selected = false;
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.fetchBooks();
    }, error => {
      console.log(error);
    });
  }

  private fetchBooks() {
    this.projectService.livres().subscribe(data => {
      // console.log(data);

      this.livres = data;

      for (let i = 0; i < this.livres.length; i++) {
        this.projectService.auteurByLivre(i + 1).subscribe( auteur => {
          this.livres[i].auteur = auteur;
        });
        this.projectService.editionByLivre(i + 1).subscribe( edition => {
          this.livres[i].edition = edition;
        });
        this.projectService.tagByLivre(i + 1).subscribe( tag => {
          this.livres[i].tag = tag;
        });
        this.projectService.themeByLivre(i + 1).subscribe( theme => {
          this.livres[i].theme = theme;
        });
        this.projectService.genreByLivre(i + 1).subscribe( genre => {
          this.livres[i].genre = genre;
        });
      }
      /*
      for (let test of data._embedded.livres) {
        console.log(test.livreId);

        this.projectService.auteurByLivre(test.livreId).subscribe( data => {
          console.log(data);
          // test.auteur.push(data);
        });


      }
*/
    });
  }


  displayBook(livre: LivreData) {
    this.selectedBook = livre;
    this.selected = true;
  }

  goBack() {
    this.selected = false;
  }
}
