import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ServiceRequestsComponent } from './service-requests/service-requests.component';
import { ServiceOrdersComponent } from './service-orders/service-orders.component';
import { MessagesComponent } from './messages/messages.component';

export const appRoutes: Routes = [
 { path: 'home', component: HomeComponent},
 { path: 'serviceRequests', component: ServiceRequestsComponent},
 { path: 'serviceOrders', component: ServiceOrdersComponent},
 { path: 'messages', component: MessagesComponent},
 { path: '**', redirectTo: 'home', pathMatch: 'full'},
];
