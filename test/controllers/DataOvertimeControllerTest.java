/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.DataOvertime;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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
public class DataOvertimeControllerTest {
    
    public DataOvertimeControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveOrEdit method, of class DataOvertimeController.
     */
    @Test
    public void testSaveOrEdit() {
        System.out.println("saveOrEdit");
        String id = "25";
        Date tgl = new Date();
        Date jamMasuk = new Date();
        Date jamPulang = new Date();
        String keterangan = "CRUD DONGS";
        String upahLembur = "0";
        String idJenisLembur = "1";
        String idKaryawan = "3";
        String idStatus = "1";
        DataOvertimeController instance = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.saveOrEdit(id, tgl, jamMasuk, jamPulang, keterangan, upahLembur, idJenisLembur, idKaryawan, idStatus);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getMaxId method, of class DataOvertimeController.
     */
    @Test
    public void testGetMaxId() {
        System.out.println("getMaxId");
        DataOvertimeController instance = null;
        String expResult = "";
        String result = instance.getMaxId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllByCategorySorting method, of class DataOvertimeController.
     */
    @Test
    public void testGetAllByCategorySorting() {
        System.out.println("getAllByCategorySorting");
        String category = "";
        String data = "";
        String sort = "";
        DataOvertimeController instance = null;
        List<DataOvertime> expResult = null;
        List<DataOvertime> result = instance.getAllByCategorySorting(category, data, sort);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAutoId method, of class DataOvertimeController.
     */
    @Test
    public void testGetAutoId() {
        System.out.println("getAutoId");
        DataOvertimeController instance = null;
        String expResult = "";
        String result = instance.getAutoId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getByCategory method, of class DataOvertimeController.
     */
    @Test
    public void testGetByCategory() {
        System.out.println("getByCategory");
        String category = "keterangan";
        String value = "u";
        DataOvertimeController instance = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        DataOvertime expResult = new DataOvertime(new BigDecimal("u"));
        DataOvertime result = instance.getByCategory(category, value);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAll method, of class DataOvertimeController.
     */
    @Test
    public void testGetAll() {
        System.out.println("getAll");
        DataOvertimeController instance = null;
        List<DataOvertime> expResult = null;
        List<DataOvertime> result = instance.getAll();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of search method, of class DataOvertimeController.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String category = "id";
        String data = "8";
        DataOvertimeController instance = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        List<DataOvertime> expResult = new ArrayList<>();
        expResult.add(new DataOvertime(new BigDecimal("8")));
        List<DataOvertime> result = instance.search(category, data);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of searchSortingId method, of class DataOvertimeController.
     */
    @Test
    public void testSearchSortingId() {
        System.out.println("searchSortingId");
        String category = "";
        String value = "";
        String sort = "";
        DataOvertimeController instance = null;
        List<DataOvertime> expResult = null;
        List<DataOvertime> result = instance.searchSortingId(category, value, sort);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getById method, of class DataOvertimeController.
     */
    @Test
    public void testGetById() {
        System.out.println("getById");
        String overtimeId = "1";
        DataOvertimeController instance = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        DataOvertime expResult = new DataOvertime(new BigDecimal("1"));
        DataOvertime result = instance.getById(overtimeId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
