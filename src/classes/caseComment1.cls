public with sharing class caseComment1 {

    public caseComment1(ApexPages.StandardController controller) {

    }
    
    public string text {get;set;}
    private list<caseComment> ca {get;set;}
    
    public CaseComment1()
    {
        list<caseComment> ca = new list<caseComment>();
    }
   public PageReference save() 
   {
      // ca = [Select Id, commentBody, ParentId from CaseComment where ParentId =: '5009000001IMGZg' limit 1];
      // ca.CommentBody = 'Test';   
      // c.ParentId = '5009000000dza7i';
       
        return null;
   }

}