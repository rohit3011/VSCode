public class cookeiController {
    
    public string conFirstName {get;set;}
    public string conLastName {get;set;}
    public string conEmail {get;set;}
    public contact con;
    private string savedSettings = null;
    private string savedSettings1 = null;
    
    //Reference: http://developer.force.com/cookbook/recipe/storing-form-field-values-with-the-apex-cookie-class
    public cookeiController(ApexPages.StandardController controller) {
        con = new contact();
        
        // Method to get the cookie
        Cookie counter = ApexPages.currentPage().getCookies().get('TestCookie');
        system.debug('***********'+counter);
        // on debug it will return // System.Cookie[TestCookie=Test;path=/;expires=-1;isSecure=false]
        
       // Method to set the cookie from apex
       // Cookie companyName = new Cookie('companyName','Rohit',null,315569260,false);
       // ApexPages.currentPage().setCookies(new Cookie[]{companyName});
       
       // Method to get the cookie
       // savedSettings = getCookie('companyName');
       // system.debug('*******savedSettings****'+savedSettings);
        
        savedSettings1 = getCookie('TestCookie');
        system.debug('*******savedSettings1****'+savedSettings1);

    }
    
    // Method to get the cookie
    private String getCookie(String cookieName)
    {
        Cookie ck = ApexPages.currentPage().getCookies().get(cookieName);
         
        return ck != null ? ck.getValue() : '';
    }
    
    public pageReference saveContact(){
        con = new contact();
        con.firstName = conFirstName;
        con.lastName = conLastName;
        con.Email = conEmail;
        insert con;
        string pageurl = ('/'+con.Id); 
        PageReference pageRef = new PageReference(pageurl);
        pageRef.setRedirect(true); 
        return null; 
        
    }
}