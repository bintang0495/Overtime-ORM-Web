/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.JenisLembur;
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
public class JenisLemburControllerTest {
    
    public JenisLemburControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveOrEdit method, of class JenisLemburController.
     */
    @Test
    public void testSaveOrEdit() {
        System.out.println("saveOrEdit");
        String id = "6";
        String jenis = "Lembur Bangetnih";
        JenisLemburController instance = new JenisLemburController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.saveOrEdit(id, jenis);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAll method, of class JenisLemburController.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        JenisLemburController instance = null;
        List<JenisLembur> expResult = null;
        List<JenisLembur> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of search method, of class JenisLemburController.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String category = "id";
        String data = "2";
        JenisLemburController instance = new JenisLemburController(OTHibernateUtil.getSessionFactory());
        List<JenisLembur> expResult = new ArrayList<>();
        expResult.add(new JenisLembur(new Short("2")));
        List<JenisLembur> result = instance.search(category, data);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getById method, of class JenisLemburController.
     */
    @Test
    public void testGetById() {
        System.out.println("getById");
        String jenisId = "3";
        JenisLemburController instance = new JenisLemburController(OTHibernateUtil.getSessionFactory());
        JenisLembur expResult = new JenisLembur(new Short("3"));
        JenisLembur result = instance.getById(jenisId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
