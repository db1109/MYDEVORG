public class LDSController {
    @AuraEnabled
    public static List<Account> getHitsAcc(string srchstring) {
        string s = srchstring + '%';
       	list<Account> a = [select name, id from  Account where name like :s];
        return a;
    }
    
     @AuraEnabled
    public static List<Contact> getHitsCon(string srchstring) {
        string s = srchstring + '%';
       	list<Contact> c = [select Name, Id,Email,Account.Name,Title from  Contact where Account.name like :s];
        return c;
    }
    
    
    @AuraEnabled
    public static List<Lead> getHitsLead(string srchstring) {
        list<Lead> c = [select Name, Id,Email from Lead limit 4];
        return c;
    }
    
    @AuraEnabled
    public static List<Contact> createContactsfromLeads(list<id> l, id accid) {
    list<contact> lc = new list<contact>();
    list<Lead> ls = [select firstname,lastName, Id,Email from Lead where id in:l];
	for(lead li:ls){
    Contact c = new Contact(email = li.email, firstname = li.firstname, lastname = li.lastname, accountid = accid);
    lc.add(c);}
        insert lc;
        return lc;
	}
    
    
    
    @AuraEnabled
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) { 
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment a = new Attachment();
        a.parentId = parentId;
	    a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType; 
        insert a;
        return a.Id;
    }
    @AuraEnabled
    public static List<String> getPLVals(string s)
    {
        List<string> options = new List<string>();
        
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            options.add(f.getLabel());
        }   
        options.add('123');
        return options;
    }
    
}