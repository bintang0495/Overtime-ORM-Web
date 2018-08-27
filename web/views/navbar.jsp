<%-- 
    Document   : navbar
    Created on : Aug 13, 2018, 3:19:58 PM
    Author     : BINTANG
--%>

<%@page import="entities.Karyawan"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    KaryawanController kc = new KaryawanController(OTHibernateUtil.getSessionFactory());
    Karyawan dataUser = kc.getById(session.getAttribute("id").toString());
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Fragma", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    

%>
<nav class="navbar navbar-expand static-top" style="background-color: #138496">

    <a class="navbar-brand mr-1" href="home.jsp" style="color:#F7F7F7"><b>Overtime</b></a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <label style="color:#F7F7F7"><strong>Selamat Datang, <%=dataUser.getNama()%></strong> </label>
        </div>
    </form>

    <!-- Navbar -->
    <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
            <i class="fas fa-user-circle fa-fw" ></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="profilUser.jsp">User Profile</a>
            <a class="dropdown-item" href="editPassword.jsp">Edit Password</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="../actionLogout" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
    </li>
</ul>
</nav>