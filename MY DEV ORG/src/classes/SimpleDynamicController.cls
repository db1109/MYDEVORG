public class SimpleDynamicController {    
    public Component.Apex.PageBlock getDynamicComplex() {
    Component.Apex.PageBlock dynPageBlock = new Component.Apex.PageBlock();
    Component.Apex.Detail detail = new Component.Apex.Detail();
        detail.expressions.subject = '{!acct.OwnerId}';
        detail.relatedList = false;
        detail.title = false;
    Component.c.Typeahead TA1 = new Component.c.Typeahead(object='Account');
    Component.c.Typeahead TA2 = new Component.c.Typeahead(object='Contact');    
    dynPageBlock.childComponents.add(detail);
    dynPageBlock.childComponents.add(TA1);
    dynPageBlock.childComponents.add(TA2);
    return dynPageBlock;}
    public Account acct {get { return [SELECT Id, Name, OwnerId FROM Account LIMIT 1]; }}   
}