@IsTest
public class AccountManagerTest {
	
    @isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https:///ap1.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        // Verify results
       // System.assert(thisCase != null);
       // System.assertEquals('Test record', thisCase.Subject);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account Acc  = new Account(
            Name = 'Test record');
        insert acc;
        Contact con = new Contact(LastName = 'TestContact');
        insert con;
        return acc.Id;
    }
    
}