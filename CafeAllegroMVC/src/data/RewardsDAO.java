package data;

import entities.User;

public interface RewardsDAO {

	public User increaseRewardPoints(User u, int pointsToAdd);
	
	public User decreaseRewardPoints(User u, int pointsToRemove);
}
