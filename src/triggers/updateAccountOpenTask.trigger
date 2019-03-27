trigger updateAccountOpenTask on Task (before update) {
   List<Task> taskList = new list<Task>();    
   List<Account> accountList = new list<Account>();    
   for(task taskRecord : trigger.new){
       if(Trigger.oldMap.get(taskRecord.Id).Status == 'Not Started') {
           If(Trigger.newMap.get(taskRecord.Id).Status == 'In Progress'){
               taskList.add(taskRecord);
               system.debug('***********'+taskList);
               for(Account acc : [Select Id, Name, AccountNumber, Site from Account where Id =: taskRecord.WhatId]){
                   acc.AccountNumber = taskRecord.Subject;
                   acc.Site = taskRecord.Subject;
                   accountList.add(acc);
                   system.debug('***********'+accountList);
               }    
           }
       }
   }
   update accountList;
   system.debug('***********'+accountList);
      
}