/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DataOvertimeDAO;
import daos.JenisLemburDAO;
import daos.KaryawanDAO;
import daos.StatusOvertimeDAO;
import entities.DataOvertime;
import entities.JenisLembur;
import entities.Karyawan;
import entities.StatusOvertime;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author AINAN
 */
public class DataOvertimeController {
    
    private final DataOvertimeDAO dodao;
    private final JenisLemburDAO jldao;
    private final KaryawanDAO kdao;
    private final StatusOvertimeDAO sodao;
    
    

    public DataOvertimeController(SessionFactory factory) {
        this.dodao = new DataOvertimeDAO(factory);
        this.jldao = new JenisLemburDAO(factory);
        this.kdao = new KaryawanDAO(factory);
        this.sodao = new StatusOvertimeDAO(factory);
    }
    
    /**
     * 
     * @param id
     * @param tgl
     * @param jamMasuk
     * @param jamPulang
     * @param keterangan
     * @param upahLembur
     * @param idJenisLembur
     * @param idKaryawan
     * @param idStatus
     * @return 
     */
    public boolean saveOrEdit(String id, Date tgl, Date jamMasuk, Date jamPulang, String keterangan, String upahLembur, String idJenisLembur, String idKaryawan, String idStatus) {
        JenisLembur jenisLembur = this.jldao.getJenisLemburById(idJenisLembur);
        Karyawan karyawan = this.kdao.getKaryawanById(idKaryawan);
        StatusOvertime statusOvertime = this.sodao.getStatusById(idStatus);
             
        
        DataOvertime dataOvertime = new DataOvertime(new BigDecimal(id), tgl, jamMasuk, jamPulang, keterangan, new BigInteger(upahLembur), jenisLembur, karyawan, statusOvertime);
        return this.dodao.insertOrUpdate(dataOvertime);
    }
    
    /**
     * 
     * @param dataAwal
     * @return 
     */
    private List<DataOvertime> convertToListDataOvertime(List<Object> dataAwal) {
        List<DataOvertime> dataOvertime = new ArrayList<>();
        for (Object object : dataAwal) {
            DataOvertime dataOvertime1 = (DataOvertime) object;
            dataOvertime.add(dataOvertime1);
        }
        return dataOvertime;
    }
    
    
    /**
     * 
     * @return 
     */
    public String getMaxId(){
        DataOvertime data = (DataOvertime) dodao.getAllByIdSorting("desc").get(0);
        int newId = Integer.parseInt(data.getId().toString())+1;
        return data.getId().toString();
    }
    
    
    public List<DataOvertime> getAllByCategorySorting(String category,String data,String sort){
        return this.convertToListDataOvertime(this.dodao.getAllByCategorySorting(category, data, sort));
    }
    
    /**
     * 
     * @return 
     */
    public String getAutoId(){
        DataOvertime data = (DataOvertime) dodao.getAllByIdSorting("desc").get(0);
        int newId = Integer.parseInt(data.getId().toString())+1;
        return newId+"";
    }
    
    
    
     /**
      * Fungsi ini dibuat untuk mendapatkan nilai row data dengan parameter kategori
     * @param category
     * @param value
     * @return 
      */
     public DataOvertime getByCategory(String category, String value){
        DataOvertime data = (DataOvertime) dodao.search(category, value).get(0);
        return this.dodao.getDataOvertimebById(data.getId().toString());
    }
     
    /**
     * 
     * @return 
     */
    public List<DataOvertime> getAll() {
        return this.convertToListDataOvertime(this.dodao.getAllByIdSorting("asc"));
    }

    /**
     * 
     * @param category
     * @param data
     * @return 
     */
    public List<DataOvertime> search(String category, String data) {
        return this.convertToListDataOvertime(this.dodao.search(category, data));
    }
    
    public List<DataOvertime> searchSortingId(String category,String value, String sort) {
        return this.convertToListDataOvertime(this.dodao.searchSortingId(category,value,sort));
    }
    
    /**
     * 
     * @param overtimeId
     * @return 
     */
    public DataOvertime getById(String overtimeId){
        return this.dodao.getDataOvertimebById(overtimeId);
    }
}
