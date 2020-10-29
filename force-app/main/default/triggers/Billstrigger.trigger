trigger Billstrigger on Product__c (after insert,after update) {
    BillsClass.updateBillsClass(Trigger.New);
}