import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {LivreData} from '../../data/livre-data';
import {ProjectService} from '../../service/project.service';
import {AUTHENTICATED_USER, AuthentificationService} from '../../service/auth/authentification.service';
import {UserService} from '../../service/user.service';
import {EmprunteurData} from '../../data/emprunteur-data';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  livres = new Array<LivreData>();
  selected: boolean;
  selectedBook: LivreData;

  constructor(private route: ActivatedRoute, private projectService: ProjectService,
              private auth: AuthentificationService, private userService: UserService) {
    this.selected = false;
  }

  ngOnInit(): void {
    if (this.livres.length === 0) {
      this.route.params.subscribe(params => {
        this.fetchBooks();
      }, error => {
        console.log(error);
      });
    }

  }

  displayBook(livre: LivreData) {
    this.selectedBook = livre;
    this.selected = true;
  }

  goBack() {
    this.selected = false;
  }

  private fetchBooks() {
    this.projectService.livres().subscribe(data => {
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
    });
  }

  /*
  private fetchUser(mail: string): void {
    this.userService.userByMail(mail).subscribe(data => {
      this.user = data;
      this.userService.empruntsByUserId(String(this.user.idEmprunteur)).subscribe( emprunt => {
        this.user.emprunt = emprunt;
        for (const emp of this.user.emprunt) {
          this.projectService.exemplaireByEmprunt(emp.idEmprunt).subscribe( ex => {
            emp.exemplaire = ex;
          });
        }

      });

      this.userService.exemplaireByUserId(String(this.user.idEmprunteur)).subscribe(exemplaire => {
        this.user.exemplaire = exemplaire;


      });
    });


  }
*/
}
