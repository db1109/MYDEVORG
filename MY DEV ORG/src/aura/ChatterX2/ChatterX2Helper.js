({
	 getListCaseStatusH: function(component) {
			var action = component.get("c.getListDocType");
			action.setCallback(this, function(response) {
				var state = response.getState();
                	if (state === "SUCCESS") {
    						component.set("v.ListDocStatus", response.getReturnValue());
                    
                    }});
				$A.enqueueAction(action);}
    
    
})