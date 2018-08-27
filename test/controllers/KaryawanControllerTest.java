/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Karyawan;
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
public class KaryawanControllerTest {
    
    public KaryawanControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of saveOrEdit method, of class KaryawanController.
     */
    @Test
    public void testSaveOrEdit() {
        System.out.println("saveOrEdit");
        String id = "12";
        String nama = "Muhammad Safarudin";
        Date tglLahir = new Date();
        Date tglMasuk = new Date();
        String alamat = "Samarinda";
        String gaji = "4000";
        String email = "safarudin";
        String jenisKelamin = "L";
        String password = "saafrudin";
        String idRole = "3";
        KaryawanController instance = new KaryawanController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.saveOrEdit(id, nama, tglLahir, tglMasuk, alamat, gaji, email, jenisKelamin, password, idRole);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAutoId method, of class KaryawanController.
     */
    @Test
    public void testGetAutoId() {
        System.out.println("getAutoId");
        KaryawanController instance = null;
        String expResult = "";
        String result = instance.getAutoId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of login method, of class KaryawanController.
     */
    @Test
    public void testLogin() {
        System.out.println("login");
        String category = "email";
        String email = "ainannurr";
        String password = "ainan";
        KaryawanController instance = new KaryawanController(OTHibernateUtil.getSessionFactory());
        boolean expResult = true;
        boolean result = instance.login(category, email, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getByCategory method, of class KaryawanController.
     */
    @Test
    public void testGetByCategory() {
        System.out.println("getByCategory");
        String category = "gaji";
        String value = "5";
        KaryawanController instance = new KaryawanController(OTHibernateUtil.getSessionFactory());
        Karyawan expResult = new Karyawan(new BigDecimal("5"));
        Karyawan result = instance.getByCategory(category, value);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAllSort method, of class KaryawanController.
     */
    @Test
    public void testGetAllSort() {
        System.out.println("getAllSort");
        String category = "";
        String sort = "";
        KaryawanController instance = null;
        List<Karyawan> expResult = null;
        List<Karyawan> result = instance.getAllSort(category, sort);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of search method, of class KaryawanController.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String category = "id";
        String data = "12";
        KaryawanController instance = new KaryawanController(OTHibernateUtil.getSessionFactory());
        List<Karyawan> expResult = new ArrayList<>();
        expResult.add(new Karyawan(new BigDecimal("12")));
        List<Karyawan> result = instance.search(category, data);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getById method, of class KaryawanController.
     */
    @Test
    public void testGetById() {
        System.out.println("getById");
        String karyawanId = "4";
        KaryawanController instance = new KaryawanController(OTHibernateUtil.getSessionFactory());
        Karyawan expResult = new Karyawan(new BigDecimal("4"));
        Karyawan result = instance.getById(karyawanId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
