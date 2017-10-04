package data;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import cart.Cart;
import entities.MenuItem;

@Repository
public class CartDAOImpl implements CartDAO {

	@Override
	public double addCartPrice(List<MenuItem> cart) {
		double total = 0;
		for (MenuItem item : cart) {
			total += item.getPrice();
		}
		return total;
	}

	@Override
	public List<MenuItem> removeMenuItemById(List<MenuItem> cart, int id) {
		for (MenuItem item : cart) {
			if (item.getId() == id) {
				cart.remove(id);
			}
		}

		return cart;
	}

	@Override
	public double calculateTax(List<MenuItem> cart) {
		double tax = .07;
		double totalTax = 0.0;
		for (MenuItem item : cart) {
			totalTax += (item.getPrice() * tax);
		}
		return totalTax;
	}

	@Override
	public Cart addMenuItemToCart(Cart cart, MenuItem menuItem) {
		List<MenuItem> userCart = cart.getItemsInCart();
		if (cart.getItemsInCart() == null) {
			userCart = new ArrayList<>();
		}
		userCart.add(menuItem);
		cart.setItemsInCart(userCart);
		return cart;
	}

	@Override
	public String addTotalCartPriceWithTax(List<MenuItem> cart) {
		CartDAOImpl userCart = new CartDAOImpl();
		NumberFormat money = new DecimalFormat("#0.00");    
		
		double cartTotal = userCart.addCartPrice(cart) + userCart.calculateTax(cart);
		String convertDoubleToString = money.format(cartTotal);

		return convertDoubleToString;
	}

	@Override
	public Cart createNewCart() {
		Cart newCart = new Cart();
		return newCart;
	}
}
