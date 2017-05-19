public with sharing class CaseCtrl{
 
 
     @AuraEnabled
    public Static List<case> getCasesSimple(){
     
       
        list<case> lstC = [select casenumber, subject, status from case];
        return lstC;
    }
    
  
     
}