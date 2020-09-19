import { Component, OnInit } from '@angular/core';
import { User } from '../../_models/user';
import { UserService } from '../../_services/user.service';
import { AlertifyService } from '../../_services/alertify.service';
import { ActivatedRoute } from '@angular/router';
import { Pagination, PaginatedResult } from 'src/app/_models/pagination';

@Component({
  selector: 'app-service-requests',
  templateUrl: './service-requests.component.html',
  styleUrls: ['./service-requests.component.scss']
})
export class ServiceRequestsComponent implements OnInit {
  users: User[];
  pagination: Pagination;
  user: User = JSON.parse(localStorage.getItem('user'));
  serviceList = [{value: 'plumbing', display: 'Plumbing'}, {value: 'houseKeeping', display: 'House Keeping'},{value: 'gardening', display: 'Gardening'},{value: 'carServices', display: 'Car Services'}, {value: 'installations', display: 'Installations'}];
  userParams: any = {};

  constructor(private userService: UserService, private alertify: AlertifyService, private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.data.subscribe(data => {
      this.users = data['users'].result;
      this.pagination = data['users'].pagination;
    });
  }

    pageChanged(event: any): void {
      this.pagination.currentPage = event.page;
      this.loadUsers();
    }

    
  
  loadUsers() {
    this.userService.getUsers(this.pagination.currentPage, this.pagination.itemsPerPage, this.userParams)
    .subscribe((res: PaginatedResult<User[]>)=>{
      this.users = res.result;
      this.pagination = res.pagination;
    } , error => {
      this.alertify.error(error);
    });
 
  }




  }


