public with sharing class JQTableController {

    public Account a { get; set; }    
    Public string chosenID {get;set;}
    public List<Contact> con {get;set;}
    
    public JQTableController(ApexPages.StandardController stdController) {

        this.a= (Account)stdController.getRecord();
        con = [select email, firstname, ENC__c,lastname from Contact where accountid =:a.id];
        system.debug('con ' + con);
        }
    }