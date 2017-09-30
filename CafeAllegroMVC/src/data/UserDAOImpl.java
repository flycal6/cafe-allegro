package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User customerCreateProfile(User user) {
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
	public User customerUpdateProfile(int id, User user) {
		User managedUser = em.find(User.class, id);
		managedUser.setFirstName(user.getFirstName());
		managedUser.setLastName(user.getLastName());
		managedUser.setEmail(user.getEmail());
		

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
		} finally {

		}

		return false;

	}

}
