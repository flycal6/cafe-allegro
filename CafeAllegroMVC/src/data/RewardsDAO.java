package data;

import entities.User;

public interface RewardsDAO {

	public User increaseRewardPoints(User u, double pointsToAdd);
	
	public User decreaseRewardPoints(User u, double rewardPointReduction);

	int showUpdatedRewardPoints(User u);
}
