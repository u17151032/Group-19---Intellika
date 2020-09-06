import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  isLoginError: boolean = false;
  constructor(private userService: UserService, private router: Router) { }

  ngOnInit(): void {

  }

  OnSubmit(userName,password){
    this.userService.userAuthentication(userName, password).subscribe((data : any)=>{
      localStorage.setItem('userToken', data.access_token);
      localStorage.setItem('userRoles', data.role);
      this.router.navigate(['/home']);
    },
    (err : HttpErrorResponse)=>{
      this.isLoginError=true;
    });
  }

}
