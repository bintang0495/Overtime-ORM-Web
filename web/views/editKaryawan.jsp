<%-- 
    Document   : editKaryawan
    Created on : Aug 13, 2018, 6:26:31 AM
    Author     : BINTANG
--%>

<%@page import="tools.OTHibernateUtil"%>
<%@page import="entities.Role"%>
<%@page import="controllers.RoleController"%>
<%@page import="entities.Karyawan"%>
<%@page import="controllers.KaryawanController"%>
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
        <div id="page-wrapper">
            <h1>EDIT DATA KARYAWAN</h1>
            <%            Karyawan karyawan = (Karyawan) session.getAttribute("id_editKaryawan");
                String id = session.getAttribute("id_editKaryawan").toString();
            %>
            <form action="actionEditKaryawan" method="GET">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID Karyawan</td>
                            <td>: </td>
                            <td><input type="text" readonly name="txtPegawaiId" value="<%= karyawan.getId()%>" /></td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>: </td>
                            <td><input type="text" name="txtRole" id="role" list="rolelist"  />
                                <datalist>
                                    <%
                                        RoleController rc = new RoleController(OTHibernateUtil.getSessionFactory());

                                        for (Role role : rc.getAll()) {
                                    %><option value="<%= role.getNama()%>">         
                                        <%    }
                                        %>
                                </datalist></td>
                        </tr>
                        <tr>
                            <td>Nama Karyawan</td>
                            <td>: </td>
                            <td><input type="text" name="txtNamaPegawai" value="<%= karyawan.getNama()%>" /></td>
                        </tr>
                        <tr>
                            <td>Tanggal Lahir</td>
                            <td>: </td>
                            <td><input type="date" name="txtTglLahir" value="<%= karyawan.getTglLahir()%>" /></td>
                        </tr>
                        <tr>
                            <td>Tanggal Masuk</td>
                            <td>: </td>
                            <td><input type="date" name="txtTglMasuk" value="<%= karyawan.getTglMasuk()%>" /></td>
                        </tr>
                        <tr>
                            <td>Alamat</td>
                            <td>; </td>
                            <td><input type="text" name="txtAlamat" value="<%= karyawan.getAlamat()%>" /></td>
                        </tr>
                        <tr>
                            <td>Gaji</td>
                            <td>: </td>
                            <td><input type="text" name="txtGaji" value="<%= karyawan.getGaji()%>" /></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>: </td>
                            <td><input type="text" name="txtEmail" value="<%= karyawan.getEmail()%>" /></td>
                        </tr>
                        <tr>
                            <td>Jenis Kelamin</td>
                            <td>: </td>
                            <td><input type="text" name="txtJenisKelamin" value="<%= karyawan.getJenisKelamin()%>" /></td>
                        </tr>

                        <tr>
                            <td colspan="3"><input type="submit" value="Save" /></td>
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
