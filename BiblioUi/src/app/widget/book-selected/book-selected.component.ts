import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {LivreData} from '../../data/livre-data';
import {AuthentificationService} from '../../service/auth/authentification.service';

@Component({
  selector: 'app-book-selected',
  templateUrl: './book-selected.component.html',
  styleUrls: ['./book-selected.component.scss']
})
export class BookSelectedComponent implements OnInit {
  isLogged: boolean;

  @Input() selectedBook: LivreData;

  @Output() goBack = new EventEmitter<any>();

  constructor(private auth: AuthentificationService) {
    this.isLogged = this.auth.isUserLoggedIn();
  }

  ngOnInit(): void {
  }

  goBackToList() {
    this.goBack.emit();
  }

}
