/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.DataOvertimeController;
import controllers.KaryawanController;
import entities.DataOvertime;
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
 * @author AINAN
 */
public class ActionEditOvertime extends HttpServlet {

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
        DataOvertimeController controller = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        String idKaryawan = request.getParameter("id");
        String jenisLembur = request.getParameter("cmbJenisLembur");
        String ket = request.getParameter("txtKeterangan");
        Date date = new Date();

        try (PrintWriter out = response.getWriter()) {
            DataOvertime dataOvertime = controller.searchSortingId("idKaryawan", idKaryawan, "desc").get(0);
            if (new SimpleDateFormat("dd-MM-yyyy").format(dataOvertime.getTgl()).equals(new SimpleDateFormat("dd-MM-yyyy").format(date))) {
                String id = dataOvertime.getId().toString();
                if (controller.saveOrEdit(id, dataOvertime.getTgl(), dataOvertime.getJamMasuk(), dataOvertime.getJamPulang(), ket, dataOvertime.getUpahLembur().toString(), jenisLembur, dataOvertime.getIdKaryawan().getId().toString(), dataOvertime.getIdStatus().getId().toString())) {
                    response.sendRedirect("views/dataKaryawan.jsp");
                }
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
