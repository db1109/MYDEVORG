({ 
 	handleBlur : function(component, event, helper){
        helper.getacc(component);
        helper.getcon(component);
        helper.getPLs(component);
    },

    init: function(component,helper) { component.set("v.isVisible", false);component.set("v.isVisibleFile", false);},
    
    showfile: function(cmp,event) { 
        var f = event.target.files[0]; 
        var fileInput = cmp.find("file").getElement();
    	var file = fileInput.files[0];
        var r = new FileReader();
      	r.onload = function(e) { 
       	var contents = e.target.result;
        var base64Mark = 'base64,';
        var dataStart = contents.indexOf(base64Mark) + base64Mark.length;
 		var fileContents = contents.substring(dataStart);
        var action = cmp.get("c.saveTheFile"); 
        action.setParams({
            parentId: cmp.get("v.parentid"),
            fileName: f.name,
            base64Data: encodeURIComponent(fileContents), 
            contentType: file.type
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {            
            	var navEvt = $A.get("e.force:navigateToSObject");
        		navEvt.setParams({"recordId": cmp.get("v.parentid")});
        		navEvt.fire();
            }});
        $A.enqueueAction(action);}
    	r.readAsDataURL(file);},
    
    goCon: function(component, event) { 
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": event.target.id});
        navEvt.fire();
    },
    
    createCon : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
   	createRecordEvent.fire();},
    
    setAcc: function(component, event, helper) {  
      component.set("v.acc.Name", event.target.innerText);
      component.set("v.acc.Id", event.target.id);
      component.set("v.accountname", event.target.innerText);
      component.set("v.isVisible", false);
      component.set("v.isVisibleFile", true);
      component.set("v.parentid", event.target.id);
    
    },
    setPLV: function(component, event, helper) {  
      component.set("v.selectedPLV", event.target.id);
    
    
    },
    
 
    
})