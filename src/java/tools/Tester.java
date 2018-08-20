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
        String id = controller.getById("1").getId().toString();
        if(id.isEmpty()){
            System.out.println("Kamu kurang berdoa");
        }else{
            System.out.println("Kamu harus berdoa");
        }
//        controller.saveOrEdit("1", date, date, date, "Mengerjakan fungsi add dan edit karyawan", "1000", "1", "3", "1");
//        System.out.println("1+1 = "+2);
        
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
