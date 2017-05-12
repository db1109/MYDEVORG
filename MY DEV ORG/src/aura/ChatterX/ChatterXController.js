(

    {   
    
doInit : function(component, event, helper){
		helper.getListCaseStatusH(component);
		component.find("CaseStatus").set("v.value","Financial");
},

    
    
    saveInvX : function(component, event, helper){
        
    
         helper.saveInvXH(component,event,helper);
    }
     }
)