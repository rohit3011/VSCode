// Trailhead challenge for https://developer.salesforce.com/trailhead/apex_integration_services/apex_integration_rest_callouts

public class AnimalLocator{
    
    public static String getAnimalNameById(Integer x){
        string animalName;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);
        req.setMethod('GET');
        
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() == 200) {        
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            animalName = (String)animal.get('name');
               
        }
        return animalName; 
    }
}

/*
public class AnimalLocator{

    public static string getAnimalNameById(Id animalId) {
        string animalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/:animalId');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            animalName = (String)results.get('name');
        }
        return animalName;
    }
}
*/