trigger INVTrigger on Inventory__c (before insert) {
system.debug('INVTrigger');
}