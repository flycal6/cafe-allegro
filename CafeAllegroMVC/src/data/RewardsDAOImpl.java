package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Rewards;
import entities.User;

@Repository
@Transactional
public class RewardsDAOImpl implements RewardsDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public User increaseRewardPoints(User u, int pointsToAdd) {
		if (pointsToAdd < 10) {
			pointsToAdd = 10;
		}

		Rewards r = u.getRewards();
		r.setPoints(r.getPoints() + pointsToAdd);

		return u;
	}

	@Override
	public User decreaseRewardPoints(User u, int pointsToRemove) {
		if (pointsToRemove < 1) {
			pointsToRemove = 1;
		}

		Rewards r = u.getRewards();
		r.setPoints(r.getPoints() - pointsToRemove);
		return u;
	}

}
