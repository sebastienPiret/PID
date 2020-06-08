import {Component, OnDestroy, OnInit} from '@angular/core';
import {UserService} from '../../service/user.service';
import {EmprunteurData} from '../../data/emprunteur-data';
import {AUTHENTICATED_USER, AuthentificationService} from '../../service/auth/authentification.service';

@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss']
})
export class LayoutComponent implements OnInit, OnDestroy {
  user: EmprunteurData;
  isLogged: boolean;
  isSomebodyLogged: boolean;

  constructor(private userService: UserService, private auth: AuthentificationService) {
    this.isLogged = this.auth.isUserLoggedIn();
    const user = sessionStorage.getItem(AUTHENTICATED_USER);
    if (user) {
      this.fetchUser(user);
    }
  }

  ngOnInit(): void {

  }

  fetchUser(mail: string): void {
    this.userService.userByMail(mail).subscribe(data => {
      this.user = data;
      this.isLogged = true;
    });
  }

  ngOnDestroy(): void {
    // this.auth.logout();
  }

  unsetUser() {
    this.isLogged = false;
    this.user = null;
    this.auth.logout();
  }
}
