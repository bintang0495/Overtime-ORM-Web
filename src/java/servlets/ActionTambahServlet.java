/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.KaryawanController;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class ActionTambahServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        KaryawanController kc = new KaryawanController(OTHibernateUtil.getSessionFactory());
        String id = kc.getAutoId();
        String nama = request.getParameter("txtNamaPegawai");
        String role = request.getParameter("cmbRole");
        
        String tglLahir = request.getParameter("txtTglLahir");
        String tglMasuk = request.getParameter("txtTglMasuk");
        String alamat = request.getParameter("txtAlamat");
        String gaji = request.getParameter("txtGaji");
        String email = request.getParameter("txtEmail");
        String jk = request.getParameter("jenisKelamin");
        char[] i = tglLahir.toCharArray();
        String temp="";
        for (int j = 0; j < i.length; j++) {
            if (j < 4) {
                temp = temp+""+i[j];
            }
            if(j>4 && j<7){
                temp = temp+""+i[j];
            }
            if(j>7){
                temp = temp+""+i[j];
            }   
        }
        String salt = BCrypt.gensalt(12);
        String password = BCrypt.hashpw(temp, salt);
        try (PrintWriter out = response.getWriter()) {
            
            DateFormat formatTanggal = new SimpleDateFormat("yyyy-MM-dd");
            Date tanggalLahir = formatTanggal.parse(tglLahir);
            Date tanggalMasuk = formatTanggal.parse(tglMasuk);
            if (kc.saveOrEdit(id, nama, tanggalLahir, tanggalMasuk, alamat, gaji, email, jk, password, role)) {
                response.sendRedirect("views/dataKaryawan.jsp");
            } else {
                out.println("Gagal, kasian deh~");
            }
        } catch (Exception ex) {
            Logger.getLogger(ActionEditKaryawan.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
