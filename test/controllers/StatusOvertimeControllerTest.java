/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.StatusOvertime;
import java.math.BigDecimal;
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
public class StatusOvertimeControllerTest {
    
    public StatusOvertimeControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveOrEdit method, of class StatusOvertimeController.
     */
    @Test
    public void testSaveOrEdit() {
        System.out.println("saveOrEdit");
        String id = "5";
        String status = "Blalalala";
        StatusOvertimeController instance = new StatusOvertimeController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.saveOrEdit(id, status);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAll method, of class StatusOvertimeController.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        StatusOvertimeController instance = null;
        List<StatusOvertime> expResult = null;
        List<StatusOvertime> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of search method, of class StatusOvertimeController.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String category = "id";
        String data = "2";
        StatusOvertimeController instance = new StatusOvertimeController(OTHibernateUtil.getSessionFactory());
        List<StatusOvertime> expResult = new ArrayList<>();
        expResult.add(new StatusOvertime(new BigDecimal("2")));
        List<StatusOvertime> result = instance.search(category, data);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getById method, of class StatusOvertimeController.
     */
    @Test
    public void testGetById() {
        System.out.println("getById");
        String statusId = "2";
        StatusOvertimeController instance = new StatusOvertimeController(OTHibernateUtil.getSessionFactory());
        StatusOvertime expResult = new StatusOvertime(new BigDecimal("2"));
        StatusOvertime result = instance.getById(statusId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
