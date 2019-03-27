@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
	//New Branch
    public final string test1;
    public final string test2;
    public final string test3;
    

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT Id,Name, (Select Id, name from Contacts) FROM Account WHERE Id = :accId];
        return result;
    }

}