package data;

import entities.Order;

public interface OrderDAO {

	public Order customerCreateOrder(Order order);
	
	public Order customerReadOrder();
	
	public Order customerUpdateOrder(int id, Order order);
	
	public Order customerDeleteOrder(int id);
	
	public Order customerCalculateOrder();
	
}
