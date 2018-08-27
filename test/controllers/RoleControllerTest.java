/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Role;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class RoleControllerTest {
    
    public RoleControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveOrEdit method, of class RoleController.
     */
    @Test
    public void testSaveOrEdit() {
        System.out.println("saveOrEdit");
        String id = "4";
        String nama = "KRY";
        RoleController instance = new RoleController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.saveOrEdit(id, nama);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAll method, of class RoleController.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        RoleController instance = null;
        List<Role> expResult = null;
        List<Role> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of search method, of class RoleController.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String category = "id";
        String data = "USR";
        RoleController instance = new RoleController(OTHibernateUtil.getSessionFactory());
        List<Role> expResult = new ArrayList<>();
        expResult.add(new Role("USR"));
        List<Role> result = instance.search(category, data);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getById method, of class RoleController.
     */
    @Test
    public void testGetById() {
        System.out.println("getById");
        String roleId = "ADM";
        RoleController instance = new RoleController(OTHibernateUtil.getSessionFactory());
        Role expResult = new Role("ADM");
        Role result = instance.getById(roleId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
