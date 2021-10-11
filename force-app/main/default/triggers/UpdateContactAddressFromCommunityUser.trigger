trigger UpdateContactAddressFromCommunityUser on User (after update) {
    //Only consider the community user update their address on portal
    if (Trigger.new.size()==1) 
    { 
        User u = Trigger.new[0]; 
        //check if user is community user 
        if (u.ContactId!=null) { 
            UpdateContactAddressFromCommunityUser.updateContact(u.Id); 
        } 
    } 
}