trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {
    
    set<Id> oppSet = new set<Id>();
    for(Opportunity opp : trigger.new){
        if(opp.StageName == 'Closed Won'){
            oppSet.add(opp.Id);
        }
    }
    
    if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert)){
        list<task> taskList = new list<task>();
        for(Id oppId : oppSet){
            task taskRec = new task(Subject='Follow Up Test Task', whatId=oppId, Priority='Normal', Status='Completed');
            taskList.add(taskRec);
        }
        insert taskList;
    }    
}