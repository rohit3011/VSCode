global class LightningLoginFormController {
	
    //String Constant for Success Message 
    private static final string  SUCCESS_MESSAGE = 'User logged in successfully';
    
    //String Constant for Error Message
    private static final string  ERROR_MESSAGE = 'Error	Message From Apex: n';
        
    public LightningLoginFormController() {
        
    }

    @AuraEnabled
    public static AuraProcessingMessage login(String username, String password, String startUrl) {
        AuraProcessingMessage returnMessage = new AuraProcessingMessage();
        try{
            ApexPages.PageReference lgn = Site.login(username, password, startUrl);
            // aura.redirect(lgn);
            returnMessage.successMsg=SUCCESS_MESSAGE;
            return returnMessage;
        }
        catch (Exception ex) {
            returnMessage.isSuccess = false;
            returnMessage.errorMsg = ex.getMessage();
            return returnMessage;            
        }
    }
    
    @AuraEnabled
   public static User userRec(String username){
      user u = [Select Id, Name, username, email from user where username =: username];
      return u;
   }
    
    @AuraEnabled
    public static Boolean getIsUsernamePasswordEnabled() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        return authConfig.getUsernamePasswordEnabled();
    }

    @AuraEnabled
    public static Boolean getIsSelfRegistrationEnabled() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        return authConfig.getSelfRegistrationEnabled();
    }

    @AuraEnabled
    public static String getSelfRegistrationUrl() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        if (authConfig.getSelfRegistrationEnabled()) {
            return authConfig.getSelfRegistrationUrl();
        }
        return null;
    }

    @AuraEnabled
    public static String getForgotPasswordUrl() {
        Auth.AuthConfiguration authConfig = getAuthConfig();
        return authConfig.getForgotPasswordUrl();
    }
    
    @TestVisible
    private static Auth.AuthConfiguration getAuthConfig(){
        Id networkId = Network.getNetworkId();
        Auth.AuthConfiguration authConfig = new Auth.AuthConfiguration(networkId,'');
        return authConfig;
    }
    
    /************************************************************
     Name:      AuraProcessingMessage
     Type:      Wrapper  Class  
     Purpose:   Wrapper  Class to hold error and success 
                message to  display in  lightning component 
    ***********************************************************/
    public class AuraProcessingMessage { 
        
        @AuraEnabled public Boolean isSuccess;
        @AuraEnabled public String errorMsg; //error msg
        @AuraEnabled public String successMsg; //success msg
        
        public AuraProcessingMessage(){
            isSuccess = true;
            errorMsg = '';
            successMsg = '';
        }
    }
    
}