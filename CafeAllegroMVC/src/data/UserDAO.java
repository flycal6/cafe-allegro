package data;

import entities.User; 

public interface UserDAO {
	
	//CUSTOMER METHODS
	public User customerCreateProfile(User user);
	
	public User updateUserProfile(User user);
	
	public boolean customerDeleteProfile(int id);

	public User customerLogin(User loginUser);


}
