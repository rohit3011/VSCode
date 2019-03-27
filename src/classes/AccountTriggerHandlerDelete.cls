public class AccountTriggerHandlerDelete{

    public void findDuplicateContactForAnAccount(list<Contact> contRec){
    
    Set<Id> accountId = new set<Id>();
    Map<Id, list<String>> accountIdConatctEmailMap = new Map<Id, list<string>>();
    for(Contact con : contRec){
        if(con.AccountId != null){
            accountId.add(con.AccountId);
            accountIdConatctEmailMap.put(con.AccountId, new list<String>());
            
        }
    }
    
    if(!accountId.isEmpty()){
        list<Contact> con = new list<Contact>([Select Id, email from Contact where AccountId =: accountIdConatctEmailMap.keyset()]);
        
        if(!con.isEmpty()){
            for(Contact cont : con){
                accountIdConatctEmailMap.get(cont.AccountId).add(cont.email);
            }  
        }
        
        For(Contact cont : contRec){
            list<String> contEmail = accountIdConatctEmailMap.get(cont.AccountId);
            If(contEmail.contains(cont.Email)){
                cont.Email.addError('Conatct already exist');
            }
        }
        
    }
        
    }

}