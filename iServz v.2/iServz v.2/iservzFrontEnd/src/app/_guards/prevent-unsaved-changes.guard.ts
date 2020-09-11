import { Injectable } from '@angular/core';
import { CanDeactivate } from '@angular/router';
import { MemberEditComponent } from '../members/service-requests/member-edit/member-edit.component';

@Injectable()
export class PreventUnsavedChanges implements CanDeactivate<MemberEditComponent>{
    canDeactivate(component: MemberEditComponent){
        if (component.editForm.dirty){
            return confirm('Are tou sure you want to continue? Any unsaved changes will be lost');
        }
        return true;
    }
}