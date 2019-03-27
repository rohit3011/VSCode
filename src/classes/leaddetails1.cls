public with sharing class leaddetails1 {
    public String state {get;set;}
    public lead lead{set;get;}
    
    public leaddetails1(){
        lead = new lead();
    }
    
    public List<SelectOption> getStates(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));      
        options.add(new SelectOption('Rajasthan','Rajasthan'));
        options.add(new SelectOption('MP','MP'));
        options.add(new SelectOption('UP','UP'));
        return options;
    }
    
    public pageReference createLead(){
        lead.Industry = state;
        Insert lead;
        pageReference p=new pageReference('/'+lead.id);
        return p;

     /*   if(lead.LastName != null && lead.Lastname != ''){
            account acc = new account();
            acc.Name=lead.LastName;
            insert acc;
            
            contact con=new contact();
            con.lastName = lead.lastName;
            con.AccountId = acc.Id;
            insert con;
            
            pageReference p = new pageReference('/'+acc.id);
            return p;
         }
         else{
             Insert lead;
             pageReference p=new pageReference('/'+lead.id);
             return p;

        }    */
    }
    
    public void cancelLead(){
        lead=null;
    }
}