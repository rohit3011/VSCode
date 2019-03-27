//Class to create a random string for FormStack logic

public class ContactManagementUtil {

    public static String obfuscateId(String contactId) {
        String obfuscatedId;
        if(contactId.length() != 18 || !contactId.startsWith('003')) {
            System.debug(LoggingLevel.ERROR, 'Input string does not look like a contact id');
            return null;
        }
        obfuscatedId = ContactManagementUtil.generateRandomString(3) + 
            contactId.substring(10,18) + contactId.substring(3,10) + 
            ContactManagementUtil.generateRandomString(3);
        System.debug(LoggingLevel.DEBUG, obfuscatedId);

        return obfuscatedId;
    }
    
    public static String deobfuscateId(String obfuscatedId) {
        String contactId;
        contactId = '003' + obfuscatedId.substring(11,18) + obfuscatedId.substring(3,11);
        return contactId;
    }
    
    // Ref: https://salesforce.stackexchange.com/a/43826
    public static String generateRandomString(Integer len) {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        return randStr; 
    }
    
    // 
    public static Boolean updateContactUpdatesMap(Map<Id, List<Customer_Contact_Update__c>> m, Id i, Customer_Contact_Update__c c) {
        if(m == null || i == null || c == null)
            return false;
        if(m.containsKey(i)) {
            m.get(i).add(c);
        } else {
            List<Customer_Contact_Update__c> l = new List<Customer_Contact_Update__c>();
            l.add(c);
            m.put(i, l);
        }
        return true;
    }
    
}