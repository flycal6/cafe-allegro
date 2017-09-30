package entities;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Menu_Item")
public class MenuItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id; 
	
	private String name;
	
	private double price;
	
	private String description; 
	
	private boolean special;
	
	//THERE IS A RELATIONSHIP BETWEEN MENU_ITEM AND DAY (MANY TO ONE)
	@ManyToOne
	@JoinColumn(name="day_id")
	private Day day; 
	
	//THERE IS A RELATIONSHIP BETWEEN MENU_ITEM AND ORDER_ITEM (ONE TO MANY)
	@OneToMany(mappedBy="menuItem")
	private OrderItem orderItem;
	
	//THERE IS A RELATIONSHIP BETWEEN MENU_ITEM AND MENU
	@ManyToOne
	@JoinColumn(name="menu_id")
	private Menu menu;
	

	//GETTERS AND SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isSpecial() {
		return special;
	}

	public void setSpecial(boolean special) {
		this.special = special;
	}

	public Day getDay() {
		return day;
	}

	public void setDay(Day day) {
		this.day = day;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}


	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "MenuItem id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", special=" + special + ", day=" + day + ", orderItem=" + orderItem + ", menu=" + menu;
	}

	
}
