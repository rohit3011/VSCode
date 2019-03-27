public class DemoClassGetSet {

    public String userinput;
    public String getuserinput(){
        return 'John';
    }
    
    public void setuserinput(String userinput){
        this.userinput = userinput;
        system.debug('*************'+userinput);
    }   
    
}