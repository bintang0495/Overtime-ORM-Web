<%-- 
    Document   : navbar
    Created on : Aug 13, 2018, 3:19:58 PM
    Author     : BINTANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="index.html">
                    <span data-feather="home"></span> Dashboard <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="views/dataKaryawan.jsp"><span data-feather="file"></span>Data Karyawan</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="views/dataOvertime.jsp"><span data-feather="file"></span>Data Overtime</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="views/dataWaitingApproval.jsp"><span data-feather="file"></span>Waiting Approval</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="views/dataHistoryOvertime.jsp"><span data-feather="file"></span>History Overtime</a>
            </li>

        </ul>
    </div>
</nav>
