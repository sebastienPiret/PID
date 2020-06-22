import { Component, OnInit } from '@angular/core';
import {BibliothecaireData} from '../../../data/bibliothecaire-data';
import {AuthentificationService} from '../../../service/auth/authentification.service';
import {AdminService} from '../../../service/admin.service';

@Component({
  selector: 'app-admin-info',
  templateUrl: './admin-info.component.html',
  styleUrls: ['./admin-info.component.scss']
})
export class AdminInfoComponent implements OnInit {
  admin: BibliothecaireData;
  selectedTab: number;

  constructor(private auth: AuthentificationService, private userService: AdminService) {
    this.selectedTab = 1;
  }

  ngOnInit(): void {
    this.auth.adminSharedMessage.subscribe(message => {
      this.admin = message;
      this.fetchUser(String(this.admin.idBibliothecaire));
    });
  }

  private fetchUser(userId: string) {


    this.userService.questionsByUserId(userId).subscribe( question => {
      this.admin.questions = question;
    });

  }

  isSelected(tabIndex: number): boolean {
    return this.selectedTab === tabIndex;
  }

  selectTab(tabIndex: number): void {
    this.selectedTab = tabIndex;
  }

}
