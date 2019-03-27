public with sharing class caseOverrideController {
    
    public string accountId;
    public caseOverrideController(ApexPages.StandardController controller) {
        accountId = ApexPages.currentPage().getParameters().get('def_account_id');
        system.debug('**********'+accountId );
    }
    
    public caseOverrideController(){
        
    }
    
    public void updateCaseRecord(){
        
        if(accountId != null){
            Account acc = [Select Id, Name from Account where Id =: accountId];
        }
    }
    
}