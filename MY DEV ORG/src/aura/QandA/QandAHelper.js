({
 	getggg: function(component) {
        var action = component.get("c.getHitsC");
        action.setParams({recordID : component.get("v.recordId")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.Ghits", response.getReturnValue());}});
        $A.enqueueAction(action);}
})