public class ObjectTestClass {
 @AuraEnabled
 public static Opportunity getOpp(string recordID) {
	Opportunity o = [select Name, Id, StageName from Opportunity where Id =:recordID];
	return o;
 }



}