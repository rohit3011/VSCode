public class json_trainBetweenStations {

	public String source{get;set;}
    public String destination {get;set;}
    public String fromStation {get;set;}
    public String toStation {get;set;}    
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
    
    public boolean responseError{get;set;}
    
    public List<Train> train {get;set;} 
    public String error {get;set;} 
    public Integer total {get;set;} 
    public Integer response_code {get;set;} 

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
    
    public class Train {
        public String name {get;set;} 
        public String dest_arrival_time {get;set;} 
        public To to {get;set;} 
        public Integer no {get;set;} 
        public List<Days> days {get;set;} 
        public To from_z {get;set;} // in json: from
        public String src_departure_time {get;set;} 
        public List<Classes> classes {get;set;} 
        public String travel_time {get;set;} 
        public String trNumber {get;set;} // in json: number
    }
    
    public class Classes {
        public String classCode {get;set;}      // json response is coming as variable class-code, so we need to modify the json response
        public String available {get;set;} 
    }
    
    public static json_trainBetweenStations parse(String json) {
        return (json_trainBetweenStations) System.JSON.deserialize(json, json_trainBetweenStations.class);
    }
    
    public string tDate= '';
    
    public pageReference submit(){
       // showAvailStatus = false;
        responseError = false;
        tDate = tDate + traveldate.day() + '-' + traveldate.month() + '-' + traveldate.year();
        
        string url = 'http://api.railwayapi.com/between/source/'+source+'/dest/'+destination+'/date/'+tDate+'/apikey/abz5eh4yz6/'; //abz5eh4yz6
        url = url.replaceAll(' ','%20');
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() == 200) {   
            //displayPopUp = true;
            // commenting line to modify the JSON response, bcz for that we need to get the response body in string and then modify the string
            // json_DistanceBetweenStationController json = json_DistanceBetweenStationController.parse(response.getBody());    
            
            // used following 2-3 lines of code because we are modifying the JSON response for classCode variable
            string jsonbody = response.getbody();   // getting the response into string
            
            jsonbody = jsonbody.replace('class-code','classCode');  // replcaing the JSON response variable containing hyphen
            jsonbody = jsonbody.replace('number','trNumber');   // replcaing the JSON response variable containing hyphen
            jsonbody = jsonbody.replace('from','from_z');   // replcaing the JSON response variable containing hyphen
            json_trainBetweenStations json = json_trainBetweenStations.parse(jsonbody);    
            
            list<json_trainBetweenStations.train> listTrains = new list<json_trainBetweenStations.train>();
            list<json_trainBetweenStations.days> listDays = new list<json_trainBetweenStations.days>();
            list<json_trainBetweenStations.classes> listClasses = new list<json_trainBetweenStations.classes>();
            json_trainBetweenStations.To listDestStation = new json_trainBetweenStations.To();
            
            list<string> testString = new list<string>();
            listTrains = json.train;  
            list_TrainName = new list<string>();
            destinationArrTime = new map<string, string>(); 
            distance = new map<string, string>(); 
            schDepTime = new map<string, string>(); 
            travelTime = new map<string, string>();
            trainNumber = new map<string, string>();
            trainRunOnDays = new map<string, list<string>>();
            listOfAvailableClasses = new map<string, list<string>>();
            trainClassesCount = new map<string, integer>();
            trainDesStatCode = new map<string, string>();
            trainSourceStatCode = new map<string, string>();
            trainDesStatName = new map<string, string>();
            trainSourceStatName = new map<string, string>();
            
            for(json_trainBetweenStations.train json1 : listTrains){
                testString = new list<String>();
                list_TrainName.add(json1.Name);
                destinationArrTime.put(json1.Name, json1.dest_arrival_time);
                //distance.put(json1.Name, json1.dest_arrival_time);
                schDepTime.put(json1.Name, json1.src_departure_time);
                travelTime.put(json1.Name, json1.travel_time);
                trainNumber.put(json1.Name, json1.trNumber);
                trainDesStatCode.put(json1.Name, json1.to.Code);
                trainSourceStatCode.put(json1.Name, json1.from_z.code);
                trainDesStatName.put(json1.Name, json1.to.Name);
                trainSourceStatName.put(json1.Name, json1.from_z.Name);
                
                // trainRunOnDays.put(json1.Name, new list<string>());
                listDays = json1.days;
                system.debug('******listDays*****'+listDays);   
                for(Days d : listDays){
                    testString.add(d.runs);
                    trainRunOnDays.put(json1.Name, testString);
                    
                }  
                system.debug('******trainRunOnDays*****'+trainRunOnDays);   
                system.debug('******testString*****'+testString);   
            /*    for(string s : trainRunOnDays.keyset()){
                    for(string s1 : testString){
                        trainRunOnDays.get(s).add(s1);
                    }
                } 
                system.debug('******trainRunOnDays*****'+trainRunOnDays);   */
                
                        }       
                        
                        for(json_trainBetweenStations.train json1 : listTrains){
                                listOfAvailableClasses.put(json1.Name, new list<string>());
                                listClasses = json1.classes;
                                for(classes c : listClasses){
                                        if(c.available == 'Y'){
                                                listOfAvailableClasses.get(json1.Name).add(c.classCode);
                                        }
                                }
                                trainClassesCount.put(json1.Name, listOfAvailableClasses.get(json1.Name).size());
            }
                        
                        
        }
        return null;
    }
    
    public String searchStation {get; set;}
    public String selectedFromStation {get; set;}
    public String selectedToStation {get; set;}
    
    // JS Remoting action called when searching for a movie name
    @RemoteAction
    public static List<IRCTC_FromAndToStation__mdt> searchStationName(String searchStation) {
        System.debug('Movie Name is: '+searchStation );
        List<IRCTC_FromAndToStation__mdt> listStation = Database.query('Select Id, MasterLabel, DeveloperName, station_code__C from IRCTC_FromAndToStation__mdt where MasterLabel like \'%' + String.escapeSingleQuotes(searchStation) + '%\'');
        return listStation;
    }


}