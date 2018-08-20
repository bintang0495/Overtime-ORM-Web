<%-- 
    Document   : navbar
    Created on : Aug 13, 2018, 3:19:58 PM
    Author     : BINTANG
--%>

<%@page import="entities.Karyawan"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% KaryawanController controller = new KaryawanController(OTHibernateUtil.getSessionFactory());
    Karyawan dataUser = controller.getById(session.getAttribute("id").toString());
%>
<!DOCTYPE html>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-brand" href="home.jsp"><label>Overtime</label></a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <br>
        <span><label>Selamat Datang, <%=dataUser.getNama()%> </label></span>
        <span>
            <li class="dropdown open">

                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="profilUser.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="editPassword.jsp"><i class="fa fa-gear fa-fw"></i> Edit Password</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="../actionLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
        </span>
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="home.jsp"><i class="fa fa-university fa-fw"></i>Home</a>
                </li>
                <% if (!dataUser.getIdRole().getId().equalsIgnoreCase("USR")) {
                %>
                <li>
                    <a href="#"><i class="fa fa-table fa-fw"></i>Tables<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">

                        <li>
                            <a href="dataKaryawan.jsp">Data Karyawan</a>
                        </li>
                        
                        <li>
                            <a href="dataOvertime.jsp">Data Overtime</a>
                        </li>
                        
                        <li>
                            <a href="dataWaitingApproval.jsp">Waiting Approval</a>
                        </li>
                        
                        
                    </ul>
                </li>
                <% } else {%>
                <li>
                    <a href="addOvertime.jsp"><i class="fa fa-edit fa-fw"></i>Submit Overtime</a>
                </li>
                <li>
                    <a href="dataHistoryOvertime.jsp"><i class="fa fa-calendar fa-fw"></i>History Overtime</a>
                </li>
                <% }%>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
