<%-- 
    Document   : footer
    Created on : Aug 23, 2018, 7:11:07 AM
    Author     : BINTANG
--%>

<%@page import="entities.Role"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="controllers.RoleController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="sticky-footer" style="background-color: #35BDD1">
    <div class="container my-auto">
        <div class="copyright text-center my-auto" id="footer-MII">
            <span style="color: whitesmoke"><b>Copyright </b>© Mitra Integrasi Informatika 2018</span>
        </div>
    </div>
</footer>

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
                <a class="btn btn-primary" href="../actionLogout">Logout</a>
            </div>
        </div>
    </div>
</div>
