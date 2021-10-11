/* Didn't use testUtilities since we don't need so many record */

@isTest 
private class UpdateContactTestClass { 
    public static testMethod void testUpdateContacts() {
        Test.startTest(); 
        //select an existing community user from system
        User u = [select Id,ContactId,Street from User where ContactId<>'' limit 1]; 

        //Change address
        u.Street='123 Main Street'; 
        update u; 

        Test.stopTest(); 

        Contact c = [select MailingStreet from Contact where Id=:u.ContactId]; 
        //verify the result
        System.assertEquals(c.MailingStreet,u.Street); 
    }
}
