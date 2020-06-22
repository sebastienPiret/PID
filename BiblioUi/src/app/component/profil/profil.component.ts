import { Component, OnInit } from '@angular/core';
import {EmprunteurData} from '../../data/emprunteur-data';
import {ActivatedRoute} from '@angular/router';
import {UserService} from '../../service/user.service';
import {AuthentificationService} from '../../service/auth/authentification.service';

@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.scss']
})
export class ProfilComponent implements OnInit {
  user: EmprunteurData;
  selectedTab: number;

  constructor(private route: ActivatedRoute, private userService: UserService, private auth: AuthentificationService) {
    this.selectedTab = 1;
  }

  ngOnInit(): void {
    this.auth.userSharedMessage.subscribe(message => {
      this.user = message;
      this.fetchUser(String(this.user.idEmprunteur));
    });
  }

  private fetchUser(userId: string) {
    this.userService.adresseByUserId(userId).subscribe( adresse => {
      console.log(adresse);
      if (adresse !== null) {
        this.user.adresse = adresse;
        this.userService.paysByAdresseId(adresse.idAdresse).subscribe( pays => {
          this.user.adresse.pays = pays;
        });
      }

    });

    this.userService.avisByUserId(userId).subscribe( avis => {
      this.user.avis = avis;
    });

    this.userService.questionsByUserId(userId).subscribe( question => {
      this.user.question = question;
    });

    this.userService.empruntsByUserId(userId).subscribe( emprunt => {
      this.user.emprunt = emprunt;
    });

    this.userService.exemplaireByUserId(userId).subscribe( exemplaire => {
      this.user.exemplaire = exemplaire;
    });
  }

  isSelected(tabIndex: number): boolean {
    return this.selectedTab === tabIndex;
  }

  selectTab(tabIndex: number): void {
    this.selectedTab = tabIndex;
  }
}
