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

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Data Karyawan</title>

        <!-- Bootstrap core CSS-->
        <link href="../library/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="../library/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="../library/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../library/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="style.css">

    </style>
</head>   
<body id="page-top">
    <%@include file="navbar.jsp" %>
    <div id="wrapper">
        <%            
            if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } else {
                if (kc.getById(session.getAttribute("id").toString()).getIdRole().getId().equals("USR")) {
                    response.sendRedirect("home.jsp");
                } else {
        %>
        <%@include file="sidebar.jsp" %>
        <div id="content-wrapper">
            <div class="container-fluid">


                <div class="col-lg-12">
                    <h1 class="page-header"><label>TABEL DATA KARYAWAN</label></h1>
                    
                </div>
                <div class="col-lg-12 text-center">
                    <label><%if (session.getAttribute("msg") != null) {
                            out.println(session.getAttribute("msg"));
                            session.setAttribute("msg", " ");
                        } %></label>

                </div>
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Data Karyawan</div>
                        <% if (dataUser.getIdRole().getId().equalsIgnoreCase("ADM")) { %>
                    <div id="tmbKar"><a href="addKaryawan.jsp" class="btn btn-success">Tambah</a></div>
                    <div> .</div>
                    <%
                        }
                    %>
                    <div class="card-body">

                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

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
                                        for (Karyawan kar : kc.getAllSort("id", "asc")) {
                                    %>
                                    <tr>

                                        <td><%= kar.getId()%></td>
                                        <td><%= kar.getNama()%></td>
                                        <td><%=kar.getAlamat()%></td>
                                        <td class="text-center"><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir())%></td>
                                        <td class="text-center"><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglMasuk())%></td>
                                        <td><%=kar.getAlamat()%></td>
                                        <td><%=kar.getEmail()%></td>
                                        <td class="text-center"><%=kar.getJenisKelamin()%></td>
                                        <td><%= kar.getIdRole().getNama()%></td>
                                        <% if (dataUser.getIdRole().getId().equalsIgnoreCase("ADM")) {%>
                                        <td>
                                            <span><a class="btn btn-outline-success" href="../editKaryawanView?id=<%= kar.getId()%>">Edit</a></span>
                                            <span><a class="btn btn-outline-info" href="../detailKaryawanView?id=<%= kar.getId()%>">Detail</a></span>
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
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
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
<%
        }
    }
%>