package entities;

import java.sql.Date;

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
import javax.persistence.Table;

@Entity
@Table(name="Order")
public class Order {
	
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int id; 

private Date time;

//ADD USER_ID RELATIONSHIP
@ManyToOne
@JoinColumn(name="user_id")
private User user;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public Date getTime() {
	return time;
}

public void setTime(Date time) {
	this.time = time;
}

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

@Override
public String toString() {
	return "Order id=" + id + ", time=" + time + ", user=" + user;
}

}
