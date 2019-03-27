public class DeleteLearnClass {
    
    public final string username = 'test@test.com'; 
    public static string username1 = 'test@test.com'; 
    public string username2 = 'test@test.com'; 
    Account acc = new Account();
    
    public DeleteLearnClass(){
        
    }
    
    public void amountCalculation(){
        username2 = 'test1@test.com';
        amountCalculationPass(username2);
        amountCalculationPass2(username2);
    }
    
    public void amountCalculationPass(string username3){
        system.debug('*****username3*****'+username3);
        username3 = 'test3@test.com';
        system.debug('*****username3 after update*****'+username3);
        acc.Name = 'test Account';
        system.debug('*****acc.Name*****'+acc);
    }
    
    public void amountCalculationPass2(string username3){
        system.debug('*****username3*****'+username3);
        
        
    }
    
    public void amountCalculationPass3(){
        system.debug('*****username3*****'+username2);
        system.debug('*****acc.Name*****'+acc);
    }

}