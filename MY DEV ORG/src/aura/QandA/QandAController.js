({ 
    
    doInit : function(component, event, helper){
        helper.getggg(component);},
  
   navToBar: function(component, event, helper) {
      	var sObjId = event.target.id;
    	var navToSObjEvt = $A.get("e.force:navigateToSObject");
		navToSObjEvt.setParams({recordId: sObjId});
		navToSObjEvt.fire();}
    
})