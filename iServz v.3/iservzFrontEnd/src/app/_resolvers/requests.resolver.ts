import { Injectable } from '@angular/core';
import { Resolve, Router, ActivatedRouteSnapshot } from '@angular/router';
import { UserService } from '../_services/user.service';
import { AlertifyService } from '../_services/alertify.service';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Request } from '../_models/request';
import { AuthService } from '../_services/auth.service';

@Injectable()
export class RequestsResolver implements Resolve<Request[]>{
    pageNumber = 1;
    pageSize = 5;
    messageContainer = 'Unread';

constructor(private userService: UserService, private router: Router, private authService: AuthService ,private alertify: AlertifyService){}

resolve(route: ActivatedRouteSnapshot): Observable<Request[]>{
    return this.userService.getRequests(this.authService.decodedToken.nameid
         , this.pageNumber, this.pageSize, this.messageContainer).pipe(
        catchError(error => {
            this.alertify.error('Problem retrieving requests');
            this.router.navigate(['/home']);
            return of(null);
        })
    );
}
}