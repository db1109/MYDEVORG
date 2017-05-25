trigger ProcessCaseAttachment on Attachment (after insert) {
    if(Trigger.IsAfter){
        list<case> cupd = new list<case>();
        list<id> emailids = new list<id>();
        map<id,string> emailID2Attachment = new map<id,string>();
        for(Attachment a: Trigger.new){
            String parentid = String.valueof(a.parentid);
            String attachmentName = a.name;
            if (parentid.startsWith('02s') && attachmentName.startswith('ErrorReport')){
                	emailids.add(a.parentid);
                	emailID2Attachment.put(a.parentid, a.body.tostring());}}    
        list<emailmessage> emails = [select parentid from emailmessage where id in :emailids];
        for (Emailmessage e: emails){
            case c = new case(id=e.parentid, description =emailID2Attachment.get(e.Id) );
            cupd.add(c);}
        update cupd;}}