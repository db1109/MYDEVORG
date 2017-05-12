public class qaController {

    @AuraEnabled
    public static List<Q_A__c> getHitsC(string recordID) {
        Investment__c	 i = [select Investment_Type__c from Investment__c	 where id=:recordId];
		list<Q_A__c> glist = [select Answers__c, Questions__c, Investment__r.Investment_Type__c, Investment__r.name, id from  Q_A__c where Investment__r.Investment_Type__c =:i.Investment_Type__c and Investment__r.id !=:recordID];
        return glist;
    }
}