@isTest
public class ObjectTestClass_Test {
   
    //V2 !
    public static testMethod void testRunAs() {
        Opportunity o = new Opportunity();
    	o.CloseDate = date.parse('11/11/2019');
    	o.name='1';
    	o.StageName = 'Prospecting';
    	insert o;
    	test.startTest();
    	ObjectTestClass.getOpp(String.valueOf(o.ID));
        test.stopTest();
        }
}