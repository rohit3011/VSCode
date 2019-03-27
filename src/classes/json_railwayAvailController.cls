public with sharing class json_railwayAvailController {

    public json_railwayAvailController(json_DistanceBetweenStationController controller) {

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
    public string classOne {get;set;}
    public string classOne1 {get;set;}
    public string source = 'AII';
    public string destination = 'NDLS';
    public string tDate = '30-9-2016';
    
    
    list<string> availStatus {get;set;}
    map<string, string> dateAvailStatus {get;set;}
    
    public static json_railwayAvailController parse(String json) {
        return (json_railwayAvailController) System.JSON.deserialize(json, json_railwayAvailController.class);
    }

    public pageReference showAvailability(){
        // http://api.railwayapi.com/check_seat/train/12001/source/BPL/dest/NDLS/date/14-10-2014/class/CC/quota/GN/apikey/rxbzp3727/
        system.debug('****'+classOne);
        system.debug('****'+classOne1);
        
        string url = 'http://api.railwayapi.com/check_seat/train/'+classOne+'/source/'+source+'/dest/'+destination+'/date/'+tDate+'/class/'+classOne1+'/quota/GN/apikey/rxbzp3727/';
        system.debug('****url**'+url);
        url = url.replaceAll(' ','%20');
        system.debug('****url**'+url);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() == 200) {  
            string jsonbody = response.getbody();
            system.debug('****jsonbody**'+jsonbody);   
            jsonbody = jsonbody.replace('date','date1'); 
            //json_DistanceBetweenStationController json = json_DistanceBetweenStationController.parse(jsonbody);    
            //system.debug('***json**'+json);   
            
            list<json_railwayAvailController.Availability> listAvail = new list<json_railwayAvailController.Availability>();
            system.debug('****listAvail**'+listAvail); 
            availStatus = new list<string>();
            dateAvailStatus = new map<string,string>();
            
            for(json_railwayAvailController.Availability json1 : listAvail){
                availStatus.add(json1.Status);
                dateAvailStatus.put(json1.date1, json1.Status);
                system.debug('****availStatus**'+availStatus);   
                system.debug('****dateAvailStatus**'+dateAvailStatus);                   
            }
        } 
        
        return null;
    }


}