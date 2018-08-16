<%-- 
    Document   : addKaryawan
    Created on : Aug 13, 2018, 3:09:31 PM
    Author     : AINAN
--%>

<%@page import="tools.OTHibernateUtil"%>
<%@page import="entities.Role"%>
<%@page import="controllers.RoleController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tambah Data Karyawan</title>
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
            <form action="actionTambahServlet" method="POST">
                <h1>TAMBAH DATA KARYAWAN</h1>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID Karyawan</td>
                            <td>: </td>
                            <td><input type="text" name="txtPegawaiId" /></td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>: </td>
                            <td><select name="cmbRole">
                                    <%                                    RoleController rc = new RoleController(OTHibernateUtil.getSessionFactory());

                                        for (Role role : rc.getAll()) {
                                    %><option value="<%= role.getId()%>"><%= role.getNama()%></option>           
                                    <%    }
                                    %>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Nama Karyawan</td>
                            <td>: </td>
                            <td><input type="text" name="txtNamaPegawai"/></td>
                        </tr>
                        <tr>
                            <td>Tanggal Lahir</td>
                            <td>: </td>
                            <td><input type="text" name="tglLahir" /></td>
                        </tr>
                        <tr>
                            <td>Tanggal Masuk</td>
                            <td>: </td>
                            <td><input type="text" name="tglMasuk" /></td>
                        </tr>
                        <tr>
                            <td>Alamat</td>
                            <td>; </td>
                            <td><input type="text" name="alamat" /></td>
                        </tr>
                        <tr>
                            <td>Gaji</td>
                            <td>: </td>
                            <td><input type="text" name="gaji" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>: </td>
                            <td><input type="text" name="email" /></td>
                        </tr>
                        <tr>
                            <td>Jenis Kelamin</td>
                            <td>: </td>
                            <td><input type="text" name="txtJenisKelamin"/></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>: </td>
                            <td><input type="text" name="txtPassword"/></td>
                        </tr>
                        <tr>
                    <input type="submit" value="Save" />
                    </tr>
                    </tbody>
                </table>
            </form>
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
