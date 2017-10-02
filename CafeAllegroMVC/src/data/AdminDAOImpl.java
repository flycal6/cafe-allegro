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

}
