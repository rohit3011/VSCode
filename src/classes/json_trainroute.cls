public with sharing class json_trainroute {

    public json_trainroute(json_trainBetweenStations controller) {

    }
    
    public json_trainroute(json_trainSeatAvailability controller) {

    }
    
    // Variable and class declaration for train route finder: showTrainRoute Method
    public string selectedTrainNumber {get;set;}
    public boolean showAvailStatus {get;set;}
    public boolean responseError{get;set;}
   //  public string stationCode {get;set;}
    public Train1 train1 {get;set;} 
    public List<Route> route {get;set;} 
//  public Integer response_code {get;set;} 

    
/*  public class Days {
        public String runs {get;set;} 
        public String day-code {get;set;}       
    } */
    
    public class Train1 {
        public List<Classes> classes {get;set;} 
        public List<Days> days {get;set;} 
        public String number_Z {get;set;} // in json: number
        public String name {get;set;} 

    } 
    
    public class Classes {
        public String classCode {get;set;}      // json response is coming as variable class-code, so we need to modify the json response
        public String available {get;set;} 
    }
    
    public class Days {
        public String dayCode {get;set;} 
        public String runs {get;set;}       
    }
    
    public class To {
        public String name {get;set;} 
        public String code {get;set;}       
    }
    
    public class from_z {
        public String name {get;set;} 
        public String code {get;set;}       
    }
    
    public class Route {
        public Integer distance {get;set;} 
        public String fullname {get;set;} 
        public Integer halt {get;set;} 
        public String scharr {get;set;} 
        public String state {get;set;} 
        public Integer no {get;set;} 
        public Integer day {get;set;} 
        public Double lat {get;set;} 
        public Integer route {get;set;} 
        public String schdep {get;set;} 
        public Double lng {get;set;} 
        public String code {get;set;} 
    }
    
    public list<string> stationCode{get;set;}
    public map<string, integer> route_distance {get;set;}    
    public map<string, string> route_fullName {get;set;}    
    public map<string, integer> route_halt {get;set;}    
    public map<string, string> route_scharr {get;set;}    
    public map<string, integer> route_no {get;set;}    
    public map<string, integer> route_day {get;set;}    
    public map<string, string> route_schdep {get;set;}    
   // public map<string, string> route {get;set;}  
    public string selectedTrainName{get;set;}
    public string selectedFromStation{get;set;}
    public string selectedDestStation{get;set;}
    
    public list<json_DistanceBetweenStationController.route> listTrainRoute {get;set;}
    
    public pageReference showTrainRoute(){
        try{        
            showAvailStatus = false;
            responseError = false;
            system.debug('***TrainNumber**'+selectedTrainNumber);
            string url = 'http://api.railwayapi.com/route/train/'+selectedTrainNumber+'/apikey/p46q7tyd/';
            //http://api.railwayapi.com/route/train/12216/apikey/rxbzp3727/
           // string url = 'http://api.railwayapi.com/route/train/12216/apikey/rxbzp3727/';
            url = url.replaceAll(' ','%20');
            system.debug('***url**'+url);
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(url);        
            req.setMethod('GET');
            
            HttpResponse response = http.send(req);
        
            if (response.getStatusCode() == 200) {  
                string jsonbody = response.getbody();   // getting the response into string
                system.debug('***url**'+url);
                jsonbody = jsonbody.replace('train','train1');
                jsonbody = jsonbody.replace('number','trNumber'); 
                jsonbody = jsonbody.replace('class-code','classCode');
                system.debug('***jsonbody**'+jsonbody);
                //list<json_DistanceBetweenStationController.train> listTrains = new list<json_DistanceBetweenStationController.train>();
                json_DistanceBetweenStationController json = json_DistanceBetweenStationController.parse(jsonbody);
                system.debug('***json**'+json);
                listTrainRoute = new list<json_DistanceBetweenStationController.route>();
                listTrainRoute = json.route;
                system.debug('***listTrainRoute**'+listTrainRoute);
                stationCode = new list<string>();
                route_distance = new map<string, integer>();
                route_fullName = new map<string, string>();
                route_halt = new map<string, integer>();
                route_scharr = new map<string, string>();
                route_no = new map<string, integer>();
                route_day = new map<string, integer>();
                route_schdep = new map<string, string>();                
                
                
                for(json_DistanceBetweenStationController.route trRoute : listTrainRoute){
                    stationCode.add(trRoute.code);
                    route_distance.put(trRoute.code, trRoute.distance);
                    route_fullName.put(trRoute.code, trRoute.fullName);
                    route_halt.put(trRoute.code, trRoute.halt);
                    route_scharr.put(trRoute.code, trRoute.scharr);
                    route_no.put(trRoute.code, trRoute.no);
                    route_day.put(trRoute.code, trRoute.day);
                    route_schdep.put(trRoute.code, trRoute.schdep);
                }
                system.debug('***stationCode**'+stationCode);
            }
        }    
        catch(Exception e){
        }
        return null;
    }

}