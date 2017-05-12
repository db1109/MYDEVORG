public class docController {
    @AuraEnabled
    public static List<DocLink__c> getHitsC(string recordID) {
        Map<id,Inventory__c> InvMap=new Map<id,Inventory__c>([select id , Document_Type__c from Inventory__c where Investment__c=:recordId]);
        list<Inventory__c> InvList= [select id , Document_Type__c from Inventory__c where Investment__c=:recordId];
        list<id> InvListID = new List<id>();
        for (Inventory__c i: InvList){InvListID.add(i.id);}
        list<ContentDocumentLink> ListDocLink = [select LinkedEntityId, ContentDocumentID from ContentDocumentLink where LinkedEntityId in:InvListID]; 
	    list<id> CDLListID = new List<id>();
		for (ContentDocumentLink cdl: ListDocLink){CDLListID.add(cdl.ContentDocumentId);}
        Map<id,ContentDocument> CDMap=new Map<id,ContentDocument>([select id , Title from ContentDocument where id in:CDLListID]);
        List<DocLink__c> retList = new  List<DocLink__c>();
		for (ContentDocumentLink cdl: ListDocLink){
            ContentDocument c = CDMap.get(cdl.ContentDocumentId);
            Inventory__c i = InvMap.get(cdl.LinkedEntityId);
            DocLink__c d = new DocLink__c(Inventory_Link__c =  i.id,Link__c = cdl.ContentDocumentID, name = c.title, Inventory_Type__c =  i.Document_Type__c );
          	retList.add(d);}
       return retList;
}}