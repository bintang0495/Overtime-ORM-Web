<%-- 
    Document   : addOvertime
    Created on : Aug 13, 2018, 3:27:47 PM
    Author     : AINAN
--%>

<%@page import="entities.DataOvertime"%>
<%@page import="controllers.DataOvertimeController"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.StatusOvertime"%>
<%@page import="controllers.StatusOvertimeController"%>
<%@page import="entities.JenisLembur"%>
<%@page import="controllers.JenisLemburController"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tambah Data Overtime</title>
        <!-- Bootstrap Core CSS -->
        <link href="../lib/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../lib/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../lib/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../lib/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <% if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } else {
                if (!dataUser.getIdRole().getId().equals("USR")) {
                    response.sendRedirect("home.jsp");
                } else {
        %>
        <div id="page-wrapper">
            <div class="col-lg-12">
                <h1 class="page-header"><label>SUBMIT OVERTIME</label></h1>
            </div>
                <%
                    DataOvertimeController doc = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
                    Date date = new Date();
                    String tgl = new SimpleDateFormat("dd").format(date);
                    String bulan = new SimpleDateFormat("MM").format(date);
                    int jam = Integer.parseInt(new SimpleDateFormat("HH").format(date));

                    int paramJatah=20;
                    int paramJamPulang = 17;
                    int temp;

                    if (tgl.equals("01")) {
                        paramJatah = 20;
                    }else {
                        for (DataOvertime elem : doc.search("idKaryawan", dataUser.getId().toString())) {
                            if ((elem.getKeterangan() != null) && (new SimpleDateFormat("MM").format(elem.getTgl()).equals(bulan))) {
                                temp = Integer.parseInt(new SimpleDateFormat("HH").format(elem.getJamPulang()));
                                if(temp > 21){
                                    temp = 21;
                                }
                                paramJatah = paramJatah - (temp - paramJamPulang);
                            }
                        } 
                    }
                    if (paramJatah <= 0) {
                        paramJatah = 0;
                    }
            %>
            <div class="col-lg-4">
                Jatah overtime : <%=paramJatah %>
            </div>
            <div class="col-lg-12">

                <%
                    if (jam <= 17) {
                %>
                <h2><label>Submit overtime belum dapat dilakukan</label></h2>
                <%
                } else {
                %>
                <form action="../actionEditOvertime" method="GET">
                    <div class="form-group row">
                        <label for="jenislembur" class="col-sm-2 col-form-label">Jenis Lembur</label>
                        <div class="col-sm-4">
                            <select name="cmbJenisLembur" class="form-control" id="jenislembur">
                                <%  JenisLemburController jlc = new JenisLemburController(OTHibernateUtil.getSessionFactory());

                                    for (JenisLembur jl : jlc.getAll()) {
                                %><option value="<%= jl.getIdJenisLembur()%>"><%= jl.getJenisLembur()%></option>           
                                <%    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ket" class="col-sm-2 col-form-label">Keterangan</label>
                        <div class="col-sm-4">
                            <textarea name="txtKeterangan" class="form-control" id="ket"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                    <div class="col-sm-6 text-center">
                        <input type="submit" value="Save" class="btn btn-outline btn-primary" />
                    </div>
                </form>
                <%
                    }
                %>
                <br>
            </div>
        </div>
        <!-- jQuery -->
        <script src="../lib/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../lib/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../lib/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../lib/dist/js/sb-admin-2.js"></script>
    </body>
</html>
<% }
    }%>