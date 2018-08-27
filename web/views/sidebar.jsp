<%-- 
    Document   : sidebar
    Created on : Aug 23, 2018, 7:07:02 AM
    Author     : BINTANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="sidebar navbar-nav" style="background-color: #48C9D1">
    <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
            <i class="fas fa-fw fa-home"></i>
            <span>Home</span>
        </a>
    </li>
    <% if (!dataUser.getIdRole().getId().equalsIgnoreCase("USR")) {
    %>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown" style="background-color:#75D4E2">
            <a class="dropdown-item" href="dataKaryawan.jsp" style="color:whitesmoke">Data Karyawan</a>

            <a class="dropdown-item" href="dataOvertime.jsp" style="color:whitesmoke">Data Overtime</a>
            
            <a class="dropdown-item" href="dataWaitingApproval.jsp" style="color:whitesmoke">Waiting Approval</a>
            
            
        </div>
    </li>
    <% } else {
            %>
    <li class="nav-item active">
        <a class="nav-link" href="../dataOvertimeViewServlet">
            <i class="fas fa-fw fa-edit"></i>
            <span>Submit Overtime</span>
        </a>
    </li>
    <li class="nav-item active">
        <a class="nav-link" href="dataHistoryOvertime.jsp">
            <i class="fas fa-fw fa-calendar"></i>
            <span>History Overtime</span>
        </a>
    </li>
    <%
        }
    %>
</ul>
