<%-- 
    Document   : dataOvertime
    Created on : Aug 13, 2018, 5:34:35 AM
    Author     : BINTANG
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controllers.KaryawanController"%>
<%@page import="entities.DataOvertime"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="controllers.DataOvertimeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Data Overtime</title>
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
            } 
        else {
                if(dataUser.getIdRole().getId().equals("USR")){
                    response.sendRedirect("home.jsp");
                }else{
        %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><label>Data Overtime</label></h1>
                </div>
                <div class="col-lg-12">
                    <div class="row">
                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

                            <%
                                DataOvertimeController overtimeController = new DataOvertimeController(OTHibernateUtil.getSessionFactory());

                            %>
                            <div class="col-3 col-sm-2">
                                <select class="form-control">
                                    <option value="idKaryawan">ID Karyawan</option>
                                    <option value="idStatus">Status</option>
                                </select></div>
                            <div >
                                <span class="col-6 col-sm-6"><input type="text" class="form-control" name="txtFind" value="" /></span>
                                <span class="col-3 col-sm-2"> <input type="submit" value="Search" class="form-control" name="btnFind" /></span>


                            </div>                
                            <br>
                            <br>

                            <table border="1" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama Karyawan</th>
                                        <th>Tanggal Lembur</th>
                                        <th>Jam Berangkat</th>
                                        <th>Jam Pulang</th>
                                        <th>Keterangan</th>
                                        <th>Status</th>
                                        <th>Jenis Lembur</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        
                                        int i = 1;
                                        for (DataOvertime dataOvertime : overtimeController.getAll()) {
                                    %>
                                    <tr>


                                        <td><%= i %></td>
                                        <td><%= dataOvertime.getIdKaryawan().getNama()%></td>
                                        <td><%= new SimpleDateFormat("dd-MM-yyyy").format(dataOvertime.getTgl())%></td>
                                        <td><%= new SimpleDateFormat("HH.mm").format(dataOvertime.getJamMasuk())%></td>
                                        <td><%= new SimpleDateFormat("HH.mm").format(dataOvertime.getJamPulang())%></td>
                                        <td><%=dataOvertime.getKeterangan()%></td>
                                        <td><%=dataOvertime.getIdStatus().getStatus()%></td>
                                        <td><%=dataOvertime.getIdJenisLembur().getJenisLembur()%></td>
                                    </tr>
                                    <% 
                                        i++;
                                    }
                                    %>
                                </tbody>
                            </table>
                        </main>
                    </div>
                </div>
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