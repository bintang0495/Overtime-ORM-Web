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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Submit Overtime</title>
        <!-- Bootstrap core CSS-->
        <link href="../library/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="../library/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="../library/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../library/css/sb-admin.css" rel="stylesheet">


        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body id="page-top">
        <%@include file="navbar.jsp" %>
        <%            if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } else {
                if (!dataUser.getIdRole().getId().equals("USR")) {
                    response.sendRedirect("home.jsp");
                } else {
        %>
        <div id="wrapper">
            <%@include file="sidebar.jsp" %>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="col-lg-12" id="header-home">
                        <h1><b>TAMBAH DATA KARYAWAN</b></h1>
                    </div>
                    <div class="col-lg-12" id="">
                        <%                    
                            int paramJatah = Integer.parseInt(session.getAttribute("paramJatah").toString());
                        %>
                        <div class="col-lg-4">
                            <label>Jatah overtime : <%=paramJatah%> </label>
                        </div>
                        <div class="col-lg-12">

                            <%
                                if (paramJatah == 0) {
                            %>
                            <h2><label>Submit overtime tidak dapat dilakukan</label></h2>
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
                                        <textarea name="txtKeterangan" class="form-control" id="ket" ></textarea>
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                                <div class="col-sm-6 text-center">
                                    <input type="submit" value="Save" class="btn btn-outline btn-primary" />
                                </div>
                                <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                                <div class="col-sm-6 text-center">
                                    <p>
                                        <%
                                            if (session.getAttribute("msg") != null) {
                                                out.print(session.getAttribute("msg"));
                                            }
                                            session.setAttribute("msg", " ");
                                        %>
                                    </p>
                                </div>
                            </form>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%@include file="footer.jsp" %>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../library/vendor/jquery/jquery.min.js"></script>
        <script src="../library/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../library/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="../library/vendor/chart.js/Chart.min.js"></script>
        <script src="../library/vendor/datatables/jquery.dataTables.js"></script>
        <script src="../library/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../library/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="../library/js/demo/datatables-demo.js"></script>
        <script src="../library/js/demo/chart-area-demo.js"></script>
    </body>
</html>
<% }
    }%>