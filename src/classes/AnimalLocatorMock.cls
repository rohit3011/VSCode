// Trailhead challenge for https://developer.salesforce.com/trailhead/apex_integration_services/apex_integration_rest_callouts
// mock Response class
@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"Tiget","eats":"Grass","says":"Nothing"}}');
        response.setStatusCode(200);
        return response; 
    }
}