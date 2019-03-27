/* Try the following code */
//adding comment from Eclipse
trigger accountTrigger1 on Account (after update) {
    
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();  
    List<Messaging.SingleEmailMessage> emailList1 = new List<Messaging.SingleEmailMessage>();  
    List<Id> accId = new list<Id>();
    List<String> AccountName = new list<String>();
    List<Id> AccountId = new list<Id>();
    
    EmailTemplate et=[Select id from EmailTemplate where DeveloperName =: 'CustomerPortalChangePwdEmail'];
    
    for(Account acc : Trigger.new){ 
        If(acc.active__c == 'Yes'){
            system.debug('*********con'+acc.Owner.Email);
            User user = [select id, name, email from user where id =:acc.ownerId];
            contact con = new Contact(LastName='Sharma', AccountId = acc.Id, Email=user.email);
            insert con;
            system.debug('*********con'+con);
            accId.add(acc.Id);
            system.debug('*********accId'+accId);
            // send email to the account Owner
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();       
            mail.setTargetObjectId(con.Id);
            mail.setSenderDisplayName('Salesforce System');
            mail.setUseSignature(false);
            mail.setWhatId(acc.Id);
            mail.setSaveAsActivity(false);
            //mail.setPlainTextBody('Testing');
            mail.setTemplateId(et.Id);
            emailList.add(mail);
            system.debug('*********emailList'+emailList);
        }
    }    
    
    if(!accId.isEmpty()){
        for(AccountTeamMember rid : [SELECT UserId FROM AccountTeamMember WHERE AccountId =: accId]){
            // send email to the account Team
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();       
            mail.setTargetObjectId(rid.UserId);
            mail.setSenderDisplayName('Salesforce System');
            mail.setUseSignature(false);
            mail.setBccSender(false);
            mail.setSaveAsActivity(false);
           // mail.setPlainTextBody('Testing Account Team');
            mail.setTemplateId(et.Id);
            emailList1.add(mail);
            system.debug('*********emailList1'+emailList1);
        }
    }
    
    // send email if emailList is not empty
    if(!emailList.isEmpty()){
        Messaging.sendEmail(emailList);
    }
        
    // send email if emailList1 is not empty    
    if(!emailList1.isEmpty()){
        Messaging.sendEmail(emailList1);
    }
       
}