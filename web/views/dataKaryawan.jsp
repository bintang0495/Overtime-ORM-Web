<%-- 
    Document   : dataKaryawan
    Created on : Aug 12, 2018, 10:39:04 PM
    Author     : BINTANG
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Data Karyawan</title>
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><label>Data Karyawan</label></h1>
                </div>
                <div class="container">
                    <div class="row">
                        <main role="main" class="col-lg-12">

                            <form action="../">
                                <div class="col-3 col-sm-2">
                                    <select class="form-control">
                                        <option value="id">ID Karyawan</option>
                                        <option value="nama">Nama Karyawan</option>
                                        <option value="tglLahir">Tanggal Lahir</option>
                                        <option value="tglMasuk">Tanggal Bergabung</option>
                                        <option value="alamat">Alamat</option>
                                        <option value="email">Email</option>
                                        <option value="jenisKelamin">Jenis Kelamin</option>
                                    </select>
                                </div>
                                <div>
                                    <span class="col-6 col-sm-6"><input type="text" class="form-control" name="txtFind" value="" /></span>
                                    <span class="col-3 col-sm-2"> <input type="submit" value="Search" class="form-control" name="btnFind" /></span>
                                        <%  if (dataUser.getIdRole().getId().equalsIgnoreCase("ADM")) { %>
                                    <span class="col-3 col-sm-2"><a href="addKaryawan.jsp" class="btn btn-outline btn-success"/>Tambah Data</a></span>
                                    <%
                                        }
                                    %>
                                </div>
                            </form>
                            <br>

                            <br>
                            <table border="1" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Karyawan</th>
                                        <th>Alamat</th>
                                        <th>Tanggal Lahir</th>
                                        <th>Tanggal Bergabung</th>
                                        <th>Alamat</th>
                                        <th>Email</th>
                                        <th>Jenis Kelamin</th>
                                        <th>Role</th>


                                        <% if (dataUser.getIdRole().getId().equalsIgnoreCase("ADM")) { %>
                                        <th>Aksi</th>
                                            <%
                                                }
                                            %>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Karyawan kar : controller.getAllSort("id", "asc")) {
                                    %>
                                    <tr>

                                        <td><%= kar.getId()%></td>
                                        <td><%= kar.getNama()%></td>
                                        <td><%=kar.getAlamat()%></td>
                                        <td><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir())%></td>
                                        <td><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglMasuk())%></td>
                                        <td><%=kar.getAlamat()%></td>
                                        <td><%=kar.getEmail()%></td>
                                        <td><%=kar.getJenisKelamin()%></td>
                                        <td><%= kar.getIdRole().getNama()%></td>
                                        <% if (dataUser.getIdRole().getId().equalsIgnoreCase("ADM")) {%>
                                        <td>
                                            <span><a class="btn btn-outline btn-success" href="../editKaryawanView?id=<%= kar.getId()%>">Edit</a></span>
                                            <span><a class="btn btn-outline btn-info" href="../detailKaryawanView?id=<%= kar.getId()%>">Detail</a></span>
                                            <span><a class="btn btn-outline btn-danger" href="#">Delete</a></span>
                                        </td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <%
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
<%
    }
%>