package data;

import entities.User; 

public interface UserDAO {
	
	//CUSTOMER METHODS
	public User customerCreateProfile(User user);
	
	User customerUpdateProfile(int id, User user);
	
	public boolean customerDeleteProfile(int id);

	User customerLogin(User loginUser);
	
	
	

	

	
	


}
