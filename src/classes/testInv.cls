public class testInv{
    
    protected string testString = 'test';
        
    public void invMet(){
        String jsonInput = '{"item": 4, "change":  "40", "limit1": 400, "limit2": 500}';
            
        Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(jsonInput);
        System.debug('item:' + m); 
        testInvWrapper inv = new testInvWrapper();
        inv = (testInvWrapper)JSON.deserializeStrict(jsonInput, testInvWrapper.class);
        System.debug('item:' + inv); 
        
        Integer a =  (Integer)m.get('item');
        System.debug('item:' + a); 
        
        String c = (String)m.get('change');
        System.debug('change:' + c);
        testInvWrapper tv = new testInvWrapper();
        tv.item = 'test';
    }
        
    public void invMet1(){
        testString = 'test2';
    }    
        
    public class testInvWrapper{
        protected string item;
        public string change;
        public string limit1; 
          
        
        public void invMet3(){
            testInv tv = new testInv();
            tv.testString = 'test23'; 
        }    
    }
}