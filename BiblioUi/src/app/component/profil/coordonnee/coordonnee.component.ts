import {ChangeDetectorRef, Component, Input, OnInit, ViewChild} from '@angular/core';
import {EmprunteurData} from '../../../data/emprunteur-data';
import {NgForm} from '@angular/forms';
import {Utils} from '../../../utils/utils';
import {UserService} from '../../../service/user.service';

@Component({
  selector: 'app-coordonnee',
  templateUrl: './coordonnee.component.html',
  styleUrls: ['./coordonnee.component.scss']
})
export class CoordonneeComponent implements OnInit {
  formControlInvalid = Utils.formControlInvalid;

  @Input() user: EmprunteurData;

  @ViewChild('coordForm', { static: true }) coordForm: NgForm;

  constructor(private changeDetectorRef: ChangeDetectorRef, private userService: UserService) { }

  ngOnInit(): void {
    console.log(this.user);
    this.initForm();
  }

  updateUser() {
    this.userService.updateUser(this.user).subscribe(data => {
      console.log('user updated');
    });
  }

  ////////////////////
  // HELPER METHODS //
  ////////////////////

  private initForm(): void {
    if (this.coordForm) {
      this.coordForm.resetForm();
    }

    this.changeDetectorRef.detectChanges();
  }

}
