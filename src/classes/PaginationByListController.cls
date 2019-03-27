public with sharing class PaginationByListController {
        public List<Account> accList {get; set;}
        public Integer paginationSize {get; set;}
        public Integer listNumber;
        List<List<Account>> ListOfListAccount;
   
        public PaginationByListController()
        {
            paginationSize = 3;
            setAccountList();
       
        }
        public void setAccountList()
        {
            integer i = 0;
            listNumber = 0;
            System.debug('paginationSize'+paginationSize);
            ListOfListAccount = new List<List<Account>>();
            for(Account a : [Select Id, Name, AccountNumber, Phone from Account])
            {
                if(math.mod(i, paginationSize) == 0)
                {
                    List<Account> tempAccountList = new List<Account>();
                    tempAccountList.add(a);
                    ListOfListAccount.add(tempAccountList);
                }
                else
                {
                    ListOfListAccount.get(ListOfListAccount.Size() - 1).add(a);
               
                }
                i++;
           
            }
            accList = ListOfListAccount.get(listNumber);
           
        }
        public void next()
        {
            if(ListOfListAccount.Size()-1 > listNumber)
            accList = ListOfListAccount.get(++listNumber);       
        }
   
        public void previous()
        {
            if(0 < listNumber)
            accList = ListOfListAccount.get(--listNumber);       
        }
   
        public boolean gethasPrevious()
        {
            if(listNumber > 0)
            return true;   
            return false;
        }
   
        public boolean gethasNext()
        {
            if(listNumber < ListOfListAccount.Size() -1)
            return true;   
            return false;
        }
       
    }