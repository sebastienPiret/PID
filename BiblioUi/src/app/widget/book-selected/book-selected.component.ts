import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {LivreData} from '../../data/livre-data';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {ProjectService} from '../../service/project.service';
import {ExemplaireData} from '../../data/exemplaire-data';
import {EmprunteurData} from '../../data/emprunteur-data';
import {PanierData} from '../../data/panier-data';
import {Utils} from '../../utils/utils';
import {environment} from '../../../environments/environment';
import {Observable} from 'rxjs';
import {UserService} from '../../service/user.service';

@Component({
  selector: 'app-book-selected',
  templateUrl: './book-selected.component.html',
  styleUrls: ['./book-selected.component.scss']
})
export class BookSelectedComponent implements OnInit {
  exemplaireOf: Array<ExemplaireData>;
  numExemplaire: number;
  isLoan = false;
  private panier: PanierData;
  private userPanier: Array<any>;

  isLogged: boolean;
  user: EmprunteurData;

  @Input() selectedBook: LivreData;

  @Output() goBack = new EventEmitter<any>();
  isInPanier = false;

  constructor(private auth: AuthentificationService, private projectService: ProjectService,
              private userService: UserService) {
    this.panier = {} as PanierData;
  }

  ngOnInit(): void {
    this.fetchInfo();
    this.auth.sharedMessage.subscribe( message => {
      this.isLogged = message;
    });
    this.auth.userSharedMessage.subscribe( message => {
      this.user = message;
      if (this.user) {
        this.fetchPanier();
      }

    });
    this.fetchExemplaireOf();
  }

  goBackToList() {
    this.goBack.emit();

  }

   fetchInfo(){
    this.fetchExemplaire();
  }

  private fetchPanier() {
    this.userService.panierByUserId(String(this.user.idEmprunteur)).subscribe(data => {
      console.log(data);
      this.userPanier = data;
      if (this.exemplaireOf && this.userPanier.length > 0) {
        for (const ex of this.exemplaireOf) {
          if (this.userPanier.indexOf(ex.idExemplaire)) {
            this.isInPanier = true;
          }
        }
      }

    });
  }


  private fetchExemplaire() {

    this.projectService.exemplaireByEdition(this.selectedBook.edition[0].idEdition).subscribe( data => {
      this.exemplaireOf = data;
      console.log(data);
      for (const exemplaire of this.exemplaireOf) {
        this.projectService.biblioOfExemplaire(exemplaire.idExemplaire).subscribe(biblio => {
          exemplaire.bibliotheque = biblio;
          console.log(exemplaire.bibliotheque.nom);
          if (this.user) {
            this.fetchPanier();
          }
        });
      }

    });

    /*
    this.projectService.exemplaireByEdition(this.selectedBook.edition[0].idEdition).subscribe( data => {
      this.exemplaireOf = data;
      for (const num of data) {
        if (num.enStock) {
          this.numExemplaire += 1;
        }
      }
      for (const emp of this.user.emprunt) {
        for (const exe of emp.exemplaire) {
          for (const ex of this.exemplaireOf) {
            if (exe.idExemplaire === ex.idExemplaire) {
              this.isLoan = true;
            }
          }
        }
      }
    });

     */
  }

  loan(idExemplaire: number) {
    // this.panier.idPanier = Number(Utils.createUuid());
    // this.panier.emprunteur = environment.webServiceUrl + '/emprunteurs/' + this.user.idEmprunteur;
    this.panier.emprunteurById = environment.webServiceUrl + '/emprunteurs/' + this.user.idEmprunteur;
    console.log(this.panier.emprunteurById);
    const test = environment.webServiceUrl + '/exemplaires/' + idExemplaire;
    console.log(this.panier);
    // this.panier.exemplaire = [];
    this.panier.exemplaire = test;
    console.log(this.panier.exemplaire);
    this.projectService.loan(this.panier).subscribe(data => {
      this.fetchPanier();
    });
  }


  private fetchExemplaireOf() {
    this.projectService.exemplaire().subscribe(data => {
      console.log(data);
    });
  }
}
