({
    onClick : function(component, event, helper) {
        var id = event.target.dataset.menuItemId;
        if (id) {
            component.getSuper().navigate(id);
         }
   },
    
    
   
    doSomething : function(component, event, helper) {
       alert( {!v.menuItems});
    },

    
    
    
    
})