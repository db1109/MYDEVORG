public class PushNotificationsController {
    public List<Task> t {get;set;} 
    public Integer TaskSize;
    public id UserId;   
    public string style {get;set;} 
    
    Public PushNotificationsController(){
        style = '#8FE9E3';
        UserId = UserInfo.getuserid();
        t = [Select Id,subject ,status,createddate from task where ownerid =:UserId and status='Not Started' order by createddate desc];
        style = setcolour(t.size());
    }

Public Integer getTaskSize(){if(t!=null){return t.size();}else return 0;}

Public void RefreshCaseListJS(){
        t = [Select Id,subject ,status,createddate from task where ownerid =:UserId and status='Not Started' order by createddate desc];
       style = setcolour(t.size());
}
    
public string setcolour(integer i)
    {
        string color;
        if(i < 5){color = '#8FE9E3';}
        else if (i< 10){color = '#e5b789';}
        else {color = '#e58990';}
        return color;
    }
}