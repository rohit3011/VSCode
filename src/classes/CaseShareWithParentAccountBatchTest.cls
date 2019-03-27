@isTest
Public Class CaseShareWithParentAccountBatchTest{

    public static testMethod void testBatchClass() {
        
        Profile p = [select id from profile where name='System Administrator'];
        List<User> partnerUserList = new List<User>();
        
        //Creating List of Portal User Records of Type 'Worker'
        for(integer i=0;i<2;i++){
            User testpartnerRecord= new User();
            testpartnerRecord.lastname='Test'+i; 
            testpartnerRecord.firstname='testmethod';
            testpartnerRecord.Username= 'Robin'+i+'@test.com';        
            testpartnerRecord.EmailEncodingKey='UTF-8';
            testpartnerRecord.TimeZoneSidKey= 'GMT';
            testpartnerRecord.ProfileId=p.id; 
            testpartnerRecord.LocaleSidKey= 'en_IN';   
            testpartnerRecord.LanguageLocaleKey= 'en_US';
            testpartnerRecord.IsActive=true;        
            testpartnerRecord.Email='test@test.com';
            testpartnerRecord.CommunityNickname= 'Test1'+i+'lastname'; 
            testpartnerRecord.Alias= 'Test'+i+'la';       
            partnerUserList.add(testpartnerRecord);
        }
        insert partnerUserList;
        
        Account acc = new Account();
        acc.name = 'Test Account';
        insert acc;
        
        AccountTeamMember act = new AccountTeamMember();
        //list<AccountTeamMember> actList = new list<AccountTeamMember>();
        for(user u : partnerUserList){
            act.UserId = '00590000001DtwV';
            act.TeamMemberRole = 'Account Manager';
            act.AccountId = acc.Id;
            insert act;
          //  accList.add(act);
        } 
        
        Project__c pro = new Project__c();
        pro.Name = 'Test Project';
        pro.Account__c = acc.Id;
        insert pro;
        
        Test.startTest();
        Id batchInstanceid = Database.executebatch(new ProjectSharingAccMember(), 10);  
        Test.stopTest();
    }
}