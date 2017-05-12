({ 
 	handleBlur : function(component, event, helper){
        helper.getacc(component);
        helper.getlead(component);
    },

    init: function(component,helper) { component.set("v.isVisible", false);component.set("v.isVisibleFile", false);},
    
    createConfromLead : function (component, event, helper) {
        var s = component.get("v.SelectedLeads");
        var action = component.get("c.createContactsfromLeads"); 
        action.setParams({accid: component.get("v.acc.Id"),l:s});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {            
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({"recordId": component.get("v.acc.Id")});
                navEvt.fire();
            }});
        $A.enqueueAction(action);},
    
setAcc: function(component, event, helper) {  
      component.set("v.acc.Name", event.target.innerText);
      component.set("v.acc.Id", event.target.id);
      component.set("v.accountname", event.target.innerText);
      component.set("v.isVisible", false);
      component.set("v.isVisibleFile", true);
      component.set("v.parentid", event.target.id);
   },
    
setLead: function(component, event, helper) {  
     	var s = component.get("v.SelectedLeads");
        var x = event.target.id;
        var index = s.indexOf(x);
        if (index > -1) {s.splice(index, 1);}
        else {s.push(x);}
		component.set("v.SelectedLeads",s);
    },
    })