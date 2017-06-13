public class TableJC {

     @AuraEnabled
 public static List<Contact> getHitsCon() {

list<Contact> c = [select Name, Id,Email,Account.Name,Title from Contact];
 return c;
 }
    
}