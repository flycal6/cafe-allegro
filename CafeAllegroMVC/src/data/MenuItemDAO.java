package data;

import java.util.List;

import entities.MenuItem;

public interface MenuItemDAO {
	
	public List<MenuItem> getAllItemsforIndexPage();

	public MenuItem adminCreateMenuItem(MenuItem menuItem);
	
	public void adminDeleteMenuItem(int id);
	
}
