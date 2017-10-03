package data;

import java.util.List;

import cart.Cart;
import entities.Order;
import entities.User;

public interface OrderDAO {

	public Order archiveCart(User user, Cart cart);
}
