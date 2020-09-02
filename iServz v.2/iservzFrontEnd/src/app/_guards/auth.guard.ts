import { Injectable } from '@angular/core';
import { CanActivate, UrlTree, Router } from '@angular/router';
import { AuthService } from '../_services/auth.service';
import { AlertifyService } from '../_services/alertify.service';


@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router, private alertify: AlertifyService){}

  canActivate(): boolean | UrlTree {
    if(this.authService.loggedIn()){
      return true;
    }

    this.alertify.error('Nah, Unlucky gg');
    this.router.navigate(['/home']);
    return false;
  }

}
