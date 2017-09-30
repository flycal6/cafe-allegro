package data;

import org.springframework.stereotype.Component;

import entities.MenuItem;

public interface MenuItemDAO {

	public MenuItem adminCreateMenuItem(MenuItem menuItem);
	
	public MenuItem readMenuItem();
	
	public MenuItem adminUpdateMenuItem();
	
	public MenuItem adminDeleteMenuItem();
	
}
