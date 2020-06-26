import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {EmprunteurData} from '../../data/emprunteur-data';
import {UserService} from '../../service/user.service';
import {PanierData} from '../../data/panier-data';
import {ProjectService} from '../../service/project.service';
import {ExemplaireData} from '../../data/exemplaire-data';
import {EmpruntData} from '../../data/emprunt-data';
import {environment} from '../../../environments/environment';

@Component({
  selector: 'app-panier',
  templateUrl: './panier.component.html',
  styleUrls: ['./panier.component.scss']
})
export class PanierComponent implements OnInit {

  user: EmprunteurData;
  userPanier: PanierData;
  exemplaire: ExemplaireData;

  private emprunt: EmpruntData;

  constructor(private auth: AuthentificationService, private userService: UserService,
              private projectService: ProjectService) {
    this.emprunt = {} as EmpruntData;
  }

  ngOnInit(): void {
    this.auth.userSharedMessage.subscribe( message => {
      this.user = message;
      this.fetchPanier(String(this.user.idEmprunteur));
    });
  }

  private fetchPanier(userId: string) {
    this.projectService.panierByUserId(userId).subscribe(data => {
      if (data.length > 0) {
        this.userPanier = data[0];
        console.log(this.userPanier);
        this.projectService.exemplaireByPanier(String(this.userPanier.idPanier)).subscribe(ex => {
          this.exemplaire = ex;
          this.projectService.editionByExemplaire(String(this.exemplaire.idExemplaire)).subscribe(edition => {
            this.exemplaire.edition = edition;
            this.projectService.livreByEdition(String(this.exemplaire.edition.idEdition)).subscribe(livre => {
              console.log(livre);
              this.exemplaire.edition.livre = livre;
            });
          });
        });
      }
    });
  }

  rent(idPanier: number) {
    this.emprunt.emprunteurByIdEmprunteur = environment.webServiceUrl + '/emprunteurs/' + this.user.idEmprunteur;


    this.emprunt.dateEmprunt = new Date().toDateString();
    const dateT = new Date();
    dateT.setDate(dateT.getDate() + 30);
    this.emprunt.dateRetour = dateT.toDateString();
    this.emprunt.exemplairesByIdEmprunt = environment.webServiceUrl + '/exemplaires/' + this.exemplaire.idExemplaire;

    this.projectService.rent(this.emprunt).subscribe(data => {
      this.cancelPanier(idPanier);
      this.getExemplaireOutOfStock(this.exemplaire);
    });
  }

  private fecthEmprunt() {
    this.projectService.emprunt().subscribe(data => {
      console.log(data);
    });
  }

  private cancelPanier(idPanier: number) {
    this.projectService.cancelPanier(idPanier).subscribe(data => {
      this.fetchPanier(String(this.user.idEmprunteur));
    });
  }

  private getExemplaireOutOfStock(exemplaire: ExemplaireData) {
    exemplaire.enStock = 0;
    this.projectService.setExemplaireInOut(exemplaire).subscribe(data => {

    });
  }
}
