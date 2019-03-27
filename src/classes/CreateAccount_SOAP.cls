global class CreateAccount_SOAP {
      global class sAccount{
        webservice String name;
      }
     webservice static String createAccount(sAccount sAcct){
         Account acct = new Account();
         acct.Name = sAcct.name;
         insert acct;
         String returnResponse = JSON.serialize(acct);
         return returnResponse;
      }
   }