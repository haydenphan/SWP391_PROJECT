<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">


    <head>
        <%@ include file="../template/head.jsp" %>

        <script src="<c:url value='/js/notifications.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='/css/notifications.css'/>">
        <link href="css/datatables.min.css" rel="stylesheet">
        <style>
            /* Custom styles for the toggle switch */
            .toggle-checkbox:checked {
                right: 0;
                border-color: #f6ad55;
            }

            .toggle-checkbox:checked+.toggle-label {
                background-color: #f6ad55;
            }

            .toggle-label {
                background-color: #cbd5e0;
                position: relative;
            }

            .toggle-label:after {
                content: '';
                position: absolute;
                top: 1px;
                left: 1px;
                width: 22px;
                height: 22px;
                background: #fff;
                border: 2px solid #cbd5e0;
                border-radius: 50%;
                transition: 0.3s;
            }

            .toggle-checkbox:checked+.toggle-label:after {
                transform: translateX(100%);
                border-color: #f6ad55;
            }

            /* Custom styles for the table */
            .table th, .table td {
                vertical-align: middle;
            }

            .table thead th {
                background-color: #f8f9fa;
            }
        </style>
    </head>

    <body class="layout-top-nav light-skin theme-primary fixed">

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>


        <!-- Main content -->
        <div style="height: 100px"></div>
        <div class="container mt-5">
            <h1 style="margin-bottom: 30px" class="text-lg font-semibold my-6">List Leaners</h1>
            <div class="bg-white shadow rounded-lg">
                <table id="learnerList" class="table table-striped">
                    <thead>
                        <tr class="title">
                            <th scope="col">Learner Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Enrolled Date</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cls}" var="ln">
                            <tr>
                                <td>${ln.getUserName()}</td>
                                <td>${ln.getEmail()}</td>
                                <td>${ln.getEnrollmentDate()}</td>
                        <a href="#">View Progress</a>
                        </tr>                                                                      
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer Start -->
        <c:if test="${msg != null}">
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            <a href="">${msg}</a>!!!
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <!-- /.content -->

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <script src="js/datatables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#learnerList').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "responsive": true,
                });
            });
        </script>
    </body>
</html>