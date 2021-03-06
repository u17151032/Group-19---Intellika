import { MemberDetailComponent } from './members/member-detail/member-detail.component';
import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ServiceRequestsComponent } from './members/service-requests/service-requests.component';
import { ServiceOrdersComponent } from './service-orders/service-orders.component';
import { MessagesComponent } from './messages/messages.component';
import { AuthGuard } from './_guards/auth.guard';

export const appRoutes: Routes = [
 { path: '', component: HomeComponent},
 {
   path: '',
   runGuardsAndResolvers: 'always',
   canActivate: [AuthGuard],
   children: [
    { path: 'serviceRequests', component: ServiceRequestsComponent},//changed from members
    { path: 'serviceRequests/:id', component: MemberDetailComponent},
    { path: 'serviceOrders', component: ServiceOrdersComponent},
    { path: 'messages', component: MessagesComponent},
   ]
 },

 { path: '**', redirectTo: '', pathMatch: 'full'},
];
