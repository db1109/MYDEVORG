({
    searchKeyChange: function (cmp, event) {
        var action = cmp.get("c.findByName");
        action.setParams({ "searchKey": event.target.value });
        action.setCallback(this, function(a) {
            cmp.set("v.accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    accountSelected : function(cmp, event) {
        var action = cmp.get("c.findContactsByAccountId");
        action.setParams({ "accountId": event.target.id });
        action.setCallback(this, function(a) {
            cmp.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    contactSelected : function(cmp, event) {

        var contactId = event.target.id;
        var action = cmp.get("c.getAddressInfo");
        action.setParams({ "contactId": contactId });
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
            var compEvent = $A.get("e.c:AddressInfo");
            compEvent.setParams({"address" : a.getReturnValue() } );
            compEvent.fire();
        });
        $A.enqueueAction(action);
    }
})