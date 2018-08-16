<%-- 
    Document   : detailKaryawan
    Created on : Aug 14, 2018, 10:41:04 AM
    Author     : AINAN
--%>

<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("id_karyawan") == null) {
        response.sendRedirect("login.jsp");
    } else { %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detail Karyawan</title>
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
        <div id="page-wrapper">
        <h3>Detail Employee:</h3>
        <%  Karyawan karyawan = (Karyawan)session.getAttribute("id"); %><br>
        Karyawan ID: <%= karyawan.getId() %><br>
        Role: <%= karyawan.getIdRole().getNama() %><br>
        Nama Karyawan: <%= karyawan.getNama() %><br>
        Tanggal Lahir: <%= karyawan.getTglLahir() %><br>
        Tanggal Bergabung: <%= karyawan.getTglMasuk() %><br>
        Alamat: <%= karyawan.getAlamat() %><br>
        Email: <%= karyawan.getEmail() %><br>
        Gaji: <%= karyawan.getGaji() %><br>
        Jenis Kelamin: <% if(karyawan.getJenisKelamin()=="P"){
            out.println("Perempuan");
        }else{ out.println("Laki-laki");} %><br>
        <br><a href="views/dataKaryawan.jsp">Back</a>
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
<% } %>