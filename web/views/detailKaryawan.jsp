<%-- 
    Document   : detailKaryawan
    Created on : Aug 14, 2018, 10:41:04 AM
    Author     : AINAN
--%>

<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Karyawan</title>
    </head>
    <body>
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
        Jenis Kelamin: <%= karyawan.getJenisKelamin() %><br>
        Password: <%= karyawan.getPassword() %><br>
        <br><a href="views/dataKaryawan.jsp">Back</a>
    </body>
</html>
