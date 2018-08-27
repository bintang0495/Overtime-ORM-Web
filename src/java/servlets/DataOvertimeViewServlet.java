/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.DataOvertimeController;
import entities.DataOvertime;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class DataOvertimeViewServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        DataOvertimeController doc = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        Date date = new Date();
        String tgl = new SimpleDateFormat("dd").format(date);
        String bulan = new SimpleDateFormat("MM-yyyy").format(date);
        int jam = Integer.parseInt(new SimpleDateFormat("HH").format(date));

        int paramJatah = 20;
        int paramJamPulang = 17;
        int tempBrgkt;
        int tempPulang;

        if (tgl.equals("01")) {
            paramJatah = 20;
        }
        for (DataOvertime elem : doc.search("idKaryawan", session.getAttribute("id").toString())) {
            if ((elem.getKeterangan() != null) && (new SimpleDateFormat("MM-yyyy").format(elem.getTgl()).equals(bulan))) {
                tempBrgkt = Integer.parseInt(new SimpleDateFormat("HH").format(elem.getJamMasuk()));
                tempPulang = Integer.parseInt(new SimpleDateFormat("HH").format(elem.getJamPulang()));
                if (tempPulang > 21) {
                    tempPulang = 21;
                }
                if (elem.getIdJenisLembur().getIdJenisLembur().toString().equals("1")) {
                    if(tempPulang<=17){
                        paramJatah = paramJatah - 0;
                    }else{
                        paramJatah = paramJatah - (tempPulang - paramJamPulang);
                    }
                } else {
                    paramJatah = paramJatah - (tempPulang - tempBrgkt);
                }
            }
        }
        if (paramJatah <= 0) {
            paramJatah = 0;
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            session.setAttribute("paramJatah", paramJatah);
            response.sendRedirect("views/addOvertime.jsp");
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
