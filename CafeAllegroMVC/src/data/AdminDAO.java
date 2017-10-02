package data;

import entities.MenuItem;

public interface AdminDAO {

	public MenuItem adminUpdateMenuItem(MenuItem item);
	
	public MenuItem addNewItem(MenuItem item);

	public Boolean removeItem(int id);
}
