public with sharing class AccountController{

    public static final string test1 = 'first Variable';
    

   @AuraEnabled
   public static list<Account> lstaccounts(){
      list<Account> lst=[Select Id,Name,Description,Phone,Fax from Account order by createdDate DESC limit 10];
      return lst;
   }
   
   @AuraEnabled
    public static Account deleteAccount(Account acc) {
        delete acc;
        return acc;
    }
    
    @AuraEnabled
    public static Account saveAccount(Account acc) {
        upsert acc;
        return acc;
    }
    
    @AuraEnabled
    public static Account saveAccount1(Account acc) {
        upsert acc;
        return acc;
    }
    
    @AuraEnabled
    public static List<Account> getLimitedAccounts(){
        List<Account> accounts = [SELECT
               Id, Name, Phone, Rating, Sic, Customer_ID__c  FROM Account ORDER BY CreatedDate LIMIT 2000];
        return accounts;
	}
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT
               Id, Name, Phone, Rating, Customer_ID__c
               FROM Account LIMIT 200];
    }

    @AuraEnabled
    public static boolean updateAccounts(List<Account> editedAccountList){
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }

}