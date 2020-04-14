public class FindEditController {
    public Account acc
    {get;set;}
    public List<Contact> Cons
    {get;set;}
    
    
    public String name
    {get;set;}
    public String phone
    {get;set;}
    public String Street
    {get;set;}
    public String city
    {get;set;}
    public String state
    {get;set;}
    public String country
    {get;set;}
    public String postalCode
    {get;set;}
    public String s
    {get;set;}

    public FindEditController()
    {
        acc = new Account();
        cons = new List<Contact>();
        
    }
    public void findAccount()
    {
        s = '%' + s + '%';
        acc = [SELECT Name, Phone, ID, ShippingStreet, ShippingCity, ShippingState, ShippingCountry, ShippingPostalCode, (SELECT FirstName,LastName, Email, ID FROM Contacts) FROM Account WHERE name LIKE: s LIMIT 1];
       	System.debug(acc);
        
    	System.debug(acc.Contacts.size());
        cons = new List<Contact>();
        for(Integer i = 0; i < acc.Contacts.Size();i++){
           
           Contact c = acc.Contacts[i];
            c.FirstName = c.FirstName;
            c.LastName = c.LastName;
            c.Email = c.Email;
            cons.add(c);
			                     
        }
		       
        system.debug(cons);
               
    }
  


    public void upateAccontName()
    {
        if(name != '')
        {
        acc.Name = name;
        }
        if( phone != '')
        {
        acc.Phone = phone;
        }
        if(street != '')
        {
        acc.ShippingStreet = street;
        }
        if(city != '')
        {
        acc.ShippingCity = city;
        }
        if(country != '')
        {
        acc.ShippingCountry = country;
        }
        if(state != '')
        {
        acc.ShippingState = state;
        }
        if(PostalCode != '')
        {
        acc.ShippingPostalCode = postalCode;
        }
        update acc;
    }

}