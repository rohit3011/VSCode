public with sharing class ChangeOwner {
    @AuraEnabled
    public static void changeOwner(String recordId){
        Case c = [Select Id ,OwnerId from Case where Id = :recordId] ;
        c.OwnerId = Userinfo.getUserId();
        System.debug('cc'+c);
        update c ; 
    }
}