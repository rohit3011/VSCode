// https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_enum_System_JsonToken.htm
// https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_enum_System_JsonToken.htm

public class LocationCallouts {

     @future (callout=true)  // future method needed to run callouts from Triggers
      static public void getLocation(id accountId){
        // gather account info
        Account a = [SELECT BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet FROM Account WHERE id =: accountId];

        // create an address string
        String address = '';
        if (a.BillingStreet != null)
            address += a.BillingStreet +', ';
        if (a.BillingCity != null)
            address += a.BillingCity +', ';
        if (a.BillingState != null)
            address += a.BillingState +' ';
        if (a.BillingPostalCode != null)
            address += a.BillingPostalCode +', ';
        if (a.BillingCountry != null)
            address += a.BillingCountry;

        address = EncodingUtil.urlEncode(address, 'UTF-8');

        // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&key=AIzaSyDyeShB6F6xPwGEFViQ1L3-4nvoFDUYBYo');
        req.setMethod('GET');
        req.setTimeout(60000);

        try{
            // callout
            HttpResponse res = h.send(req);

            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            double lat = null;
            double lon = null;
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                    (parser.getText() == 'location')){
                       parser.nextToken(); // object start
                       while (parser.nextToken() != JSONToken.END_OBJECT){
                           String txt = parser.getText();
                           parser.nextToken();
                           if (txt == 'lat')
                               lat = parser.getDoubleValue();
                           else if (txt == 'lng')
                               lon = parser.getDoubleValue();
                       }

                }
            }

            // update coordinates if we get back
            if (lat != null){
                a.Location_Latitude__c = lat;
                a.Location_Longitude__c = lon;
                update a;
            }

        } catch (Exception e) {
        }
    }
}