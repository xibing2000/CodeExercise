/* Utility class to update community user related contact record  */

global without sharing class UpdateContactAddressFromCommunityUser { 
    @future 
    public static void updateContact(String userId) {
        //Select user record
        User u = [select ContactId,Street from User where Id=:userId];

        //if user is community user, then update address field
        if (u!=null && u.ContactId!=null) {
            Contact c = new Contact(Id=u.ContactId, MailingStreet=u.Street);
            update c; 
        }
    }
}