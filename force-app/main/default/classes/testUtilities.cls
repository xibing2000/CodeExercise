@IsTest
global class testUtilities {

    @TestSetup
    static void testSetup(){
        List<Account> accList = new List<Account>();
        for(Integer i = 0 ; i < 100 ; i++){
            Account temp = new Account(Name = 'Test Acc ' + i);
            accList.add(temp);
        }
        insert accList;

        List<Contact> contactList = new List<Contact>();
        for(Integer i = 0 ; i < accList.size() ; i++){
            Contact temp = new Contact(LastName = 'Test Contact ' + i, AccountId = accList[i].Id);
            contactList.add(temp);
        }
        insert contactList;
    }

}