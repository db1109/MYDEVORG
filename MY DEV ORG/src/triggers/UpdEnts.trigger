trigger UpdEnts on Case (after update) {

    DateTime completionDate = System.now();
    List<id> cids = new list<id>();
    List<CaseMilestone> updL = new List<CaseMilestone>();
    for (Case c : Trigger.new){cids.add(c.id);}

    List<CaseMilestone> assocCM = [select MilestoneType.Name, completionDate,id, caseId from CaseMilestone where caseId in :cids ];
    for (Case c : Trigger.new){
        for (CaseMilestone cx: assocCM)
        {
		if (c.Status == 'Working' && c.id==cx.caseId && cx.MilestoneType.Name == 'Reply to Customer')
        {
			cx.completionDate = completionDate;
        	updL.add(cx);
        }
        if (c.Status == 'RCA Complete' && c.id==cx.caseId && cx.MilestoneType.Name == 'Internal Root Cause Analysis')
        {
			cx.completionDate = completionDate;
        	updL.add(cx);
            }
        }
    }
        update updL;
    }