import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AuthentificationService} from '../../service/auth/authentification.service';
import {FormBuilder} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {UserService} from '../../service/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  login;
  token;
  logged = false;
  isLogged: boolean;


  loginForm = this.fb.group({
    mail: [],
    password: []
  });

  constructor(private authService: AuthentificationService, private fb: FormBuilder,
              private route: Router, private userService: UserService) { }

  ngOnInit(): void {
    this.authService.sharedMessage.subscribe( message => {
      this.isLogged = message;
    });
  }

  onSubmit() {
    this.authService.executeJWTAuthenticationService(this.loginForm.value.mail, this.loginForm.value.password).subscribe(
      response => {
        this.login = this.authService.getAuthenticatedUser();
        this.token = this.authService.getAuthenticatedToken();
        this.logged = true;
        this.authService.nextMessage(true);
        this.fetchUser(this.login);
      }
    );
  }

  logout() {
    this.authService.logout();
    this.login = this.authService.getAuthenticatedUser();
    this.token = this.authService.getAuthenticatedToken();
    this.logged = false;
    this.authService.nextMessage(false);
    this.authService.nextUserMessage(null);
    this.route.navigate(['/']);
  }

  private fetchUser(userMail: string) {
    this.userService.userByMail(userMail).subscribe(data => {
      this.authService.nextUserMessage(data);
    });
  }
}
