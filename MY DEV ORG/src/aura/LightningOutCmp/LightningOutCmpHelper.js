({
    getContacts: function(component, code) {        
        var action = component.get("c.getContacts");
        action.setParams({ "Accesscode": code});
        var self = this;
        action.setCallback(this, function(actionResult) {component.set("v.contacts", actionResult.getReturnValue());});        
        $A.enqueueAction(action);
    },
})