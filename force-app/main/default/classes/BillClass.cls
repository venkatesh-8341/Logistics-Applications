public with sharing class BillClass {
    public static void updateBillClass(List<Product__c> qqq ) {
        Map<ID, Customer__c> parentroll = new Map<ID, Customer__c>(); 
  List<Id> listIds = new List<Id>();

  for (Product__c childObj : qqq)
  {
    listIds.add(childObj.Customer__c);
  }

  parentroll = new Map<Id, Customer__c>([SELECT id,Product_Name__c FROM Customer__c WHERE ID IN :listIds]);

  for (Product__c cl : qqq)
  {
    Customer__c myParentroll = parentroll.get(cl.Customer__c);
     myParentroll.Product_Name__c = cl.Name;
     myParentroll.Product_Cost__c = cl.Cost__c;

  }
  update parentroll.value();
    }
}