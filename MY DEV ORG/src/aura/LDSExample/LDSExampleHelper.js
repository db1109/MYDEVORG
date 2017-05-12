({
 	getacc: function(component) {
        var action = component.get("c.getHitsAcc");
        action.setParams({srchstring : component.get("v.accountname")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.isVisible", true);
                component.set("v.Acchits", response.getReturnValue());}});
        $A.enqueueAction(action);},
    
    getcon: function(component) {
        var action = component.get("c.getHitsCon");
        action.setParams({srchstring : component.get("v.accountname")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.isVisible", true);
                component.set("v.Conhits", response.getReturnValue());}});
        $A.enqueueAction(action);},
    
})