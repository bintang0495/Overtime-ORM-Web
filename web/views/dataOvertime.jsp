<%-- 
    Document   : dataOvertime
    Created on : Aug 13, 2018, 5:34:35 AM
    Author     : BINTANG
--%>

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

        <div class="container-fluid" id="page-wrapper">
            <div class="row">
                
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

                    <%
                        DataOvertimeController overtimeController = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
                    %>
                    <h1>Karyawan</h1>
                    <select name="cmbCategory">
                    </select>
                    <input type="text" name="txtFind" value="" />
                    <input type="submit" value="Find" name="btnFind" />

                    <table border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama Karyawan</th>
                                <th>Tanggal Lembur</th>
                                <th>Jam Berangkat</th>
                                <th>Jam Pulang</th>
                                <th>Keterangan</th>
                                <th>Status</th>
                                <th>Jenis Lembur</th>
                                <th>Upah Lembur</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (DataOvertime dataOvertime : overtimeController.getAll()) {
                            %>
                            <tr>
                                <td><%= dataOvertime.getId()%></td>
                                <td><%= dataOvertime.getIdKaryawan().getNama()%></td>
                                <td><%= dataOvertime.getJamMasuk()%></td>
                                <td><%=dataOvertime.getJamPulang()%></td>
                                <td><%=dataOvertime.getKeterangan()%></td>
                                <td><%=dataOvertime.getIdStatus().getStatus()%></td>
                                <td><%=dataOvertime.getIdJenisLembur().getJenisLembur()%></td>
                                <td><%=dataOvertime.getUpahLembur()%></td>
                                <td><a href="#">Edit</a></td>
                            </tr>
                            <%

                                }
                            %>
                        </tbody>
                    </table>
                    <div class="text-center"> <a class="btn btn-outline-success " href="#">Tambah</a> </div>
                </main>
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
