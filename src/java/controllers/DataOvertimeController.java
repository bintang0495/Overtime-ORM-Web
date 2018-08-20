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
    
    public boolean saveOrEdit(String id, Date tgl, Date jamMasuk, Date jamPulang, String keterangan, String upahLembur, String idJenisLembur, String idKaryawan, String idStatus) {
        JenisLembur jenisLembur = this.jldao.getJenisLemburById(idJenisLembur);
        Karyawan karyawan = this.kdao.getKaryawanById(idKaryawan);
        StatusOvertime statusOvertime = this.sodao.getStatusById(idStatus);
             
        
        DataOvertime dataOvertime = new DataOvertime(new BigDecimal(id), tgl, jamMasuk, jamPulang, keterangan, new BigInteger(upahLembur), jenisLembur, karyawan, statusOvertime);
        return this.dodao.insertOrUpdate(dataOvertime);
    }

    private List<DataOvertime> convertToListJob(List<Object> dataAwal) {
        List<DataOvertime> dataOvertime = new ArrayList<>();
        for (Object object : dataAwal) {
            DataOvertime dataOvertime1 = (DataOvertime) object;
            dataOvertime.add(dataOvertime1);
        }
        return dataOvertime;
    }
    
    public String getAutoId(){
        DataOvertime data = (DataOvertime) dodao.getAllByIdSorting("desc").get(0);
        int newId = Integer.parseInt(data.getId().toString())+1;
        return newId+"";
    }
    
    public List<DataOvertime> getAll() {
        return this.convertToListJob(this.dodao.getAll());
    }

    public List<DataOvertime> search(String category, String data) {
        return this.convertToListJob(this.dodao.search(category, data));
    }
    
    public DataOvertime getById(String overtimeId){
        return this.dodao.getDataOvertimebById(overtimeId);
    }
}
