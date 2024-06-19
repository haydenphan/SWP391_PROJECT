<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style1.css">
        <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <title>Admin</title>
    </head>
    <body>
        <div class="list-course-admin-area">

            <div class="card shadow border-0 mb-3">
                <div class="card-header">
                    <h5 class="mb-0">Certificate Approval</h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover table-nowrap">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Course Name</th>
                                <th scope="col">Created Date</th>
                                <th scope="col">Instructor Name</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price</th>
                                <th scope="col">Status</th>
                                <th scope="col" style="width: 7%">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listcourses}" var="c">
                            <tr>
                                <td>                                      
                                    <a class="text-heading font-semibold" href="#">
                                        ${c.getCourseName()}
                                    </a>
                                </td>
                                <td>
                                    ${c.getCreatedDate()}
                                </td>
                                <td>                                    
                                    <a class="text-heading font-semibold" href="#">
                                        ${c.getCreatedBy()}
                                    </a>
                                </td>
                                <td>
                                    ${c.getSubcategoryID()}
                                </td>
                                <td>
                                    ${c.getPrice()}
                                </td>
                                <td>
                            <c:if test="${c.IsPublished()}">Published</c:if>
                            <c:if test="${!c.IsPublished()}">Not yet</c:if>
                            </td>
                            <td class="text-end">
                                <a href="./AdminCourseDetail?id=${c.getCourseID()}" class="btn btn-sm btn-neutral">View</a>
                                <!--                                        <button type="button" onclick="showSweetAlert()" class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                            <i class="bi bi-trash"></i>
                                                                        </button>-->
                            </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer border-0 py-3 ">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link disabled" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link bg-info text-white" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>

    </body>
</html>