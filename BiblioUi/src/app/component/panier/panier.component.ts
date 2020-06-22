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
  userPanier: Array<PanierData>;
  exemplaire: ExemplaireData;

  private emprunt: EmpruntData;

  constructor(private auth: AuthentificationService, private userService: UserService,
              private projectService: ProjectService) {
    //this.exemplaire = new Array<ExemplaireData>();
    this.emprunt = {} as EmpruntData;
  }

  ngOnInit(): void {
    this.auth.userSharedMessage.subscribe( message => {
      this.user = message;
      this.fetchPanier(String(this.user.idEmprunteur));
    });
  }

  private fetchPanier(userId: string) {
    this.userService.panierByUserId(userId).subscribe(data => {
      console.log(data);
      this.userPanier = data;
      for (const panier of this.userPanier) {
        this.userService.exemplaireByPanier(panier.idPanier).subscribe(ex => {
          console.log(ex);
          this.exemplaire = ex;
        });
      }
      });
  }

  rent() {
    this.emprunt.emprunteurByIdEmprunteur = environment.webServiceUrl + '/emprunteurs/' + this.user.idEmprunteur;
    // this.emprunt.emprunteurByIdEmprunteur = this.user;
    //this.emprunt.exemplairesByIdEmprunt = [];
    //this.emprunt.exemplareArr = [];

    this.emprunt.dateEmprunt = String(new Date().getDate());
    this.emprunt.dateRetour = String(new Date().getDate() + 30);
    this.emprunt.exemplairesByIdEmprunt = environment.webServiceUrl + '/exemplaires/' + this.exemplaire.idExemplaire;
    /*
    for (const ex of this.exemplaire) {
      console.log(environment.webServiceUrl + '/exemplaires/' + ex.idExemplaire);
      this.emprunt.exemplairesByIdEmprunt.push(environment.webServiceUrl + '/exemplaires/' + ex.idExemplaire);
      //this.emprunt.exemplareArr.push(environment.webServiceUrl + '/exemplaires/' + ex.idExemplaire);

    }

     */
    //console.log(this.emprunt.exemplareArr);
    this.projectService.rent(this.emprunt).subscribe(data => {
      // this.fecthEmprunt();
    });
  }

  private fecthEmprunt() {
    this.projectService.emprunt().subscribe(data => {
      console.log(data);
    });
  }
}
