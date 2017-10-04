package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.MenuItem;

@Repository
@Transactional
public class MenuItemDAOImpl implements MenuItemDAO {
	private List<MenuItem> menuItems = new ArrayList<>();
	
	@PersistenceContext
	EntityManager em;


	@Override
	public void adminDeleteMenuItem(int id) {
		MenuItem item = null;
		for (MenuItem menuItem : menuItems) {
			if (menuItem.getId() == id) {
				item = menuItem;
				break;
			}
		}
		menuItems.remove(item.getId());
	}

	@Override
	public List<MenuItem> getAllItemsforIndexPage() {
		String query = "SELECT m FROM MenuItem m";

		List<MenuItem> items = em.createQuery(query, MenuItem.class).getResultList();
		return items;
	}

	@Override
	public void sendToCart(MenuItem item) {
		// TODO Auto-generated method stub
		
	}
	

}
