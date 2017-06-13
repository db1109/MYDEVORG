({
	
    
    
    getcon: function(component) {
 var action = component.get("c.getHitsCon");

 action.setCallback(this, function(response) {
 var state = response.getState();
 if (component.isValid() && state === "SUCCESS") {
 component.set("v.Conhits", response.getReturnValue());}});
     $A.enqueueAction(action);},

    
    
})