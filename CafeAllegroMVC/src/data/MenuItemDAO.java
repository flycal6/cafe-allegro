package data;

import java.util.List;

import entities.MenuItem;

public interface MenuItemDAO {
	
	public List<MenuItem> getAllItemsforIndexPage();

	public void adminDeleteMenuItem(int id);

	public void sendToCart(MenuItem item);
	
}
