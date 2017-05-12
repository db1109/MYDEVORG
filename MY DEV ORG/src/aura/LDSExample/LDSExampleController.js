({ 
 	handleBlur : function(component, event, helper){
        helper.getacc(component);
        helper.getcon(component);
    
    },
  	init: function(cmp) { cmp.set("v.isVisible", false);},
    
    goCon: function(component, event) { 
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": event.target.id});
        navEvt.fire();
    },
    
    createCon : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
        
    createRecordEvent.fire();
},
    
    setAcc: function(component, event, helper) {  
      component.set("v.acc.Name", event.target.innerText);
      component.set("v.acc.Id", event.target.id);
      component.set("v.accountname", event.target.innerText);
      component.set("v.isVisible", false);}
})