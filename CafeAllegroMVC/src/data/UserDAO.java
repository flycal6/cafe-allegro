package data;

import entities.User; 

public interface UserDAO {
	
	//CUSTOMER METHODS
	public User customerCreateProfile(User user);
	
	public User customerUpdateProfile(int id, User user);
	
	public boolean customerDeleteProfile(int id);

	public User customerLogin(User loginUser);


}
