@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        list<string> parkName = new list<string>();
        parkName.add('Anamudi Shola National Park');
        parkName.add('Anshi National Park');
        parkName.add('Bandipur National Park');
        response_x.return_x = parkName;
        // end
        response.put('response_x', response_x); 
   }
}