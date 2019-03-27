trigger TransferInactiveUsers on User (after update) {
    Integer count = 0;
    List<ID> userids = new List<ID>();
    For (User usr : Trigger.new){
        if (Trigger.oldMap.get(usr.Id).IsActive == true)
            if(Trigger.newMap.get(usr.Id).IsActive == false)
            userids.add(usr.Id);
    }
    //TransferInactiveUsers trans = new TransferInactiveUsers();
    TransferInactiveUsers.TransferInactiveUsersHandler(userids);
        
}