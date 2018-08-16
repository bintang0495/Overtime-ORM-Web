/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.KaryawanController;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class ActionEditKaryawan extends HttpServlet {

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
        String id = request.getParameter("txtPegawaiId");
        String role = request.getParameter("cmbRole");
        String nama = request.getParameter("txtNamaPegawai");
        String tglLahir = request.getParameter("txtTglLahir");
        String tglMasuk = request.getParameter("txtTglMasuk");
        String alamat = request.getParameter("txtAlamat");
        String gaji = request.getParameter("txtGaji");
        String email = request.getParameter("txtEmail");
        String jk = request.getParameter("txtJenisKelamin");
        HttpSession session = request.getSession();
        String salt = BCrypt.gensalt(12);
        try (PrintWriter out = response.getWriter()) {
            KaryawanController kc = new KaryawanController(OTHibernateUtil.getSessionFactory());
            SimpleDateFormat formatTanggal = new SimpleDateFormat("MM-dd-yyyy");
            Date tanggalLahir = formatTanggal.parse(tglLahir);
            Date tanggalMasuk = formatTanggal.parse(tglMasuk);
            if (id == "" || id == null
                    || role == "" || role == null
                    || nama == "" || nama == null
                    || tglLahir == "" || tglLahir == null
                    || tglMasuk == "" || tglMasuk == null
                    || alamat == "" || alamat == null
                    || gaji == "" || gaji == null
                    || email == "" || email == null
                    || jk == "" || jk == null) {
                    session.setAttribute("message", "Isikan data terlebih dahulu");
            } else {
                if (kc.saveOrEdit(id, nama, tanggalLahir, tanggalMasuk, alamat, gaji, email, email, BCrypt.hashpw(password, salt), role)) {
                    session.setAttribute("message", "Data berhasil diubah");
                } else {
                    session.setAttribute("message", "Data gagal diubah");
                }
            }ca
            response.sendRedirect("views/editKaryawan");
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
