import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../../../service/auth/authentification.service';

@Component({
  selector: 'app-admin-layout',
  templateUrl: './admin-layout.component.html',
  styleUrls: ['./admin-layout.component.scss']
})
export class AdminLayoutComponent implements OnInit {
  isLogged: boolean;

  constructor(private auth: AuthentificationService) {

  }

  ngOnInit(): void {
    this.auth.logout();
    this.auth.nextUserMessage(null);
    this.auth.nextMessage(false);
    this.auth.sharedMessageAdmin.subscribe(message => {
      this.isLogged = message;
    });
  }

}
