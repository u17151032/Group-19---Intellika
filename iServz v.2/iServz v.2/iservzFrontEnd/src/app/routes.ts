import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ServiceRequestsComponent } from './members/service-requests/service-requests.component';
import { ServiceOrdersComponent } from './service-orders/service-orders.component';
import { MessagesComponent } from './messages/messages.component';
import { AuthGuard } from './_guards/auth.guard';
import { MemberDetailComponent } from './members/service-requests/member-detail/member-detail.component';
import { MemberDetailResolver } from './_resolvers/member-detail.resolver';
import { MemberListResolver } from './_resolvers/member-list.resolver';
import { MemberEditComponent } from './members/service-requests/member-edit/member-edit.component';
import { MemberEditResolver } from './_resolvers/member-edit.resolver';
import { PreventUnsavedChanges } from './_guards/prevent-unsaved-changes.guard';
import { MessagesResolver } from './_resolvers/messages.resolver';

export const appRoutes: Routes = [
 { path: '', component: HomeComponent},
 {
   path: '',
   runGuardsAndResolvers: 'always',
   canActivate: [AuthGuard],
   children: [
    { path: 'serviceRequests', component: ServiceRequestsComponent, resolve: {users: MemberListResolver}},
    { path: 'serviceRequests/:id', component: MemberDetailComponent, resolve: {user: MemberDetailResolver}},
    { path: 'members/edit', component: MemberEditComponent, resolve: {user: MemberEditResolver}, canDeactivate: [PreventUnsavedChanges] },
    { path: 'serviceOrders', component: ServiceOrdersComponent},
    { path: 'messages', component: MessagesComponent, resolve: {messages: MessagesResolver}},
   ]
 },

 { path: '**', redirectTo: '', pathMatch: 'full'},
];
