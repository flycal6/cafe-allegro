package data;

import entities.MenuItem;
import entities.Order;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public Order addingItemtoCart(MenuItem item) {
		Order order = new Order();
		ArrayList<MenuItem> cart = new ArrayList<>();
		cart.add(item);
		order.setMenuItems(cart);
		
		return order;
	}

	@Override
	public Order viewOrder(Order order, int id) {
		em.find(Order.class, id);
		System.out.println("Order " + order);
		em.close();
		return order;
	}

	@Override
	public List<Order> viewAllOrders() {
		String query = "SELECT o FROM Order o";
		
		List<Order> order =em.createQuery(query, Order.class).getResultList();
		return order;
	}

	@Override
	public Order getOrderById(int id) {
		MenuItem itemById = em.find(MenuItem.class, id);
		List<MenuItem> items = new ArrayList<>();
		items.add(itemById);
		Order order = new Order();
		order.setMenuItems(items);
		return order;
				
	}

	//ONCE FINALIZED CART IS ENTERED INTO ORDER
	//GET IT OUT OF THE SESSION 
}
	