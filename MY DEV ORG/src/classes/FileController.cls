public class FileController {
    
@AuraEnabled
		public static List<string> getListDocType() {
			List<string> ListCaseStaus = new list<string>();
			Schema.DescribeFieldResult fieldResult = Inventory__c.Document_Type__c.getDescribe();
			List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
			for( Schema.PicklistEntry f : ple){ListCaseStaus.add(f.getLabel());}
            return ListCaseStaus;}

@AuraEnabled
    	public static Inventory__c saveAPEX(Id parentId, string Dtype, string Fname){
        
        Inventory__c i = new Inventory__c(name = Fname,Document_Type__c = Dtype, Investment__c = parentId );
        insert i;
        return i;}
                                           
    
    @AuraEnabled
    public static Inventory__c saveTheFile(Id parentId, string Inv, String fileName, String base64Data, String contentType) { 
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        system.debug('1 ' + Inv );
        Inventory__c i = new Inventory__c(name = Inv,Investment__c = parentId );
        insert i;
      	system.debug('2 ' + i.id );  
        
        Attachment a = new Attachment();
        system.debug('3 ' +parentId );  
        
        a.parentId = i.id;

        a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType;
        
        insert a;
        
        return i;
    }
}