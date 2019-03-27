@isTest
public class AccountTriggerTest{
    
    public static List<Account> accList;
    
    @isTest static void testMethod1(){
        accList = new list<Account>();
        for(Integer i=0; i<200; i++){
            Account acc = new Account(Name='Test Account'+i, BillingState = 'CA');
            accList.add(acc);
        }
            insert accList; 
        
    }
    
}