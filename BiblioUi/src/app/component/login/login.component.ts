import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {FormBuilder} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  login;
  token;
  logged = false;
  @Input() isLogged: boolean;

  @Output() userLogged = new EventEmitter<string>();
  @Output() userUnlogged = new EventEmitter<boolean>();

  loginForm = this.fb.group({
    mail: [],
    password: []
  });

  constructor(private authService: AuthentificationService, private fb: FormBuilder, private route: Router) { }

  ngOnInit(): void {

  }

  onSubmit() {
    this.authService.executeJWTAuthenticationService(this.loginForm.value.mail, this.loginForm.value.password).subscribe(
      response => {
        this.login = this.authService.getAuthenticatedUser();
        this.token = this.authService.getAuthenticatedToken();
        this.logged = true;
        this.userLogged.emit(this.login);
      }
    );
  }

  logout() {
    this.authService.logout();
    this.login = this.authService.getAuthenticatedUser();
    this.token = this.authService.getAuthenticatedToken();
    this.logged = false;
    this.userUnlogged.emit();
    this.route.navigate(['/']);
  }
}
