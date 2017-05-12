public class MilestoneAtFuture {

    @future
    Public static void touchRecords(List<id> c){
        list<case> fc = new list<case>();
        system.debug('c ' + c);
        
        list<case> uc = [select id,subject from case where id in :c];
        system.debug('uc ' + uc);
        for(case i: uc){i.subject = i.subject + '@fc'; system.debug('i' + i);fc.add(i);}
        system.debug('fc ' + fc);
        update fc;}
}