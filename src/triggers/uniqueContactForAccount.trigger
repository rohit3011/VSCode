trigger uniqueContactForAccount on Contact(before Insert){
    
    AccountTriggerHandlerDelete acc = new AccountTriggerHandlerDelete();
    acc.findDuplicateContactForAnAccount(trigger.new);
    
    
    
}