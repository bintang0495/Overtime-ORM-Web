/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.DataOvertime;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author AINAN
 */
public class DataOvertimeDAO {
    
    private final FunctionDAO fdao;

    public DataOvertimeDAO(SessionFactory factory) {
        this.fdao = new FunctionDAO(factory);
    }
     
    /**
     * Fungsi yang digunakan untuk menambahkan data dari overtime
     * @param dataOvertime
     * @return boolean true/false
     */
    public boolean insertOrUpdate(DataOvertime dataOvertime){
        return this.fdao.insertOrUpdate(dataOvertime);
    }
    
    
    
    /**
     * Fungsi untuk menampilkan nilai sesuai urutan pada id
     * @param sort String
     * @return List
     */
    public List<Object> getAllByIdSorting(String sort){
        return this.fdao.get("FROM DataOvertime WHERE keterangan IS NOT NULL AND jamPulang IS NOT NULL ORDER BY id "+sort);
    }
    
    /**
     * Fungsi untuk menampilkan data berdasarkan kategori yang akan disorting
     * @param category String
     * @param data String
     * @param sort String
     * @return List
     */
    public List<Object> getAllByCategorySorting(String category, String data, String sort){
        return this.fdao.get("FROM DataOvertime WHERE "+category+" = "+data+" AND jamPulang IS NOT NULL ORDER BY id "+sort);
    }
    
    
    
    
    
    
    
    /**
     * 
     * @param category
     * @param data
     * @return 
     */
    public List<Object> search(String category, String data){
        return  this.fdao.get("FROM DataOvertime WHERE "+category+ " LIKE '%" +data+ "%' AND jamPulang IS NOT NULL ORDER BY id");
    }
    
    public List<Object> searchSortingId(String categorysearch,String searchvalue, String sort){
        return  this.fdao.get("FROM DataOvertime WHERE " +categorysearch+ " LIKE '%" +searchvalue+ "%' ORDER BY id "+sort);
    }
    
    
    
    
    /**
     * Fungsi yang digunakan untuk mendapatkan data overtime berdasarkan Id
     * @param dataId String
     * @return DataOvertime
     */
    public DataOvertime getDataOvertimebById(String dataId){
        return (DataOvertime) this.fdao.getById("FROM DataOvertime WHERE id ='" +dataId+ "'");
    }
}
