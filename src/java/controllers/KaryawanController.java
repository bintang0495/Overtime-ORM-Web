/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.KaryawanDAO;
import daos.RoleDAO;
import entities.Karyawan;
import entities.Role;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author AINAN
 */
public class KaryawanController {
    
    private final KaryawanDAO kdao;
    private RoleDAO rdao;

    public KaryawanController(SessionFactory factory) {
        this.kdao = new KaryawanDAO(factory);
        this.rdao = new RoleDAO(factory);
    }
    
    public boolean saveOrEdit(String id, String nama, Date tglLahir, Date tglMasuk, String alamat, String gaji, String email, String jenisKelamin, String password, String idRole) {
        Role role = this.rdao.getRoleById(idRole);
        Karyawan karyawan = new Karyawan(new BigDecimal(id), nama, tglLahir, tglMasuk, alamat, new BigInteger(gaji), email, jenisKelamin, password, role);
        return this.kdao.insertOrUpdate(karyawan);
    }
    
    public String getAutoId(){
        Karyawan data = (Karyawan) kdao.getAllByIdSorting("desc").get(0);
        int newId = Integer.parseInt(data.getId().toString())+1;
        return newId+"";
    }
    
 
    public boolean login(String category,String email, String password){
        Karyawan kar = (Karyawan) kdao.search(category, email).get(0);
        return BCrypt.checkpw(password, kar.getPassword());
    }

    public Karyawan getByCategory(String category, String value){
        Karyawan kar = (Karyawan) kdao.search(category, value).get(0);
        return this.kdao.getKaryawanById(kar.getId().toString());
    }
    
    
    
    private List<Karyawan> convertToListKaryawan(List<Object> dataAwal) {
        List<Karyawan> dataKaryawan = new ArrayList<>();
        for (Object object : dataAwal) {
            Karyawan karyawan = (Karyawan)object;
            dataKaryawan.add(karyawan);
        }
        return dataKaryawan;
    }
    
    public List<Karyawan> getAllSort(String category,String sort) {
        return this.convertToListKaryawan(this.kdao.getAllSort(category, sort));
    }

    public List<Karyawan> search(String category, String data) {
        return this.convertToListKaryawan(this.kdao.search(category, data));
    }
    
    public Karyawan getById(String karyawanId){
        return this.kdao.getKaryawanById(karyawanId);
    }
}
