({

doInit: function(component, event, helper) {
var resultsToast = $A.get("e.force:showToast");
resultsToast.setParams({"title": "Something Nasty","message": "you are a clown"});
resultsToast.fire();  
window.setTimeout($A.getCallback(function() {if (component.isValid()) {
var dismissActionPanel = $A.get("e.force:closeQuickAction");
dismissActionPanel.fire();}}), 1);
},    

})