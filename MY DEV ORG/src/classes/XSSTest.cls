public class XSSTest {
    public account a { get; set; }    
    public String myTextField { get; set; }
   
    public XSSTest(ApexPages.StandardController stdController) {a = new Account();
                                                               if ( 1 > 0)
                                                                   system.debug('e');
                                                                else
                                                                    system.debug('f');
                                                               
                                                               }
     
}