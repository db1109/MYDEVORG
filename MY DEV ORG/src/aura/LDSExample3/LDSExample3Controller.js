({ 
 	getPLsX: function(component) {
        var action = component.get("c.getPLVals");
          	action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.PLVs", response.getReturnValue());}});
        	$A.enqueueAction(action);},
   setPLV: function(component, event, helper) {  
      component.set("v.selectedPLV", event.target.id);},
})