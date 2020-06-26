import { Component, OnInit } from '@angular/core';
import {ProjectService} from '../../../../service/project.service';
import {EmpruntData} from '../../../../data/emprunt-data';
import {ExemplaireData} from '../../../../data/exemplaire-data';

@Component({
  selector: 'app-admin-emprunt',
  templateUrl: './admin-emprunt.component.html',
  styleUrls: ['./admin-emprunt.component.scss']
})
export class AdminEmpruntComponent implements OnInit {

  emprunts: Array<EmpruntData>;

  constructor(private projectService: ProjectService) { }

  ngOnInit(): void {
    this.fetchEmprunt();
  }

  private fetchEmprunt() {
    this.projectService.emprunt().subscribe(data => {

      this.emprunts = data;
      for (const emprunt of this.emprunts) {
        this.projectService.exemplaireByEmprunt(emprunt.idEmprunt).subscribe(ex => {
          console.log(ex);
          emprunt.exemplaire = ex;
          this.projectService.editionByExemplaire(String(emprunt.exemplaire.idExemplaire)).subscribe(edi => {
            emprunt.exemplaire.edition = edi;
          });
        });
        this.projectService.emprunteurByEmprunt(emprunt.idEmprunt).subscribe(emp => {
          console.log(emp);
          emprunt.emprunteur = emp;
        });
      }

    });
  }

  resetEmprunt(emprunt: EmpruntData, exemplaire: ExemplaireData) {
    emprunt.isActif = 0;
    emprunt.dateRetour = new Date().toDateString();
    this.projectService.deleteEmprunt(emprunt).subscribe(data => {
      console.log('emprunt remis');
      exemplaire.enStock = 1;

      this.projectService.setExemplaireInOut(exemplaire).subscribe(ex => {
        this.fetchEmprunt();
      });
    });
  }
}
