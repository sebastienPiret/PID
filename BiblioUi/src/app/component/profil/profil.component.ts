import { Component, OnInit } from '@angular/core';
import {EmprunteurData} from '../../data/emprunteur-data';
import {ActivatedRoute} from '@angular/router';
import {UserService} from '../../service/user.service';

@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.scss']
})
export class ProfilComponent implements OnInit {
  user: EmprunteurData;
  userId: string;
  selectedTab: number;

  constructor(private route: ActivatedRoute, private userService: UserService) {
    this.selectedTab = 1;
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.userId = params.idEmprunteur;
      this.fetchUser();
    });
  }

  private fetchUser() {
    this.userService.userById(this.userId).subscribe(data => {
      this.user = data;

      this.userService.adresseByUserId(this.userId).subscribe( adresse => {
        console.log(adresse);
        if (adresse !== null) {
          this.user.adresse = adresse;
          this.userService.paysByAdresseId(adresse.idAdresse).subscribe( pays => {
            this.user.adresse.pays = pays;
          });
        }

      });

      this.userService.avisByUserId(this.userId).subscribe( avis => {
        this.user.avis = avis;
      });

      this.userService.questionsByUserId(this.userId).subscribe( question => {
        this.user.question = question;
      });

      this.userService.empruntsByUserId(this.userId).subscribe( emprunt => {
        this.user.emprunt = emprunt;
      });

      this.userService.exemplaireByUserId(this.userId).subscribe( exemplaire => {
        this.user.exemplaire = exemplaire;
      });
    });
  }

  isSelected(tabIndex: number): boolean {
    return this.selectedTab === tabIndex;
  }

  selectTab(tabIndex: number): void {
    this.selectedTab = tabIndex;
  }
}
