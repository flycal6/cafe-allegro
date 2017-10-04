package data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cart.Cart;
import entities.MenuItem;
import entities.Order;
import entities.User;

@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {

	@PersistenceContext
	EntityManager em;

	@Override
	public Order archiveCart(User user, Cart cart) {
		List<MenuItem> compileOrder = cart.getItemsInCart();
		Order order = new Order();
		order.setTime(new Date());
		order.setUser(em.find(User.class, user.getId()));
		order.setMenuItems(compileOrder);
		if (user.getOrders() == null) {
			List<Order> orderList = new ArrayList<>();
			user.setOrders(orderList);
		}
		List<Order> orders = user.getOrders();
		orders.add(order);
		user.setOrders(orders);
		em.persist(order);
		em.flush();

		return order;
	}

	// ONCE FINALIZED CART IS ENTERED INTO ORDER
	// GET IT OUT OF THE SESSION
}
