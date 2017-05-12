public class SubmitCaseController {
public Case c { get; set; }    
    public String acctNum { get; set; }
    public String cd { get; set; }
    public String aid { get; set; }
    public String srch { get; set; }
    public list<account> la {get;set;}
    public date closeddate { get; set; }
    public boolean displayform { get; set; }
       public boolean showlkp { get; set; }
    public SubmitCaseController(ApexPages.StandardController stdController) {c = new Case();displayform = true;showlkp=true;}
	
    public void submitCase2() {
      	c.Target_Resolution__c = Date.valueOf(Apexpages.currentPage().getParameters().get('targdate'));} 
    
    public void submitCase3() {
       	string s = Apexpages.currentPage().getParameters().get('srch');
        s = s+'%';
		la = [select name, id from account where name like :s limit 5];
} 
    
    public void setAccountID() {
        string aid = Apexpages.currentPage().getParameters().get('aid');
c.accountid = Id.valueOf(aid);
        la = null;} 
    
    
    public void submitCase() {
        List<account> accts = [select id from account where accountnumber =:acctNum];
         if (accts.size()!= 1) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Invalid account number');
            ApexPages.addMessage(msg);} 
        else {
                c.AccountId = accts[0].Id;
                List<Contact> cnt = [SELECT Id FROM Contact WHERE AccountId =:c.AccountId AND Email =:c.SuppliedEmail LIMIT 1];
                if (cnt.size() != 0) 
                {c.ContactId = cnt[0].Id;}
                INSERT c;
            	case c1 = [select id, casenumber from case where id=:c.id];
            	displayform = false;
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Case Created: Reference Number is ' + c1.CaseNumber);
            	ApexPages.addMessage(msg);}}}