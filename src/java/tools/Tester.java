/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.DataOvertimeController;
import controllers.KaryawanController;
import entities.DataOvertime;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.tomcat.util.codec.binary.StringUtils;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author BINTANG
 */
public class Tester {

    private static int workload = 12;

    public static String hashPassword(String password_plaintext) {
        String salt = BCrypt.gensalt(workload);
        String hashed_password = BCrypt.hashpw(password_plaintext, salt);

        return (hashed_password);
    }

    public static void checkPass(String plainPassword, String hashedPassword) {
        if (BCrypt.checkpw(plainPassword, hashedPassword)) {
            System.out.println("The password matches.");
        } else {
            System.out.println("The password does not match.");
        }
    }

    public static void main(String[] args) {
//        System.out.println(OTHibernateUtil.getSessionFactory());
        DataOvertimeController controller = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        Date date = new Date();
        
//        DataOvertime dataOvertime = controller.search("id", "2").get(0);
//            int gaji,upah;
//            upah = 0;
//            gaji = Integer.parseInt(dataOvertime.getIdKaryawan().getGaji().toString());
//            upah =(int) (gaji * (0.01));
//            String id = dataOvertime.getId().toString();
//            Date tglMasuk = dataOvertime.getTgl(); 
//            Date jamMasuk = dataOvertime.getJamMasuk();
//            Date jamPulang = dataOvertime.getJamPulang();
//            String ket = dataOvertime.getKeterangan();
//            String upahh = upah+""; 
//            String jenisLembur = dataOvertime.getIdJenisLembur().getIdJenisLembur().toString(); 
//            String karyawanId = dataOvertime.getIdKaryawan().getId().toString();
//            String status = "2";
            DataOvertime dataOvertime = controller.search("id", "4").get(0);
            int paramJamPlgKantor = 17;

            int gaji, upah;
            upah = 0;
            gaji = Integer.parseInt(dataOvertime.getIdKaryawan().getGaji().toString());
            upah = (int) (gaji * (0.01));
            String idOT = dataOvertime.getId().toString();
            Date tglMasuk = dataOvertime.getTgl();
            Date jamMasuk = dataOvertime.getJamMasuk();
            Date jamPulang = dataOvertime.getJamPulang();
            int jamPlg = Integer.parseInt(new SimpleDateFormat("HH").format(jamPulang));
            if (jamPlg >= 21) {
                jamPlg = 21;
            }
            String ket = dataOvertime.getKeterangan();
            upah = upah * (jamPlg - paramJamPlgKantor);
            String upahh = upah + "";
            String jenisLembur = dataOvertime.getIdJenisLembur().getIdJenisLembur().toString();
            String karyawanId = dataOvertime.getIdKaryawan().getId().toString();
            String status = "2";
            if (controller.saveOrEdit(idOT, tglMasuk, jamMasuk, jamPulang, ket, upahh, jenisLembur, karyawanId, status)) {
                System.out.println("Berhaasil");
            } else {
                System.out.println("Gagal");
            }
        System.out.println(idOT);
        System.out.println(tglMasuk);
        System.out.println(jamMasuk);
        System.out.println(jamPulang);
        System.out.println(ket);
        System.out.println(upahh);
        System.out.println(jenisLembur);
        System.out.println(karyawanId);
        System.out.println(status);
        
        Date d = null;
//        if(new SimpleDateFormat("dd-MM-yyyy").format(controller.getById("2").getJamMasuk()) == null){
//            System.out.println("Tidak bisa bod");
//        }

        
        if(new SimpleDateFormat("dd-MM-yyyy").format(controller.getById("1").getJamMasuk()).equals(new SimpleDateFormat("dd-MM-yyyy").format(date))){
            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(controller.getById("1").getJamMasuk()));
            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(date));
        }else{
            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(controller.getById("1").getJamMasuk()));
            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(date));
        }

//        controller.saveOrEdit("1", date, date, date, "Mengerjakan fungsi add dan edit karyawan", "1000", "1", "3", "1");
//        for (DataOvertime dataOvertime : controller.getAll()) {
//            System.out.println(dataOvertime.getId()+" - "+dataOvertime.getIdKaryawan().getNama()+" melakukan "+dataOvertime.getKeterangan());
//        }
//        DataOvertime dataOvertime = controller.search2("idKaryawan", controller.getById("1").getIdKaryawan().getId().toString(), "tgl", new SimpleDateFormat("yyyy-mm-dd").format(controller.getById("1").getTgl())).get(0);
//        System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(controller.getById("1").getTgl()));
        
//        String password1 = "dayinta";
//        String password2 = "admin";
//        String password3 = "bintang";
//        String password4 = "dinahamidah";
//        Date date = new Date();
//        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
//        DateFormat jam = new SimpleDateFormat("HH:mm:ss");
//        String dateString = dateFormat.format(date);
//        String jamString = jam.format(date);
//        System.out.println("ChiperPassword dari Dayinta = " + hashPassword(password1));
//
//        System.out.println("ChiperPassword dari Admin = " + hashPassword(password2));
//
//        System.out.println("ChiperPassword dari Bintang = " + hashPassword(password3));
//        System.out.println("ChiperPassword dari Dina = " + hashPassword(password4));
//        System.out.println("Sekarang tangggal = " + dateString);
//        System.out.println("Sekarang jam = " + jamString);
//        checkPass("bintangkecil", hashPassword("bintangkecil"));
    }

}
