/*
    @description : This class is for RS2-RCM track which is used for calculating five expiring opportunities from Opportunity object.
    @author Hem
    @date 9th July, 2014
*/
public with sharing class RS2_RCMOpportunityExpiryRequest{
    public static final String METHOD_GETOPPBYCUSTOMER='getExpiringSoonOpportunities';
    public static final String METHOD_COMPARE='method';
    public static final String JSONPOSTDATA='jsonPostData';
    public static final String SUCCESS_STATUS='success';
    public static final String ERROR_STATUS='error';
    public static final String FAILURE_STATUS='failure';
    public static final String ERROR_MESSAGE='Error occured ';
    public static final String REQUEST_MESSAGE='-1';
    public static final String OPP_RECORDTYPE='Renewal Sales Opportunity';
    public static final String LOSTTOELA_STATUS = 'Lost to ELA';
    public static final String OPEN_STATUS = 'Open';
    public static final String LOSTTONOSERVICE_STATUS = 'Lost to No Service';
    public static final String NO_OPPORTUNITIES_FOUND = 'No opportunities found';
    public static final String OTHER_STATUS = 'Other';
    public static final String CLOSED_STATUS = 'Closed';
    public static final String PARTNER= 'partner';
    public static final String DOLLAR_SIGN= '$';
    public static final String BLANK= '';
    //public static List<Renewal_Partner_Group__c> userAccountList = new list<Renewal_Partner_Group__c>();
    public static JSONResponse jsonresponse = new JSONResponse();
    public static String jsonStringResponse;
    public static OpportunityRequest deserializeOppInfo= new OpportunityRequest();
    public static List<User> userList= new List<User>();
    public String JSonSring{get; set;}
    private OpportunityRequest deserializedOpptyInfo = new OpportunityRequest();    
    private String partnerId='';
    private Account account;
    private Integer count = 0;
    private Map<String, String> paramMap=new Map<String, String>();    
    private string userParameter;
    
    /*
        @description This class is used for creating for Opportunity request. 
        @author Hem
        @date 9th July, 2014
    */
    public with sharing class OpportunityRequest {
        private String userRequestId;
    }
    /*
        @description This class is used for creating for Opportunity response. 
        @author Hem
    */
    public with sharing Class OpportunityResponse {    
        private List<OpportunityRecord> aaData;
    }
    /*
        @description This class is used for creating for Opportunity record. 
        @author Hem
    */   
    public with sharing class OpportunityRecord {
        private String contractNumber;
        private Date expiration;
        private Integer daysToExpire;
        private String amountLocal;
        private String amountUSD;
        private String eaName;
        private String renewalStatus;
        private String renewalStatusText;
        private String prmID;
        private String eaNumber;
    }
    /*
        @description This class is used for creating final response to the client. 
        @author Hem
    */           
    public with sharing class JSONResponse{
        private String status;
        private List<OpportunityRecord> data;
        private String message;
    }
    /*
        @description This class is used for creating exception if errors occured in the code.
        @author Hem
    */
     public with sharing class CommonErrors{
        private string status;
        private string data;
        private string message;
    }
    /*
        @param none
        @return PageReference
    */
    public PageReference callStartMethod(){
        try{
            paramMap=ApexPages.currentPage().getParameters();
            system.debug('paramMap>>>>>>>>>>'+paramMap);
            string jSONRequest = paramMap.get(JSONPOSTDATA);
            system.debug('JSONRequest>>>>>>>>>>>>>>>>>'+JSONRequest);
            JSonSring= getExpiringSoonOpportunities(JSONRequest); 
        }
                
        catch (Exception ex) {
            system.debug('Exception2 >>>>>>>>>>>>>>' +ex);
        }
        return null;
    }    
    /*
        @param String
        @return String
    */
    public String getExpiringSoonOpportunities(String JSONRequest) {
        if(JSONRequest!=null){
            deserializedOpptyInfo = (OpportunityRequest)JSON.deserialize(JSONRequest,OpportunityRequest.class);
            system.debug('deserializedOpptyInfo>>>>'+deserializedOpptyInfo.userRequestId);
            //userParameter = deserializedOpptyInfo.userRequestId;
            //system.debug('userParameter>>>>'+userParameter);
        }    
        
        List<Opportunity> oppListnew = new List<Opportunity>();
        List<Opportunity> oppList = new List<Opportunity>();
        set<Id> accountSet = new set<Id>();
       // Id oppRecordtypeId = Opportunity.sObjectType.getDescribe().getRecordTypeInfosByName().get(OPP_RECORDTYPE).getRecordTypeId();
       // system.debug('******oppRecordtypeId**********'+oppRecordtypeId);
        
            string accId = '0019000000YUBWI';
            oppListnew = [Select Id, Name, closeDate, StageName, RS2_Expiring_Contract_End_Date__c, Service_Contract_Number__c, RS2_RCM_Renewal_Status__c, Amount from opportunity where AccountId =: accId AND RS2_Expiring_Contract_End_Date__c >= Today AND RS2_Expiring_Contract_End_Date__c <= NEXT_N_DAYS:15 limit 5];
            system.debug('******oppListnew**********'+oppListnew);
            List<OpportunityRecord> oppportunityList = new List<OpportunityRecord>();
            if(oppListnew.size()>0){
                for(opportunity oRecord : oppListnew){
                    if(oRecord!=null){
                                count = system.Today().daysBetween(oRecord.RS2_Expiring_Contract_End_Date__c);
                                OpportunityRecord oppRec = new OpportunityRecord();
                                oppRec.contractNumber=oRecord.Service_Contract_Number__c;
                                oppRec.expiration=oRecord.RS2_Expiring_Contract_End_Date__c;
                                oppRec.daysToExpire = Count;
                                oppRec.amountLocal=String.valueOf(oRecord.Amount); 
                                oppRec.amountUSD=DOLLAR_SIGN+String.valueOf(oRecord.Amount);
                                oppRec.renewalStatusText=oRecord.RS2_RCM_Renewal_Status__c;
                            
                            if((oRecord.RS2_RCM_Renewal_Status__c)!=null && oRecord.RS2_RCM_Renewal_Status__c.equalsIgnoreCase(OPEN_STATUS)){
                                oppRec.renewalStatus=OPEN_STATUS;
                            }
                            if((oRecord.RS2_RCM_Renewal_Status__c)!=null && ((oRecord.RS2_RCM_Renewal_Status__c).equalsIgnoreCase(LOSTTOELA_STATUS)  || (oRecord.RS2_RCM_Renewal_Status__c).equalsIgnoreCase(LOSTTONOSERVICE_STATUS)  || (oRecord.RS2_RCM_Renewal_Status__c).equalsIgnoreCase(OTHER_STATUS))){
                                oppRec.renewalStatus=CLOSED_STATUS ;
                            }
                            oppRec.eaName=oRecord.StageName;  
                           // oppRec.eaNumber=oRecord.EA_NUMBER__c;                       
                           // oppRec.prmID=oRecord.Partner_Id__c;
                            oppportunityList.add(oppRec);
                            system.debug('******for VIEWALL**********'+oppportunityList);
                        }
                }
                jsonresponse.status=SUCCESS_STATUS;
                jsonresponse.data=oppportunityList;
                jsonresponse.message=BLANK;
                jsonStringResponse=Json.serialize(jsonresponse);
            }
            else {
                jsonresponse.status=ERROR_STATUS;
                jsonresponse.data=null;
                jsonresponse.message=NO_OPPORTUNITIES_FOUND;
                jsonStringResponse=Json.serialize(jsonresponse);
                system.debug('******jsonStringResponse**********'+jsonStringResponse);
            }
           // }
            return jsonStringResponse;
        //}
    }   
}