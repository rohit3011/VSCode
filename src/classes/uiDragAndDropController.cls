global with sharing class uiDragAndDropController{
    
    public List<Account> getAccounts(){
        return [Select Id, Name, rank__c, AccountNumber, OwnerId, Phone, Fax From Account where rank__c != null and rank__c <= 10 ORDER BY Rank__c];
    }
    
    @RemoteAction
    global static String reorderArticles(String orderList, String deleteList) {
        String retVal = 'OK';
        try {
            List<String> lReorderId = new List<String>();
            List<String> lDeleteId = new List<String>();
            if(orderList != null && orderList != '') {
                lReorderId.addAll(orderList.replaceAll('[ \\[\\]]', '').split(',')); // Remove space and '[', ']'
            }
            if(deleteList != null && deleteList != '') {
                lDeleteId.addAll(deleteList.replaceAll(' ', '').split(','));
            }
            System.debug('Reorder Ids: ' + lReorderId);
            System.debug('Delete Ids: ' + lDeleteId);
            if(lDeleteID.size() > 0) {
                List<Account> lDelPopTop = [SELECT Id from Account where Id in :lDeleteId];
                delete lDelPopTop;
            } 
            if(lReorderId.size() > 0) {
                List<Account> lPopTop = new List<Account>();
                for(Integer i = 0; i < lReorderId.size(); i++) {
                    System.debug('>>>>> ' + lReorderId[i]);
                    Account popTop = new Account(id = lReorderId[i], Rank__c = i+1);
                    lPopTop.add(popTop);
                }
                upsert lPopTop Account.Id;
            }
        } catch (Exception ex) {
            retVal = 'ERROR: ' + ex.getMessage();
        }
        return retVal;
        
    }
    
}