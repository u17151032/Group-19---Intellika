
import { Component, OnInit, Input } from '@angular/core';
import { Request } from 'src/app/_models/request';

import { AlertifyService } from 'src/app/_services/alertify.service';
import { AuthService } from 'src/app/_services/auth.service';
import { UserService } from 'src/app/_services/user.service';

@Component({
  selector: 'app-member-requests',
  templateUrl: './member-requests.component.html',
  styleUrls: ['./member-requests.component.scss']
})
export class MemberRequestsComponent implements OnInit {
  @Input() recipientId: number;
  requests: Request[];
  newRequest: any = {};

  constructor(private userService: UserService, private authService: AuthService,
    private alertify: AlertifyService) { }

  ngOnInit() {
    this.loadRequests();
  }

  loadRequests() {
    //const currentUserId = +this.authService.decodedToken.nameid;
    this.userService.getRequestThread(this.authService.decodedToken.nameid, this.recipientId)
      //.pipe(
        //tap(messages => {
          //for (let i = 0; i < messages.length; i++) {
            //if (messages[i].isRead === false && messages[i].recipientId === currentUserId) {
              //this.userService.markAsRead(currentUserId, messages[i].id);
            //}
          //}
        //})
      //)
      .subscribe( requests => {
        this.requests = requests;
    }, error => {
      this.alertify.error(error);
    });
  }

  sendRequest() {
    this.newRequest.recipientId = this.recipientId;
    this.userService.sendRequest(this.authService.decodedToken.nameid, this.newRequest)
      .subscribe((request: Request) => {
        this.requests.unshift(request);
        this.newRequest.description = '';
        this.newRequest.date = '';
        this.newRequest.address1 = '';
        this.newRequest.time = '';//clear fields after sending
        this.newRequest.address2 = '';
        this.newRequest.address3 = '';
        
    }, error => {
      this.alertify.error(error);
    });
  }

}
