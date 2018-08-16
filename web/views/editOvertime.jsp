<%-- 
    Document   : editOvertime
    Created on : Aug 13, 2018, 1:24:26 PM
    Author     : AINAN
--%>

<%@page import="entities.StatusOvertime"%>
<%@page import="controllers.StatusOvertimeController"%>
<%@page import="entities.JenisLembur"%>
<%@page import="controllers.JenisLemburController"%>
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
        <title>Home</title>
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
        <h1>EDIT DATA OVERTIME</h1>
        <%
            DataOvertimeController doc = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
            DataOvertime dataOvertime = (DataOvertime) session.getAttribute("id");
            String id = session.getAttribute("id").toString();
        %>
        <table border="0">
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>: </td>
                    <td><input type="text" name="txtDetailId" value="<%= dataOvertime.getId()%>" /></td>
                </tr>
                <tr>
                    <td>Nama Karyawan</td>
                    <td>: </td>
                    <td><input type="text" name="txtNamaKaryawan" value="<%= dataOvertime.getIdKaryawan().getNama()%>" /></td>
                </tr>
                <tr>
                    <td>Jenis Lembur</td>
                    <td>: </td>
                    <td><select name="cmbJenisLembur">
                            <%
                                JenisLemburController jlc = new JenisLemburController(OTHibernateUtil.getSessionFactory());

                                for (JenisLembur jl : jlc.getAll()) {
                            %><option value="<%= jl.getIdJenisLembur()%>"><%= jl.getJenisLembur()%></option>           
                            <%    }
                            %>
                        </select></td>
                </tr>
                <tr>
                    <td>Tanggal</td>
                    <td>: </td>
                    <td><input type="text" name="txtTanggal" value="<%= dataOvertime.getTgl()%>" /></td>
                </tr>
                <tr>
                    <td>Jam Masuk</td>
                    <td>: </td>
                    <td><input type="text" name="txtJamMasuk" value="<%= dataOvertime.getJamMasuk()%>" /></td>
                </tr>
                <tr>
                    <td>Jam Keluar</td>
                    <td>: </td>
                    <td><input type="text" name="txtJamKeluar" value="<%= dataOvertime.getJamPulang()%>" /></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>: </td>
                    <td><select name="cmbStatus">
                            <%
                                StatusOvertimeController soc = new StatusOvertimeController(OTHibernateUtil.getSessionFactory());

                                for (StatusOvertime so : soc.getAll()) {
                            %><option value="<%= so.getId()%>"><%= so.getStatus()%></option>           
                            <%    }
                            %>
                        </select></td>
                </tr>
                <tr>
                    <td>Upah Lembur</td>
                    <td>: </td>
                    <td><input type="text" name="txtUpah" value="<%= dataOvertime.getUpahLembur()%>" /></td>
                </tr>
                <tr>
                    <td>Keterangan</td>
                    <td>: </td>
                    <td><input type="text" name="txtKeterangan" value="<%= dataOvertime.getKeterangan()%>" /></td>
                </tr>
            </tbody>
        </table>
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
