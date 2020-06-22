import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../../../service/auth/authentification.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-admin-menu',
  templateUrl: './admin-menu.component.html',
  styleUrls: ['./admin-menu.component.scss']
})
export class AdminMenuComponent implements OnInit {

  constructor(private authService: AuthentificationService, private route: Router) { }

  ngOnInit(): void {
  }

  logout() {
    this.authService.logout();
    const login = this.authService.getAuthenticatedUser();
    const token = this.authService.getAuthenticatedToken();
    const logged = false;
    this.authService.nextMessageAdmin(false);
    this.authService.nextAdminMessage(null);
    this.route.navigate(['admin']);
  }

}
