package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Menu;

public class MenuTest {
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
		  public void test_menu_mappings() {
		    Menu menu = em.find(Menu.class, 1);
		    assertEquals(0, menu.getMenuItems().size());
		    //assertEquals(" ", menu.getMenuItems().get(1).getName());
		    //assertEquals("Croissant Breakfast" , menu.getMenuItems().get(0).getName());
		  
		    
		  }
		 
		 //add menu item
	}

