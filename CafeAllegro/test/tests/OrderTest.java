package tests;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Order;

public class OrderTest {
		private EntityManagerFactory emf = null;
		private EntityManager em = null;
		
		 @Before
		  public void setUp() throws Exception {
		    emf = Persistence.createEntityManagerFactory("CafeAllegro");
		    em = emf.createEntityManager();
		  }
		 
		 @After
		  public void tearDown() throws Exception {
		    em.close();
		    emf.close();
		  }
		 @Test
		  public void test_order_mappings() {
		    Order order = em.find(Order.class, 1);
		    assertEquals(1, order.getUser().getOrders().size());
		   // assertEquals("Brian", order.getUser().getFirstName());
		    
		  
		    
		  }
		 
	}

