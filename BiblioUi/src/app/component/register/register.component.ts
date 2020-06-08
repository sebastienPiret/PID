import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {NgForm, NgModel} from '@angular/forms';
import {EmprunteurData} from '../../data/emprunteur-data';
import {UserService} from '../../service/user.service';
import {Utils} from '../../utils/utils';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  newUser: EmprunteurData;
  userCreated: boolean;
  formControlInvalid = Utils.formControlInvalid;
  confirmation: string;

  @ViewChild('addForm', { static: true }) addForm: NgForm;

  constructor(private changeDetectorRef: ChangeDetectorRef, private userService: UserService) {
    this.newUser = {} as EmprunteurData;
    this.userCreated = false;
  }

  ngOnInit(): void {
    console.log(this.userCreated);
    this.initForm();
  }

  createUser() {
    this.newUser.actif = 1;
    this.newUser.idEmprunteur = Number(Utils.createUuid());
    console.log(this.newUser.idEmprunteur);
    this.userService.setUser(this.newUser).subscribe(data => {
      console.log('user added');
      this.userCreated = true;
    });
  }

  ////////////////////
  // HELPER METHODS //
  ////////////////////

  private initForm(): void {
    this.userCreated = false;
    if (this.addForm) {
      this.addForm.resetForm();
    }

    this.changeDetectorRef.detectChanges();
  }

  confirmPass(confirmPassword: NgModel) {
    console.log(this.newUser.mdp + ' = ' + confirmPassword.value);
    if (confirmPassword.control.value === this.newUser.mdp ) {
      return false;
    }
    return true;
  }
}
