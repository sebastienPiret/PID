import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {FormBuilder} from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  login;
  token;
  logged = false;

  loginForm = this.fb.group({
    mail: [],
    password: []
  });

  constructor(private authService: AuthentificationService, private fb: FormBuilder) { }

  ngOnInit(): void {

  }

  onSubmit() {
    this.authService.executeJWTAuthenticationService(this.loginForm.value.mail, this.loginForm.value.password).subscribe(
      response => {
        this.login = this.authService.getAuthenticatedUser();
        this.token = this.authService.getAuthenticatedToken();
        this.logged = true;
      }
    );
  }

  logout() {
    this.authService.logout();
    this.login = this.authService.getAuthenticatedUser();
    this.token = this.authService.getAuthenticatedToken();
    this.logged = false;
  }
}
