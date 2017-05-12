({
	getOppH: function(component) {
			var action = component.get("c.getOpp");
        	action.setParams({recordID : component.get("v.recordId")});
			action.setCallback(this, function(response) {
				var state = response.getState();
                	if (component.isValid() && state === "SUCCESS") {
						component.set("v.Opp", response.getReturnValue());}});
				$A.enqueueAction(action);},
})