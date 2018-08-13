<%-- 
    Document   : editKaryawan
    Created on : Aug 13, 2018, 6:26:31 AM
    Author     : BINTANG
--%>

<%@page import="entities.Role"%>
<%@page import="controllers.RoleController"%>
<%@page import="entities.Karyawan"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Karyawan</title>
    </head>
    <body>
        <h1>EDIT DATA KARYAWAN</h1>
        <%
            KaryawanController kc = new KaryawanController(HibernateUtil.getSessionFactory());
            Karyawan karyawan = (Karyawan) session.getAttribute("id");
            String id = session.getAttribute("id").toString();
        %>
        <table border="0">
            <tbody>
                <tr>
                    <td>ID Karyawan</td>
                    <td>: </td>
                    <td><input type="text" name="txtPegawaiId" value="<%= karyawan.getId() %>" /></td>
                </tr>
                <tr>
                    <td>Role</td>
                    <td>: </td>
                    <td><select name="cmbRole">
                            <%
                                RoleController rc = new RoleController(HibernateUtil.getSessionFactory());
                                
                                for (Role role : rc.getAll()) {
                            %><option value="<%= role.getId() %>"><%= role.getNama() %></option>           
                            <%    }
                            %>
                        </select></td>
                </tr>
                <tr>
                    <td>Nama Karyawan</td>
                    <td>: </td>
                    <td><input type="text" name="txtNamaPegawai" value="<%= karyawan.getNama() %>" /></td>
                </tr>
                <tr>
                    <td>Tanggal Lahir</td>
                    <td>: </td>
                    <td><input type="text" name="tglLahir" value="<%= karyawan.getTglLahir() %>" /></td>
                </tr>
                <tr>
                    <td>Tanggal Masuk</td>
                    <td>: </td>
                    <td><input type="text" name="tglMasuk" value="<%= karyawan.getTglMasuk() %>" /></td>
                </tr>
                <tr>
                    <td>Alamat</td>
                    <td>; </td>
                    <td><input type="text" name="alamat" value="<%= karyawan.getAlamat() %>" /></td>
                </tr>
                <tr>
                    <td>Gaji</td>
                    <td>: </td>
                    <td><input type="text" name="gaji" value="<%= karyawan.getGaji() %>" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>: </td>
                    <td><input type="text" name="email" value="<%= karyawan.getEmail() %>" /></td>
                </tr>
                <tr>
                    <td>Jenis Kelamin</td>
                    <td>: </td>
                    <td><input type="text" name="txtJenisKelamin" value="<%= karyawan.getJenisKelamin() %>" /></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
