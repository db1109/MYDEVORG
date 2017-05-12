({
    redirect : function(component, event, helper) {
        window.location.href = 'https://tcspoc--TRPOCTCS.cs43.my.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG9GnaLrwG9TQRVzdzQ0nVRYEamtzcuipRCD1MS1Jp06RQXuvInlnrnsuaN5NiIaTHuDsIaRMTYiCb0gavs&redirect_uri=https://priyankatrial-dev-ed.my.salesforce.com/apex/callbackurlpage&prompt=login&display=popup';        
    },
    getCons : function(component, event, helper) {
        var code = component.get("v.code");        
        helper.getContacts(component, code);
    },
}