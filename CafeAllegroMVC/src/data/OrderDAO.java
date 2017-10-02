package data;

import java.util.List;

import entities.MenuItem;
import entities.Order;

public interface OrderDAO {

	public Order addingItemtoCart(MenuItem item);
	
	public List<Order> viewAllOrders();

	public Order viewOrder(Order order, int id);
	
	public MenuItem getMenuItemById(int id);
	
}
