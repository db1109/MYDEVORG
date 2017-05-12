public class LookupController {
	public Case c { get; set; }    
    public String aid { get; set; }
    public String srch { get; set; }
    public list<account> la {get;set;}
    public LookupController(ApexPages.StandardController stdController) {c = new Case();}
	public void searchAccCont() {
       	string s = Apexpages.currentPage().getParameters().get('srch');s = s+'%';
		la = [select name, id from account where name like :s limit 5];} 
    public void setAccountID() {
        string aid = Apexpages.currentPage().getParameters().get('aid');c.accountid = Id.valueOf(aid);
        la = null;} 
}