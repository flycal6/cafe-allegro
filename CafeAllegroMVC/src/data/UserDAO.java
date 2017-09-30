package data;

import entities.User; 

public interface UserDAO {
	
	//CUSTOMER METHODS
	public User customerCreateProfile();
	
	public User customerReadProfile();
	
	public User customerUpdateProfile();
	
	public User customerDeleteProfile();
	
	//ADMIN
	public User adminCreateProfile();
	
	public User adminReadProfile();
	
	public User adminUpdateProfile();
	
	public User adminDeleteProfile();
	


}
