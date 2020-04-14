public class MailController {
    
    public list<Package__c> packageList {get;set;}
    public String trackNumber {get;set;}
 
   
    Public void generatePackageList(){
        packageList = [SELECT name, Account__c, Delivery_Status__c, Recipient_Location__c, weight__c  FROM Package__c WHERE name =: trackNumber  ];
    }
   
   

}