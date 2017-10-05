package data;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.MenuItem;
import entities.Order;
import entities.Rewards;
import entities.User;
import entities.UserRole;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User createNewUser(User user) {
		Rewards r = new Rewards();
		r.setPoints(10);
		user.setRewards(r);
		UserRole ur = em.find(UserRole.class, 2);
		user.setUserRole(ur);
		
		em.persist(user);
		em.flush();

		return user;
	}
	
	@Override
	public User customerLogin(User loginUser) {
		User u = null;
	
		String query = "SELECT u from User u where u.username = :username AND u.password = :password";
		
		List<User> userGotBack = em.createQuery(query, User.class)
				.setParameter("username", loginUser.getUsername())
		        .setParameter("password", loginUser.getPassword()).getResultList();
		   if( userGotBack.size() > 0 ) {
			  u = userGotBack.get(0);
		   }
	
		
		return u;
	}


	@Override
	public User updateUserProfile(User user) {
		
//		String q = "SELECT u FROM User u WHERE u.id = :id";
		
		User managedUser = em.find(User.class, user.getId());
		
		managedUser.setFirstName(user.getFirstName());
		managedUser.setLastName(user.getLastName());
		managedUser.setEmail(user.getEmail());
		managedUser.setPhoneNumber(user.getPhoneNumber());
		managedUser.setUsername(user.getUsername());
		managedUser.setPassword(user.getPassword());
		
		return managedUser;
	}
	

	@Override
	public boolean customerDeleteProfile(int id) {
		try {
			User user = em.find(User.class, id);
			em.remove(user);
			if (em.find(User.class, id) == null) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// HANDLE EXCEPTION MAYBE???
			return false;
		}
		return false;
	}
	
	@Override
	public String getTotalMoneySpent(User u) {
		int id = u.getId();
		u = em.find(User.class, u.getId());

		String q = "SELECT o FROM Order o JOIN FETCH o.menuItems WHERE o.user.id = :id";
		
		List<Order> orders = em.createQuery(q, Order.class).setParameter("id", id).getResultList();
		System.out.println("# of orders: " + orders.size());
		double total = 0;
		List<MenuItem> mi = new ArrayList<>();
		for (Order order : orders) {
			System.out.println(order);
			mi = order.getMenuItems();
			total = total + order.getMenuItems().get(0).getPrice();
			
		}
		NumberFormat nf = new DecimalFormat("#0.00");    
		String sTotal = nf.format(total);
		
		return sTotal;
	}
	
}
