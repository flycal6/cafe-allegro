package cart;

import java.util.List;

import entities.MenuItem;

public class Cart {

	private List<MenuItem> itemsInCart;
	 
	private int quantity;

	public List<MenuItem> getItemsInCart() {
		return itemsInCart;
	}

	public void setItemsInCart(List<MenuItem> cart) {
		this.itemsInCart = cart;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart cart=" + itemsInCart + ", quantity=" + quantity;
	}
	
	
	
}