import {NgModel} from '@angular/forms';

export class Utils {
  public static createUuid() {
    let text = '';
    const possible = '0123456789';

    for (let i = 0; i < 12; i++) {
      text += possible.charAt(Math.floor(Math.random() * possible.length));
    }

    return text;
  }

  public static formControlInvalid(control: NgModel): boolean {
    return control.invalid && (control.dirty || control.touched);
  }
}
