//Generated by wsdl2apex

public class soapSforceComSchemasClassAddtooppor {
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class AddCurrentUser_element {
        public String optyId;
        private String[] optyId_type_info = new String[]{'optyId','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'optyId'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class DebuggingHeader_element {
        public soapSforceComSchemasClassAddtooppor.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class RemoveCurrentUserResponse_element {
        public String result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class AddCurrentUserResponse_element {
        public String result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class RemoveCurrentUser_element {
        public String optyId;
        private String[] optyId_type_info = new String[]{'optyId','http://soap.sforce.com/schemas/class/AddToOpportunityTeam',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam','true','false'};
        private String[] field_order_type_info = new String[]{'optyId'};
    }
    public class AddToOpportunityTeam {
        public String endpoint_x = 'https://na70.salesforce.com/services/Soap/class/AddToOpportunityTeam';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassAddtooppor.CallOptions_element CallOptions;
        public soapSforceComSchemasClassAddtooppor.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassAddtooppor.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassAddtooppor.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassAddtooppor.DebuggingHeader_element DebuggingHeader;
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/AddToOpportunityTeam';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/AddToOpportunityTeam';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/AddToOpportunityTeam';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/AddToOpportunityTeam';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/AddToOpportunityTeam';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/AddToOpportunityTeam', 'soapSforceComSchemasClassAddtooppor'};
        public String AddCurrentUser(String optyId) {
            soapSforceComSchemasClassAddtooppor.AddCurrentUser_element request_x = new soapSforceComSchemasClassAddtooppor.AddCurrentUser_element();
            request_x.optyId = optyId;
            soapSforceComSchemasClassAddtooppor.AddCurrentUserResponse_element response_x;
            Map<String, soapSforceComSchemasClassAddtooppor.AddCurrentUserResponse_element> response_map_x = new Map<String, soapSforceComSchemasClassAddtooppor.AddCurrentUserResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/AddToOpportunityTeam',
              'AddCurrentUser',
              'http://soap.sforce.com/schemas/class/AddToOpportunityTeam',
              'AddCurrentUserResponse',
              'soapSforceComSchemasClassAddtooppor.AddCurrentUserResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public String RemoveCurrentUser(String optyId) {
            soapSforceComSchemasClassAddtooppor.RemoveCurrentUser_element request_x = new soapSforceComSchemasClassAddtooppor.RemoveCurrentUser_element();
            request_x.optyId = optyId;
            soapSforceComSchemasClassAddtooppor.RemoveCurrentUserResponse_element response_x;
            Map<String, soapSforceComSchemasClassAddtooppor.RemoveCurrentUserResponse_element> response_map_x = new Map<String, soapSforceComSchemasClassAddtooppor.RemoveCurrentUserResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/AddToOpportunityTeam',
              'RemoveCurrentUser',
              'http://soap.sforce.com/schemas/class/AddToOpportunityTeam',
              'RemoveCurrentUserResponse',
              'soapSforceComSchemasClassAddtooppor.RemoveCurrentUserResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}