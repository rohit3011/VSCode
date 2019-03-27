public with sharing class ResetUserPassword_DynamicSearch {
    
    public string userName{get; set;}
    public Boolean searched {get; set;}
    public Boolean zeroResults {get; set;}
    public List<User> userList {get; set;}   
    public String selectedUserId {get; set;} 
    
    public ResetUserPassword_DynamicSearch(){
        searched = False;
        zeroResults = False;
    }
    
    public pageReference searchUser() {
        String userNameId = Apexpages.currentPage().getParameters().get('userNameId');
        system.debug('********'+userNameId);  
         searched = true;
        String query='';
        query = 'Select Id, Name, Email, UserName, Alias, Profile.Name from user where isPortalEnabled = true ';
        if (!userNameId.equals('')){            
            query += ' AND Name like ' + '\'%' +userNameId+ '%\'';
            //like ' + '\'%' +userName+ '%\''
        }    
        //    Add Results to searchResults
        userList = (List<User>)database.query(query);
        system.debug('********'+userList);  
        return null; 
        
      /*  if(userList.size() > 0){
            searched = true;
        }    */
    }
    
    public pageReference passwordReset(){
        System.resetPassword(selectedUserId,true);
        return null;
        /*List<User> u = new List<User>();
        List<Id> ids = new List<Id>();
        String test = '005e0000002w3pHAAQ';
        u = Database.Query('SELECT Id, Name, email FROM User WHERE id =:test');
        System.debug('User details are ' + u);
        for(User usr : u){
            System.resetPassword(usr.Id,true);
        }*/
    }
    
}