/************************************************************
 
 Name: CreateCandidateRecord
 Type: Apex Class  
 Purpose: Apex Class  for  lightning component 
          CreateCandidateRecordController.cmp
 ***********************************************************/
public with sharing class CreateExpenseRecord {

    /**
   * Create a new candidate Record
   *
   * @param Candidate__c candidate  candidate record to be inserted
   * 
   */
    @AuraEnabled
    public static void createExpense(Expense__c theExpenses){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+theExpenses);
            
            if(theExpenses != null){
                insert theExpenses;
            }
            
        } catch (Exception ex){
            
        }
        
    }    
}