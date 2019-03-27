//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSON2Apex {
    
    public class Geometry {
        public Location location;
    }

    public class Photos {
        public Integer height;
        public List<String> html_attributions;
        public String photo_reference;
        public Integer width;
    }

    public class Geometry_Z {
        public Location location;
        public Viewport viewport;
    }
    
    public map<string, string> bankVicinityMap{get;set;}
    public list<String> list_BankName{get;set;}
    public map<string, double> bankLatitudeMap{get;set;}
    public map<string, double> bankLongitudeMap{get;set;}
    public map<string, Boolean> bankOpenNow {get;set;}
    public List<Html_attributions> html_attributions;
    public String next_page_token;
    public List<Results> results;
    public String status;

    public class Results {
        public Geometry geometry;
        public String icon;
        public String id;
        public String name;
        public Opening_hours opening_hours;
        public List<Photos> photos;
        public String place_id;
        public String reference;
        public String scope;
        public List<String> types;
        public String vicinity;
    }

    public class Opening_hours {
        public Boolean open_now;
        public List<Html_attributions> weekday_text;
    }

    public class Viewport {
        public Location northeast;
        public Location southwest;
    }

    public class Html_attributions {
    }

    public class Location {
        public Double lat;
        public Double lng;
    }

    
    public static JSON2Apex parse(String json) {
        return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    }
    
    public pageReference submit(){
    
        string url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.6413653,77.0949373&radius=5000&type=bank&name=bank&key=%20AIzaSyDkkbdNxHjvCe_qbj0tHsjBlAdal6bT6cc';
        //url = url.replaceAll(' ','%20');
        system.debug('******'+url);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        JSON2Apex jsonVar;
        if (response.getStatusCode() == 200) {        
            //Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            //Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            //animalName = (String)animal.get('name');
            jsonVar = JSON2Apex.parse(response.getBody());    
            system.debug('******'+jsonVar);
            system.debug('*****'+jsonVar.results);
            system.debug('*****'+jsonVar.results[0].name);
        }
        List<json2Apex.results> listResults = new list<json2Apex.results>();
        listResults = jsonVar.results;
        system.debug('***listResults**'+listResults);
        bankVicinityMap = new map<string,string>();
        list_BankName = new list<string>();
        bankLatitudeMap = new map<string,double>();
        bankLongitudeMap = new map<string,double>();
        bankOpenNow = new map<string,Boolean>(); 
        for(JSON2Apex.results bank : listResults){
            list_BankName.add(bank.name);
            bankVicinityMap.put(bank.Name, bank.vicinity);
               
        }
        system.debug('*****'+list_BankName);
        system.debug('*****'+bankVicinityMap); 
        
        for(JSON2Apex.results bank : listResults){
            bankLatitudeMap.put(bank.Name, bank.Geometry.Location.lat);    
            bankLongitudeMap.put(bank.Name, bank.Geometry.Location.lng);       
        }
        system.debug('*****'+bankLatitudeMap); 
        system.debug('*****'+bankLongitudeMap); 
        
        for(JSON2Apex.results bank : listResults){
            if(bank.Opening_hours != null)
                bankOpenNow.put(bank.Name, bank.Opening_hours.open_now);       
            else{
                bankOpenNow.put(bank.Name, FALSE);           
            }
        }
        system.debug('*****'+bankOpenNow);
        
        return null;
    }
    
}