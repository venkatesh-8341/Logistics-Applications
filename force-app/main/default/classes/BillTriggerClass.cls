public with sharing class BillTriggerClass {
    public static void updateBillTriggerClass(List<Driver__c> ppp)
    {
    Map<ID, Customer__c> parentroll = new Map<ID, Customer__c>(); 
  List<Id> listIds = new List<Id>();

  for (Driver__c childObj : ppp)
  {
    listIds.add(childObj.Customer__c);
  }

  parentroll = new Map<Id, Customer__c>([SELECT id, Total_Cost__c,Delivery_Charge__c,Driver_Name__c FROM Customer__c WHERE ID IN :listIds]);

  for (Driver__c cl : ppp)
  {
    Customer__c myParentroll = parentroll.get(cl.Customer__c);
     myParentroll.Total_Cost__c = cl.Total_Cost__c;
     myParentroll.Delivery_Charge__c = cl.Delivery_Charge__c;
     myParentroll.Driver_Name__c = cl.Name;
  }
  update parentroll.values();   
    }
}