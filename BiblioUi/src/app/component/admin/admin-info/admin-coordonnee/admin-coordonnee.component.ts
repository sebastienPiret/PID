import {ChangeDetectorRef, Component, Input, OnInit, ViewChild} from '@angular/core';
import {BibliothecaireData} from '../../../../data/bibliothecaire-data';
import {Utils} from '../../../../utils/utils';
import {NgForm} from '@angular/forms';
import {AdminService} from '../../../../service/admin.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-admin-coordonnee',
  templateUrl: './admin-coordonnee.component.html',
  styleUrls: ['./admin-coordonnee.component.scss']
})
export class AdminCoordonneeComponent implements OnInit {
  formControlInvalid = Utils.formControlInvalid;

  @Input() admin: BibliothecaireData;

  @ViewChild('coordForm', { static: true }) coordForm: NgForm;

  constructor(private changeDetectorRef: ChangeDetectorRef, private userService: AdminService, private route: Router) { }

  ngOnInit(): void {
    if (this.admin === null) {
      this.route.navigate(['admin']);
    }
    this.initForm();
  }

  updateUser() {
    this.userService.updateUser(this.admin).subscribe(data => {
      console.log('user updated');
    });
  }

  private initForm(): void {
    if (this.coordForm) {
      this.coordForm.resetForm();
    }

    this.changeDetectorRef.detectChanges();
  }

}
