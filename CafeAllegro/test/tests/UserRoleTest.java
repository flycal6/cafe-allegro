package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.UserRole;

public class UserRoleTest {
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
	  public void test_userRole_mappings() {
	    UserRole userRole = em.find(UserRole.class, 2);
	    assertEquals("customer", userRole.getPermission());
	  
	    
	  }
}
