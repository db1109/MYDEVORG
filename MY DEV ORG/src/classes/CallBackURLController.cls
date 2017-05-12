public with sharing class CallBackURLController{
 
    @AuraEnabled
    public Static List<Contact> getContacts(String Accesscode){
     
        version__c vrsn = [select name, ClientId__c, ClientSecret__c from version__c limit 1];
        Accesscode = Accesscode.replace('=','%3D').trim();
        String redireUri = 'https://priyankatrial-dev-ed.my.salesforce.com/apex/callbackurlpage';
        String loginUri = 'https://tcspoc--TRPOCTCS.cs43.my.salesforce.com';
        String header = '';
        String endpoint = '';
       	String reqbody = 'grant_type=authorization_code' + '&client_id=' + vrsn.ClientId__c +
            '&client_secret=' + vrsn.ClientSecret__c + '&code=' + Accesscode + '&redirect_uri=' + redireUri;
        endpoint = loginUri + '/services/oauth2/token?' + reqbody;
        Map<String, object> mapReqBody = CallBackURLController.getHTTPResponse(endpoint, header, 'POST');
        header = string.valueOf(mapReqBody.get('token_type')) + ' ' + string.valueOf(mapReqBody.get('access_token'));
        endpoint = loginUri + '/services/oauth2/userinfo';
         
        ///// User Info       
        Map<String, object> mapReqInfoBody = CallBackURLController.getHTTPResponse(endpoint, header, 'POST');
      
        endpoint = 'https://tcspoc--TRPOCTCS.cs43.my.salesforce.com/services/data/v39.0/query/?q=select+id,name,phone,email+from+contact';
        Map<String, object> mapReqQryBody = CallBackURLController.getHTTPResponse(endpoint, header, 'GET');
        string strCons = JSON.serialize(mapReqQryBody.get('records'));
        list<contact> lstCon = (list<contact>) JSON.deserialize(strCons, List<contact>.class);
        return lstCon;
    }
     
    
    
     @AuraEnabled
    public Static List<Contact> getContactsSimple(){
     
       
        list<contact> lstCon2 = [select id,name,phone,email from contact];
        return lstCon2;
    }
    
    public static Map<String, object> getHTTPResponse(String endpoint, String header, String method){
     
        system.debug(' endpoint ' + endpoint);
        HttpRequest req = new HttpRequest();  
        req.setMethod(method);
        req.setEndpoint(endpoint);
        if(header != ''){
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', header);
        }
        Http httpReq = new Http();  
        system.debug('req ' + req);
        HTTPResponse res = httpReq.send(req);
        system.debug('res ffs' + JSON.deserializeUntyped(res.getBody()));
        return (Map<String, object>)JSON.deserializeUntyped(res.getBody());
    }
     
}