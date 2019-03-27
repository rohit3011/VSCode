/*
        @Description This class is inner class which is used as response class which is having name and id.
        @Author Hem
        @Date
    */
public class RS2_RCMLocationController {
    public static List<responseLocation> listOfResLocation=new List<responseLocation>();
    public static responseLocation respCountries;
    public static responseLocation respStates;
    public static JSONResponse countryJSON=new JSONResponse();
    public static JSONResponse stateJSON=new JSONResponse();
    public static final String SUCCESS_STATUS='success';
    public static final String ERROR_STATUS='error';
    public static final String BLANK='';
    public static final String NODETAILS='Location Not Found!!!';
    Public String JSonSring{get; set;} 
    Public String countryName{get; set;} 
    
    /*
        @Description This class is inner class which is used as response class which is having name and id.
        @Author Hem
    */
    public class responseLocation{
        public String name;
        public Id id;
    }
    /*
        @Description This class is inner class which is used as response class which is used as final response to the client.
        @Author Hem
    */
    public class JSONResponse{
        public String status;
        public LIST<responseLocation> data;
        public String message;
    }
    /*
        @Return String
        @Author String
    */
    
    public PageReference callRenewalStartMethod(){
        JSonSring = getCountriesList('India');
        return null;
    }    
    
    public static String getCountriesList(String namePattern)
    {    
        system.debug('namePattern>>>>>>>>>>>'+namePattern);       
        namePattern = namePattern+'%';         
        system.debug('resquest>>'+namePattern);
        for (Country__c con : [Select Id, Name From Country__c Where Name like : namePattern order by Name]){
            system.debug('con>>'+con);
            respCountries = new responseLocation();
            respCountries.name=con.name;
            respCountries.id=con.id;
            listOfResLocation.add(respCountries);
        }
        if(listOfResLocation.size()>0){
            countryJSON.status=SUCCESS_STATUS;
            countryJSON.data=listOfResLocation;
            countryJSON.message='';
        }
        else{
            countryJSON.status=ERROR_STATUS;
            countryJSON.data=null;
            countryJSON.message=NODETAILS;
        }
        String res=JSON.serialize(countryJSON);
        system.debug('res>>???'+res);
        return res;
    }
    /*
        @Return String
        @Author String
    */
    public static String getStatesList(String namePattern)
    {
        List<Country__c> cntryId = [select Id from Country__c where name=: namePattern limit 1];
        system.debug('**************cntryId***********'+cntryId);
        List<State__c> stateList = [select id,State_Province__c from State__c where Country__c=: cntryId];
        for(State__c statename:stateList){
            system.debug('**************statelist***********'+statename);
            respStates = new responseLocation();
            respStates.name=statename.State_Province__c;
            respStates.id=statename.id;
            listOfResLocation.add(respStates);
            system.debug('**************listOfResLocation**state list**********'+listOfResLocation);
        }
        system.debug('**************state list**********'+listOfResLocation);        
        if(listOfResLocation.size()>0){
            stateJSON.status=SUCCESS_STATUS;
            stateJSON.data=listOfResLocation;
            stateJSON.message=BLANK;
        }else{
            stateJSON.status=ERROR_STATUS;
            stateJSON.data=null;
            stateJSON.message=NODETAILS;
        }
        String res=JSON.serialize(stateJSON);
        system.debug('res>>???'+res);
        return res;
    }
}