import {Component, OnDestroy, OnInit} from '@angular/core';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit, OnDestroy {

  isLogged: boolean;

  constructor(private auth: AuthentificationService, private route: Router) {

  }

  ngOnDestroy(): void {
    // this.userSubscription.unsubscribe();
  }

  ngOnInit(): void {
    this.auth.sharedMessage.subscribe( message => {
      this.isLogged = message;
    });

  }

}
