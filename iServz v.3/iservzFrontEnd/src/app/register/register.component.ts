import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { AuthService } from '../_services/auth.service';
import { AlertifyService } from '../_services/alertify.service';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import { User } from '../_models/user';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  @Output() cancelRegister =  new EventEmitter();
  user: User;
  registerForm: FormGroup;


  constructor(private authService: AuthService, private alertify: AlertifyService, private fb: FormBuilder, private router: Router, ) { }

  ngOnInit() {
  this.createRegisterForm();
  }

  createRegisterForm(){
    this.registerForm = this.fb.group({
      role: ['Consumer'],
      username: ['', Validators.required],
      firstname: [],
      lastname: ['', Validators.required],
      dateOfBirth: [null, Validators.required],
      city: ['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(8)]],
    });
  }



  register(){
    if(this.registerForm.valid){
      this.user = Object.assign({}, this.registerForm.value );
      this.authService.register(this.user).subscribe(() => {
        this.alertify.success('Registration Succesfull :)');
      }, error => {
        this.alertify.error(error);
      },() => {
        this.authService.login(this.user).subscribe(()=>{
          this.router.navigate(['/serviceRequests']); //see if can use to login too()like an if statement
        });
      });
    }
  }

  cancel(){
    this.cancelRegister.emit(false);
  }

}
