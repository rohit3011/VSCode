@RestResource(urlMapping='/Account/')
global with sharing class createAccount_Rest {
    @HttpGet
    global static Account createAccount(){
        RestRequest request = RestContext.request;
        system.debug('**********'+request);
        system.debug('**********'+request.requestURI);
        // grab the caseId from the end of the URL
        String accId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account acc = [select Id, name from Account where id=:accId];
        //String returnResponse = JSON.serialize(a);
        //return returnResponse;
        return acc;
      }
   }