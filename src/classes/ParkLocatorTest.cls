@isTest
private class ParkLocatorTest{
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        string countryName = 'India';
        
        list<string> result = ParkLocator.country(countryName);
        // Verify that a fake result is returned
       // System.assertEquals(3.0, result); 
    }
}