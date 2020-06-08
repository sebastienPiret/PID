import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {EmprunteurData} from '../../data/emprunteur-data';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  @Input() user: EmprunteurData;
  @Input() isLogged: boolean;

  @Output() userLogged = new EventEmitter<string>();
  @Output() userUnlogged = new EventEmitter<boolean>();


  constructor() { }

  ngOnInit(): void {
  }

  setUser(login: string) {
    this.userLogged.emit(login);
    this.isLogged = true;
  }

  unSetUser() {
    this.userUnlogged.emit();
    this.isLogged = false;
  }
}
