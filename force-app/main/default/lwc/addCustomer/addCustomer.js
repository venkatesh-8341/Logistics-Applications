import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CUSTOMER from '@salesforce/schema/Customer__c';
import NAME_FIELD from '@salesforce/schema/Customer__c.Name';
import LOCATION from '@salesforce/schema/Customer__c.Location__c';
import ADDRESS from '@salesforce/schema/Customer__c.Address__c';
import STATUS from '@salesforce/schema/Customer__c.Status__c';
import EMAIL from '@salesforce/schema/Customer__c.Email__c';


export default class AddCustomer extends LightningElement {

    accountObject = CUSTOMER;
    myFields = [NAME_FIELD, LOCATION, ADDRESS, STATUS,EMAIL];

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Account created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}