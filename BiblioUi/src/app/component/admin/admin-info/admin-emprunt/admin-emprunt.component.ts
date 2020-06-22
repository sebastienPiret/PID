import { Component, OnInit } from '@angular/core';
import {ProjectService} from '../../../../service/project.service';
import {EmpruntData} from '../../../../data/emprunt-data';

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
      console.log(data);
      this.emprunts = data;
    });
  }

  resetEmprunt(idEmprunt: number) {
    this.projectService.deleteEmprunt(idEmprunt).subscribe(data => {
      console.log('emprunt remis');
    });
  }
}
