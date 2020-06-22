import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../../../service/auth/authentification.service';
import {FormBuilder} from '@angular/forms';
import {Router} from '@angular/router';
import {UserService} from '../../../service/user.service';
import {EmprunteurData} from '../../../data/emprunteur-data';
import {BibliothecaireData} from '../../../data/bibliothecaire-data';
import {AdminService} from '../../../service/admin.service';

@Component({
  selector: 'app-admin-login',
  templateUrl: './admin-login.component.html',
  styleUrls: ['./admin-login.component.scss']
})
export class AdminLoginComponent implements OnInit {
  login;
  token;
  logged = false;
  isLogged: boolean;
  private user: BibliothecaireData;


  loginForm = this.fb.group({
    mail: [],
    password: []
  });

  constructor(private authService: AuthentificationService, private fb: FormBuilder,
              private route: Router, private userService: AdminService) { }

  ngOnInit(): void {
  }

  onSubmit() {
    this.fetchUser(this.loginForm.value.mail);

  }

  private fetchUser(userMail: any) {
    this.userService.userByMail(userMail).subscribe(data => {
      this.user = data;
      console.log(this.user.role);
      if (this.user.role === 'ADMIN') {
        this.authService.executeJWTAuthenticationService(this.loginForm.value.mail, this.loginForm.value.password).subscribe(
          response => {
            this.login = this.authService.getAuthenticatedUser();
            this.token = this.authService.getAuthenticatedToken();
            this.logged = true;
            this.authService.nextMessageAdmin(true);
            this.authService.nextAdminMessage(this.user);
            this.route.navigate(['admin/info']);
          }
        );
      }

    });
  }
}
