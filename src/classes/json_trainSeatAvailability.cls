public class json_trainSeatAvailability {

    public json_trainSeatAvailability(json_trainBetweenStations controller) {

    }
    
    public static json_trainSeatAvailability parse(String json) {
        return (json_trainSeatAvailability) System.JSON.deserialize(json, json_trainSeatAvailability.class);
    }
    
    public class Availability {
        public String date1 {get;set;} 
        public String status {get;set;} 
    }
        public class Quota {
        public String quota_name {get;set;} 
        public String quota_code {get;set;}         
    }
    
    public List<Availability> availability {get;set;} 
    public Quota quota {get;set;} 
    public String train_name {get;set;} 
    
    public list<string> availStatusDate {get;set;}
    public list<string> availStatus {get;set;}
    public map<string, string> dateAvailStatus {get;set;}
    public boolean showAvailStatus {get;set;}
    public boolean responseError{get;set;}
    public string qCode {get;set;}
    public string qName {get;set;}
    
public String source{get;set;}
    public String destination {get;set;}
    public Date travelDate {get;set;}
    public dateTime travelDate1 {get;set;}
    public list<String> list_TrainName{get;set;}
    public map<string, string> destinationArrTime{get;set;}
    public map<string, string> distance{get;set;}
    public map<string, string> schDepTime{get;set;}
    public map<string, string> travelTime{get;set;}
    public map<string, string> trainNumber {get;set;}
    public map<string, list<string>> trainRunOnDays {get;set;}
    public map<string, list<string>> listOfAvailableClasses {get;set;}
    public map<string, string> trainDesStatCode {get;set;}
    public map<string, string> trainSourceStatCode {get;set;}
    public map<string, string> trainSourceStatName {get;set;}
    public map<string, string> trainDesStatName {get;set;}
    public integer count {get;set;} 
    public map<string, integer> trainClassesCount {get;set;}
    public string classOne {get;set;}   // getting the trainNumber
    public string classOne1 {get;set;}
    public string classOne2 {get;set;}
    public string classOne3 {get;set;}
    
    public string classTwo {get;set;}
    public string classThree {get;set;}
    public string classFour {get;set;}
    
    
    public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
    
    public pageReference showAvailability(){
        try{
            showAvailStatus = false;
            responseError = false;
            string trDate;
            trDate = traveldate.day() + '-' + traveldate.month() + '-' + traveldate.year();
            system.debug('****trDate**'+trDate);
            
            string urlnew = 'http://api.railwayapi.com/check_seat/train/'+classOne+'/source/'+source+'/dest/'+classOne2+'/date/'+trDate+'/class/'+classOne1+'/quota/GN/apikey/p46q7tyd/';
            //string urlnew = 'http://api.railwayapi.com/check_seat/train/12216/source/AII/dest/DEC/date/31-10-2016/class/3A/quota/GN/apikey/rxbzp3727/';
            system.debug('****url**'+urlnew);
            //url = url.replaceAll(' ','%20');
            system.debug('****url**'+urlnew);
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(urlnew);        
            req.setMethod('GET');
            req.setTimeout(6000);
            
            HttpResponse response = http.send(req);
            
            if (response.getStatusCode() == 200) {  
                showAvailStatus = true;
           //     system.debug('****showAvailStatus**'+showAvailStatus); 
                string jsonbody = response.getbody();
          //      system.debug('****jsonbody**'+jsonbody);   
                jsonbody = jsonbody.replace('date','date1'); 
                json_trainSeatAvailability json = json_trainSeatAvailability.parse(jsonbody);    
              //  system.debug('***json**'+json);   
                
                list<json_trainSeatAvailability.Availability> listAvail = new list<json_trainSeatAvailability.Availability>();
                json_trainSeatAvailability.Quota q = new json_trainSeatAvailability.Quota();
                q = json.Quota;
                listAvail = json.Availability;
                system.debug('****listAvail**'+listAvail); 
               // system.debug('****q**'+q); 
                qCode = q.quota_code;
                qName = q.quota_name;
             //   system.debug('****qCode**'+qCode);   
            //    system.debug('****qName**'+qName);   
                
                availStatus = new list<string>();
                availStatusDate = new list<string>();
                dateAvailStatus = new map<string,string>();
                
               for(json_trainSeatAvailability.Availability json1 : listAvail){
                    availStatus.add(json1.Status);
                    availStatusDate.add(json1.Date1);
                    dateAvailStatus.put(json1.date1, json1.Status);
               //     system.debug('****availStatus**'+availStatus);   
               //     system.debug('****dateAvailStatus**'+dateAvailStatus);                   
                }
                system.debug('****availStatus**'+availStatus);   
                system.debug('****dateAvailStatus**'+dateAvailStatus);
            } 
            else{
                if(response.getStatusCode() != 200) { 
                    responseError = true;
                }
            }
          //  system.debug('****showAvailStatus**'+showAvailStatus); 
            return null;
        }
        catch(Exception e){
           // responseError = true;
           // system.debug('****responseError**'+responseError); 
            return null;
        }   
    }

}