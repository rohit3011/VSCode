//
// https://maps.googleapis.com/maps/api/geocode/json?address=Tilak%20Nagar,%20Delhi&key=AIzaSyDkkbdNxHjvCe_qbj0tHsjBlAdal6bT6cc
//

public class JSON2ApexGeolocation {
    
    public String street{get;set;}
    public String city{get;set;}
    public String state{get;set;}
    public String country{get;set;}
    public String postalCode{get;set;}
    public String address{get;set;}
    public string formatAdd{get;set;}
    public double lat{get;set;}
    public double lon{get;set;}
    public boolean showAddress{get;set;}
    
    public list<String> list_BankName{get;set;}
    public map<string, string> bankVicinityMap{get;set;}
    public map<string, double> bankLatitudeMap{get;set;}
    public map<string, double> bankLongitudeMap{get;set;}
    public map<string, Boolean> bankOpenNow {get;set;}
    public map<string, string> bankOpenNow1 {get;set;}
    
    public class Address_components {
        public String long_name;
        public String short_name;
        public List<String> types;
    }

    public class Geometry {
        public Bounds bounds;
        public Northeast location;
        public String location_type;
        public Bounds viewport;
    }

    public List<Results> results;
    public String status;

    public class Results {
        public List<Address_components> address_components;
        public String formatted_address;
        public Geometry geometry;
        public String place_id;
        public List<String> types;
    }

    public class Bounds {
        public Northeast northeast;
        public Northeast southwest;
    }

    public class Northeast {
        public Double lat;
        public Double lng;
    }

    
    public static JSON2ApexGeolocation parse(String json) {
        return (JSON2ApexGeolocation) System.JSON.deserialize(json, JSON2ApexGeolocation.class);
    }
    
    public pageReference submit(){
        showAddress = false;
        string url = 'https://maps.googleapis.com/maps/api/geocode/json?address=\''+address+'\'&key=AIzaSyDkkbdNxHjvCe_qbj0tHsjBlAdal6bT6cc';
        url = url.replaceAll(' ','%20');
        system.debug('******'+url);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');

        HttpResponse response = http.send(req);

        if (response.getStatusCode() == 200) {        
            //Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            //Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            //animalName = (String)animal.get('name');
            JSON2ApexGeolocation json = JSON2ApexGeolocation.parse(response.getBody());    
            system.debug('******'+json);
            system.debug('*****'+json.results);
            system.debug('*****'+json.results[0].formatted_address);
            
            //JSON2ApexGeolocation.results results1 = new JSON2ApexGeolocation.results(); 
            system.debug('*****'+json.results[0].address_components[0].long_name);
            
            JSON2ApexGeolocation.Address_components addVar = new JSON2ApexGeolocation.Address_components();
            list<JSON2ApexGeolocation.results> listResults = new list<JSON2ApexGeolocation.results>();
            list<JSON2ApexGeolocation.Address_components> listAddress = new list<JSON2ApexGeolocation.Address_components>();
            Map<String, list<string>> addTypeMap = new map<String, list<String>>();
            Map<String, String> LongShortMap = new map<String, String>();
            listResults = json.results;
            system.debug('*****'+listResults);
            
            for(JSON2ApexGeolocation.results json1 : json.results){
                addVar = json1.address_components[0];
                formatAdd = json1.formatted_address;
                system.debug('*****'+addVar);
                system.debug('*****'+formatAdd);
            }
            if(formatAdd != null && formatAdd != ''){
                showAddress = true;
                system.debug('*****'+showAddress);
            }
            system.debug('*****'+showAddress);
            /* Working fine    
            for(JSON2ApexGeolocation.results res : listResults){
                listAddress = res.address_components;
                //test2.add(json1.address_components);
                system.debug('***listAddress** '+listAddress);
            }
            
            for(JSON2ApexGeolocation.address_components add : listAddress){
                LongShortMap.put(add.long_name, add.short_name);
                addTypeMap.put(add.long_name, add.types);
                system.debug('***LongShortMap** '+LongShortMap);
                system.debug('***addTypeMap** '+addTypeMap);
            }
            */
            for(JSON2ApexGeolocation.results res : listResults){
                lat = res.Geometry.Location.lat;
                lon = res.Geometry.Location.lng;
                system.debug('***listAddress** '+lat);
                system.debug('***listAddress** '+lon);
            }           
            
        } 
        getBankListByGeolocation(lat, lon);
        system.debug('*****'+list_BankName);
        system.debug('*****'+bankVicinityMap); 
        system.debug('*****'+bankLatitudeMap); 
        system.debug('*****'+bankLongitudeMap); 
        system.debug('*****'+bankLatitudeMap); 
        system.debug('*****'+bankLongitudeMap); 
        return null;
    }
    
    public pageReference getBankListByGeolocation(double lat, double lon){
    
        string url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+lat+','+lon+'&radius=5000&type=bank&name=bank&key=%20AIzaSyDkkbdNxHjvCe_qbj0tHsjBlAdal6bT6cc';
        //url = url.replaceAll(' ','%20');
        system.debug('******'+url);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        JSON2Apex jsonVar;
        if (response.getStatusCode() == 200) {        
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
        bankOpenNow1 = new map<string,string>(); 
        
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
        for(string s : bankOpenNow.keyset()){
            if(bankOpenNow.get(s) == True){
                bankOpenNow1.put(s, 'Open');
            }
            else{
                bankOpenNow1.put(s, 'closed');
            }
        }
        system.debug('*****'+bankOpenNow);
        
        return null;
    }
    

    
}