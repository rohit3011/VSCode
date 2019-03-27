public class AccountListController {
    //Create variable in GITHUB
    public static final string test1 = 'first Variable';
    public final string test2;
    
    @AuraEnabled
    public static List < Account > fetchAccts() {
        return [ SELECT Id, Name, Industry, Type FROM Account LIMIT 10 ];
    }
    
    // Created method for test from Eclipse
    @AuraEnabled
    public static List < Account > fetchAccts2() {
        return [ SELECT Id, Name, Industry, Type FROM Account LIMIT 10 ];
    }
    
    //Create method for testing from GITBUG
    @AuraEnabled
    public static List < Account > fetchAcctsNew() {
        return [ SELECT Id, Name, Industry, Type FROM Account LIMIT 10 ];
}
    
}