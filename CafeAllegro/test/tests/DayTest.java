package tests;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Day;

public class DayTest {
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
	  public void test_day_mappings() {
	    Day day = em.find(Day.class, 1);
	    assertEquals(9, day.getMenuItems().size());
	  
	    
	  }
}
