trigger HAS_Trigger on HierarchyShare__c (after insert) {
for (HierarchyShare__c a : Trigger.new)
{
	List<id> listAccountID = new List<id> ();
    List<id> listAccountID2 = new List<id> ();
    List<id> listAccountID3 = new List<id> ();
    List<id> listAccountID4 = new List<id> ();
    List<id> listAccountID5 = new List<id> ();   
    listAccountID.add(a.Account__c);    
    List<account> child2 = [select id from account where parentid in:listAccountID ];
    for(Account a2: child2){listAccountID2.add(a2.id);}
    List<account> child3 = [select id from account where parentid in:listAccountID2 ];
    for(Account a3: child3){listAccountID3.add(a3.id);}
    List<account> child4 = [select id from account where parentid in:listAccountID3 ];
    for(Account a4: child4){listAccountID4.add(a4.id);}
    List<account> child5 = [select id from account where parentid in:listAccountID4 ];
    for(Account a5: child5){listAccountID5.add(a5.id);}
    listAccountID.addAll(listAccountID2);
    listAccountID.addAll(listAccountID3);
    listAccountID.addAll(listAccountID4);
    listAccountID.addAll(listAccountID5);
    List<AccountShare> InsertList = new List<AccountShare>();
    for( id i: listAccountID){
        AccountShare as1 = new AccountShare(AccountAccessLevel='Read', AccountId = i,CaseAccessLevel='None',OpportunityAccessLevel='Read',RowCause='Manual',UserOrGroupId=a.User__c );
		InsertList.add(as1);
    }
    insert InsertList;
}}