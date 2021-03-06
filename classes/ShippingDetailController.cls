public class ShippingDetailController 
{
    
    public Package__c packValue 
    {get;set;} 
    public List<Package__c> packList 
    {get;set;}
   
    public integer startPoint = 0;
    
    
    public ShippingDetailController()
    {
        PackValue = New Package__c(Delivery_Status__c = 'In Transit');
    }
    public void generatePackList()
    {
         PackList = [SELECT Name FROM Package__c WHERE Delivery_Status__c = :packValue.Delivery_Status__c limit 5 OFFSET :startPoint];
    }
    public void setNextStartPoint()
    {
        integer size = packList.size();
        if(startPoint <= size)
        {
        startPoint += 5;
        generatePackList();
        }
        
    }                  
     public void setPreviousStartPoint()
     {
         if(startPoint >= 5)
         {
        startPoint -= 5;
         generatePackList();
         }
    }
}