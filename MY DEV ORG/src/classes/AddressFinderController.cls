public class AddressFinderController {
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name FROM Account WHERE name LIKE :name LIMIT 50];
    }    
    @AuraEnabled
    public static List<Contact> findContactsByAccountId(Id accountId) {
        return [SELECT id, name FROM Contact WHERE AccountId = :accountId LIMIT 50];
    }    
    @AuraEnabled
    public static AddressInfo getAddressInfo(Id contactId) {
        Contact contact = [select Id, Name, AccountId from Contact where Id = :contactId];
        Account account = [select Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry from Account where Id = :contact.AccountId];
        AddressInfo address = new AddressInfo();
        address.AddressLine1 = contact.Name;
        address.AddressLine2 = account.BillingStreet;
        address.AddressLine3 = account.BillingCity;
        address.AddressLine4 = account.BillingPostalCode;
        address.AddressLine5 = account.BillingCountry;
        return address;
    }
}