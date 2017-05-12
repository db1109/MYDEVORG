trigger LA on LiveChatTranscript (after insert) {

for (LiveChatTranscript l : Trigger.new)

{
feeditem f = new feeditem();
//f.body = 'Accounts …' + l.id;
f.type = 'LinkPost';
f.parentId = l.CaseId;
    f.LinkUrl = '/' + l.id;
f.Type='ContentPost';
insert f;
}
    
}