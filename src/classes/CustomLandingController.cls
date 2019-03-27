/*
 * Class:               CustomLandingController 
 * Description:         An apex page controller that takes the user to the right start page based on credentials or lack thereof.     
 * Created By :         Unknown
 * Last Modified By :   IBM/Jayant Yadav
 * Modification History:
 * 20/Jan/2015 (JY) - Modified for GMS-3093, February 2015 release. Purpose is to soft-code the Site user names, which are currently hardcoded in entire app.
 * Added method calls to CommonUtil.getSiteUser() instead of hard-coded user names.   
 */
public with sharing class CustomLandingController {
    public String strUrl{get;set;}
    // Code we will invoke on page load.
    public PageReference forwardToCustomAuthPage() {
        
        strUrl = URL.getCurrentRequestUrl().toExternalForm();
        String baseURL='';
        String pageURL='';
        
        if(strUrl!=null && strUrl!='' && strUrl.contains('/articledetailsview/'))
        {
            String[] tempURL = strUrl.split('/articledetailsview/');
            baseURL = tempURL[0];
            pageURL = tempURL[1];
        }
        
        String strid = ApexPages.currentPage().getParameters().get('id');
        
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        String username = Userinfo.getFirstName() + ' ' + Userinfo.getLastName();       
        if(username.containsIgnoreCase('portal')){   
           system.debug('insdie If===='+Userinfo.getName());
            return new PageReference('/customlogin');
        }
        if(UserInfo.getUserType() == 'Guest'){
            return new PageReference('/customlogin');
        }
        else{    
            return new PageReference('/homepage');  //'/Browse'+EncodingUtil.urlEncode('&id=kA0f000000008GOCAY', 'UTF-8')
        }
    }

    public CustomLandingController() {
        String strUrl = URL.getCurrentRequestUrl().toExternalForm();
    }
}