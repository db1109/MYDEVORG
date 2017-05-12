trigger AddEnts on Case (after Insert, before Insert) {

if(Trigger.IsBefore){
    List<id> accIds = new list<id>();
    List<case> cupd = new list<case>();
    for(Case c : Trigger.new){accIds.add(c.accountid);}
    list<entitlement> listEnt =[select id,AccountId from Entitlement where Accountid in:accIds];
    
    for(Case c : Trigger.new){
       for(Entitlement e : listEnt){
            if(e.AccountId==c.AccountId){c.EntitlementId = e.Id;}}}
}

    
    
}