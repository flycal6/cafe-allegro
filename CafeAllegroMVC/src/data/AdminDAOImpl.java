package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.MenuItem;

@Repository
@Transactional
public class AdminDAOImpl implements AdminDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public MenuItem adminUpdateMenuItem(MenuItem item) {
		MenuItem mi = em.find(MenuItem.class, item.getId());
		
		mi.setName(item.getName());
		mi.setDescription(item.getDescription());
		mi.setPrice(item.getPrice());
		
		return mi;
	}

	@Override
	public MenuItem addNewItem(MenuItem item) {
		em.persist(item);
		em.flush();
		return item;
	}

	@Override
	public Boolean removeItem(int id) {
		MenuItem i = em.find(MenuItem.class, id);
		System.out.println(i);
		em.remove(i);

		//		if(em.find(MenuItem.class, id) != null) {
//			System.err.println("Error Removing Item!");
//			return false;
//		} else {
//			return true;
//		}
		return true;
	}

}
