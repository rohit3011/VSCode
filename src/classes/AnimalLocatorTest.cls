// Trailhead challenge for https://developer.salesforce.com/trailhead/apex_integration_services/apex_integration_rest_callouts

@isTest 
public class AnimalLocatorTest{

    @isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        string result = AnimalLocator.getAnimalNameById(1);
    }
}