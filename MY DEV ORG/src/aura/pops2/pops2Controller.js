({

     doInit: function(component, event, helper) {
// Close the action panel
var dismissActionPanel = $A.get("e.force:closeQuickAction");
dismissActionPanel.fire();
var resultsToast = $A.get("e.force:showToast");
resultsToast.setParams({
"title": "Something Nasty",
"message": "you are a clown"
});
resultsToast.fire();

},
    
})