public class AnimalsCallouts {

    public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            }
        }
        return response;
    }
    
     
    public List<String> animals {get;set;} 
    
    
    
    public static AnimalsCallouts parse(String json) {
        return (AnimalsCallouts) System.JSON.deserialize(json, AnimalsCallouts.class);
    }
    
    public pageReference submit(){
        system.debug('********inside Submit*****');
        string url = 'https://th-apex-http-callout.herokuapp.com/animals';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);        
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() == 200) {
            string jsonbody = response.getbody();
            system.debug('********jsonbody*****'+jsonbody);
            
            AnimalsCallouts json = AnimalsCallouts.parse(jsonbody);    
           // AnimalsCallouts json1 = (AnimalsCallouts)JSON.deserialize(jsonbody, AnimalsCallouts.class);
            system.debug('********json*****'+json);
            list<string> testStr = new list<string>();
            
            for(string str : json.animals){
                testStr.add(str);
                system.debug('********testStr*****'+testStr);
            }
            system.debug('********testStr*****'+testStr);
        }
        return null;
    }
	
    
    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }        

}