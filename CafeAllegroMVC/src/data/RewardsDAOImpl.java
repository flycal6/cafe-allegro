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
	public User increaseRewardPoints(User u, double pointsToAdd) {
		if (pointsToAdd < 10) {
			pointsToAdd = 10;
		}

		Rewards r = u.getRewards();
		r.setPoints((int)(r.getPoints() + pointsToAdd));

		return u;
	}

	@Override
	public User decreaseRewardPoints(User u, double pointsToRemove) {
		if (pointsToRemove < 1) {
			pointsToRemove = 1;
		}
		u = em.find(User.class, u.getId());
		
		Rewards r = u.getRewards();
		r.setPoints((int)(r.getPoints() - pointsToRemove));
		if(r.getPoints() < 0) {
			r.setPoints(0);
		}
		return u;
	}
	
	@Override
	public int showUpdatedRewardPoints(User u) {
		u = em.find(User.class, u.getId());
		int points = u.getRewards().getPoints();
		return points;
	}

}
