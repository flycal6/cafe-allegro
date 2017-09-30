package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.MenuItem;

@Repository
@Transactional
public class MenuItemDAOImpl implements MenuItemDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public MenuItem adminCreateMenuItem(MenuItem menuItem) {
		return null;
	}

	@Override
	public MenuItem adminUpdateMenuItem() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MenuItem adminDeleteMenuItem() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuItem> getAllItemsforIndexPage() {
		String query = "SELECT m FROM MenuItem m";

		List<MenuItem> items = em.createQuery(query, MenuItem.class).getResultList();
		return items;
	}

}
