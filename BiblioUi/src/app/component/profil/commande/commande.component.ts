import {Component, Input, OnInit} from '@angular/core';
import {EmprunteurData} from '../../../data/emprunteur-data';
import {ProjectService} from '../../../service/project.service';
import {EmpruntData} from '../../../data/emprunt-data';

@Component({
  selector: 'app-commande',
  templateUrl: './commande.component.html',
  styleUrls: ['./commande.component.scss']
})
export class CommandeComponent implements OnInit {
  emprunts: Array<EmpruntData>;

  @Input() user: EmprunteurData;

  constructor(private projectService: ProjectService) { }

  ngOnInit(): void {
    this.emprunts = [];
    this.fetchEmprunt();
  }

  private fetchEmprunt() {
    this.projectService.empruntsByUser(this.user.idEmprunteur).subscribe(data => {
      this.emprunts = data;
      for (const emprunt of this.emprunts) {
        this.projectService.exemplaireByEmprunt(emprunt.idEmprunt).subscribe( ex => {
          emprunt.exemplaire = ex;
          this.projectService.editionByExemplaire(String(ex.idExemplaire)).subscribe(edi => {
            emprunt.exemplaire.edition = edi;
            this.projectService.livreByEdition(String(emprunt.exemplaire.edition.idEdition)).subscribe(livre => {
              emprunt.exemplaire.edition.livre = livre;
            });
          });
        });
      }
    });
  }
}
