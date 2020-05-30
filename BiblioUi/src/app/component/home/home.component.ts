import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {LivreData} from '../../data/livre-data';
import {ProjectService} from '../../service/project.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  livres: Array<LivreData>;

  constructor(private route: ActivatedRoute, private projectService: ProjectService) {
    this.livres = new Array<LivreData>();
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
      console.log(data);
      this.livres = data;
      console.log(this.livres);
    });
  }


}
