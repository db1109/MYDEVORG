public class abc {

    public pagereference getRouter(){
   
     PageReference   p = new PageReference('https://mypriyankatrial-developer-edition.eu11.force.com/QQQ/s/profile/' + userinfo.getUserId());
    return p;
}
}