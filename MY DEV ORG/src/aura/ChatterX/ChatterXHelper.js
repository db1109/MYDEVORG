({
 	getListCaseStatusH: function(component) {
			var action = component.get("c.getListDocType");
			action.setCallback(this, function(response) {
				var state = response.getState();
                	if (component.isValid() && state === "SUCCESS") {
						component.set("v.ListDocStatus", response.getReturnValue());}});
				$A.enqueueAction(action);},
	
    saveInvXH: function(component) {
        var action = component.get("c.saveAPEX"); 
        var Dtypevar = component.find("CaseStatus").get("v.value");
     	action.setParams({parentId: component.get("v.recordId"),Dtype : Dtypevar,
        Fname : component.get("v.NEWINV.Name")});
		action.setCallback(this, function(response) {
			var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
				component.set("v.NEWINV", response.getReturnValue());
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({"recordId": component.get("v.NEWINV.Id")});
                navEvt.fire();}});
        $A.enqueueAction(action);}
})