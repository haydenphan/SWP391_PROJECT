<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html class="no-js" lang="zxx">
    <%
        // String userName = (String)request.getAttribute("UserName");
        User user = (User) session.getAttribute("user");
        int role = (user != null) ? user.getRole() : 0;
    %>

    <head>
        <%-- HEAD --%>

        <!-- Vendors Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/vendors_css.css">

        <!-- Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/horizontal-menu.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/skin_color.css">
        <%@ include file="../template/head.jsp" %>

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
        <%@ include file="../template/adminHeader.jsp" %>

        <!-- Main content -->
        <div style="height: 100px"></div>
        <div class="container mt-5">
            <h1 class="text-lg font-semibold my-6">Quản lý người dùng trên nền tảng</h1>
            <div class="bg-white shadow rounded-lg">
                <table class="table table-striped">
                    <thead>
                        <tr class="title">
                            <th scope="col">ID</th>
                            <th scope="col">TÊN NGƯỜI DÙNG</th>
                            <th scope="col">TÊN TÀI KHOẢN</th>
                            <th scope="col">QUYỀN</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">ĐÃ CHẤN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listUser}" var="user" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${user.firstName}</td>
                                <td>${user.userName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test ="${user.role == 1}">
                                            Learner
                                        </c:when>
                                        <c:otherwise>
                                            Instructor
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test ="${user.status == 1}">
                                            <div class="relative inline-block w-10 mr-2 align-middle select-none">
                                                <input checked type="checkbox" name="toggle" id="toggle${status.count}" data-bs-toggle="modal" data-bs-target="#enableUser-${status.count}" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
                                                <label for="toggle${status.count}" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="relative inline-block w-10 mr-2 align-middle select-none">
                                                <input type="checkbox" name="toggle" id="toggle${status.count}" data-bs-toggle="modal" data-bs-target="#disableUser-${status.count}" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
                                                <label for="toggle${status.count}" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>

                            <!--Modal disable user-->
                        <div class="modal fade" id="disableUser-${status.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Chặn người dùng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            Name: ${user.firstName} | AccountId: ${user.userID}
                                        </div>
                                        Bạn có chắc chắn sẽ chặn người dùng này?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a href="manageuser?action=disableUser&id=${user.userID}" class="btn btn-primary">Save changes</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Modal enable user-->
                        <div class="modal fade" id="enableUser-${status.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Bỏ chặn người dùng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            Name: ${user.firstName} | AccountId: ${user.userID}
                                        </div>
                                        Bạn có chắc chắn sẽ bỏ chặn người dùng này?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a href="manageuser?action=enableUser&id=${user.userID}" class="btn btn-primary">Save changes</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <nav aria-label="Page navigation example" class="mt-4">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test ="${selectedPage - 1 < 1}">
                        <li class="page-item disabled">
                            <a class="page-link" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="manageuser?action=viewList&index=${selectedPage-1}">Previous</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${endP}" var="i">
                    <li class="page-item ${i == selectedPage ? "active" : ""}"><a class="page-link" href="manageuser?action=viewList&index=${i}">${i}</a></li>
                    </c:forEach>
                    <c:choose>
                        <c:when test ="${selectedPage >= endP}">
                        <li class="page-item disabled">
                            <a class="page-link" tabindex="-1" aria-disabled="true">Next</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="manageuser?action=viewList&index=${selectedPage + 1}">Next</a></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
        </nav>

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

        <!-- Vendor JS -->
        <script src="${pageContext.request.contextPath}/adminCSS/js/vendors.min.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/pages/chat-popup.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/assets/icons/feather-icons/feather.min.js"></script>

        <script src="${pageContext.request.contextPath}/adminCSS/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/assets/vendor_components/moment/min/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script src="${pageContext.request.contextPath}/adminCSS/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/jquery.smartmenus.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/menus.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/template.js"></script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/pages/dashboard.js"></script>

    </body>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script>
        // JavaScript to handle the toggle switch change event
        document.addEventListener('DOMContentLoaded', function () {
            var toggles = document.querySelectorAll('.toggle-checkbox');
            toggles.forEach(function (toggle) {
                toggle.addEventListener('change', function () {
                    // Here you can handle the state change
                    console.log('Toggle ' + this.id + ' is ' + (this.checked ? 'on' : 'off'));
                });
            });
        });
        // Initialize all toggle switches
        document.addEventListener('DOMContentLoaded', function () {
            var toggles = document.querySelectorAll('.toggle-checkbox');
            for (var i = 0; i < toggles.length; i++) {
                toggles[i].addEventListener('change', function (event) {
                    var toggle = event.target;
                    var label = toggle.nextElementSibling;
                    if (toggle.checked) {
                        label.classList.add('bg-orange-400');
                        label.classList.remove('bg-gray-300');
                    } else {
                        label.classList.add('bg-gray-300');
                        label.classList.remove('bg-orange-400');
                    }
                });
            }
        });
    </script>
</html>
