global class ProjectSharingAccMember  implements Database.Batchable<sObject>{
	global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id, Account__c, Account__r.Id from Project__c]);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        List<Project__Share> newJobShrs = new List<Project__Share>();
        List<Project__c> List_private = new List<Project__c>();
        Map<Id, set<Id>> map_AccountIdAndAccountTeam = new Map<Id, set<Id>>();
        Map<Project__c, Id> map_PrivateIdAndAccountId = new Map<Project__c, Id>();
        List<AccountTeamMember> accTeam = new List<AccountTeamMember>();
        for(sObject obj : scope){
            Project__c p = (Project__c)obj;
                List_private.add(p);
                map_AccountIdAndAccountTeam.put(p.Account__r.Id, new set<Id>());
                map_PrivateIdAndAccountId.put(p, p.Account__r.Id);
                system.debug('********'+List_private);
        }   
        if(!map_AccountIdAndAccountTeam.isEmpty()){
            accTeam = [select Id, AccountId, UserId from AccountTeamMember where AccountId =: map_AccountIdAndAccountTeam.keySet()];
        }
        
        if(!accTeam.isEmpty()){
            for(AccountTeamMember atm : accTeam){
                 map_AccountIdAndAccountTeam.get(atm.AccountId).add(atm.UserId);
            }    
        }
        
        for(Project__c pvt : map_PrivateIdAndAccountId.keySet()){
            set<Id> accountMemberId = map_AccountIdAndAccountTeam.get(pvt.Account__r.Id);
            for(Id userId : accountMemberId){
                Project__Share pvtAccountShr = new Project__Share();
                pvtAccountShr.ParentId = pvt.Id;
                pvtAccountShr.UserOrGroupId = userId;
                pvtAccountShr.AccessLevel = 'Read';
           //   pvtAccountShr.RowCause = Schema.Project__Share.RowCause.Private_One__c;
                
                newJobShrs.add(pvtAccountShr);
            }   
        }
           
        if(!newJobShrs.isEmpty()){
            Database.SaveResult[] IsShareResult = Database.insert(newJobShrs, false);
        }
    }
    global void finish(Database.BatchableContext BC){
    }

}