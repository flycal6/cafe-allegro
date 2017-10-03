package data;

import java.util.List;

import cart.Cart;
import entities.MenuItem;

public interface CartDAO {

	public double addCartPrice(List<MenuItem> cart);
	
	public double calculateTax(List<MenuItem> cart);
	
	public double addTotalCartPriceWithTax(List<MenuItem> cart);
	
	public Cart addMenuItemToCart(Cart cart, MenuItem menuItem);
	
	public List<MenuItem> removeMenuItemById(List<MenuItem> cart, int id);
	
	public Cart createNewCart();
	
	
}
