public class lexLookup {
	
    public String aid { get; set; }
    public String srch { get; set; }
    public list<account> la {get;set;} public String selectedID { get; set; }
    public String field { get; set; }
    public Sobject sobj {get;set;}
	public lexLookup() {}
	public lexLookup(ApexPages.StandardController x){}

    public void searchAccCont() {
       	string s = Apexpages.currentPage().getParameters().get('srch');s = s+'%';
		la = [select name, id from account where name like :s limit 5]; } 
    
    public void setAccountID() {
        string aid = Apexpages.currentPage().getParameters().get('aid');selectedID = Id.valueOf(aid);
        la = null;
    	id i = (id)sobj.put(field, aid);
        } }