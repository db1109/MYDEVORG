({
    getContacts: function(component) {        
        var action = component.get("c.getCasesSimple");
        
        var self = this;
        action.setCallback(this, function(actionResult) {component.set("v.contacts", actionResult.getReturnValue());});        
        $A.enqueueAction(action);
    },
})