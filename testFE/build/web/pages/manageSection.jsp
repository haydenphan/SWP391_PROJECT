<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.*" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>

        <style>
            body {
                background-color: #f0f8ff;
            }

            .hero-area {
                background: linear-gradient(135deg, #2467EC, #1b53bb);
                color: white;
                padding: 2rem;
                text-align: center;
                border-radius: 10px;
                margin-bottom: 2rem;
            }

            .section-card {
                border: 1px solid #d3d3d3;
                border-radius: 15px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
                transition: transform 0.3s ease-in-out;
            }

            .section-card:hover {
                transform: translateY(-5px);
            }

            .section-header {
                background: #2467EC;
                color: white;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                padding: 1rem;
                text-align: center;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .section-title {
                margin-bottom: 0;
                font-size: 1.5rem;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .section-title form {
                display: flex;
                align-items: center;
                margin-left: 10px;
            }

            .section-title input {
                border: none;
                background: none;
                color: white;
                font-size: 1.5rem;
                margin-right: 5px;
                padding: 0;
            }

            .section-title input:focus {
                outline: none;
                border-bottom: none;
            }

            .section-title button {
                background: none;
                border: none;
                color: white;
                cursor: pointer;
                font-size: 1rem;
            }

            .section-body {
                padding: 1.5rem;
            }

            .lecture-list {
                list-style: none;
                padding: 0;
            }

            .lecture-item {
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                background-color: #f9f9f9;
                padding: 1rem;
                margin-bottom: 1rem;
                transition: background-color 0.3s ease-in-out;
            }

            .lecture-item:hover {
                background-color: #e9ecef;
            }

            .lecture-title {
                font-size: 1.2rem;
                margin-bottom: 0.5rem;
            }

            .lecture-link {
                color: #2467EC;
                text-decoration: none;
            }

            .lecture-link:hover {
                text-decoration: underline;
            }

            .add-section-btn {
                position: absolute;
                top: 20px;
                right: 20px;
                background-color: #2467EC;
                color: white;
                border: none;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 24px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .add-section-btn:hover {
                background-color: #FFB013;
            }

            .no-sections {
                text-align: center;
                margin-top: 2rem;
                font-size: 1.5rem;
                color: #555;
            }
        </style>
    </head>

    <body>

        <%
            List<CourseSection> sectionList = (List<CourseSection>) request.getAttribute("sectionList");
            User user = (User) session.getAttribute("user");
            int courseId = (int) request.getAttribute("courseId");
        %>

        <div style="margin-top: 30px" class="container">
            <div class="row">
                <button class="add-section-btn" data-toggle="modal" data-target="#addSectionModal">+</button>
                <c:if test="${fn:length(sectionList) == 0}">
                    <div class="no-sections">
                        No sections available. Please add a new section.
                    </div>
                </c:if>
                <c:forEach var="section" items="${sectionList}">
                    <div class="col-lg-6">
                        <div class="section-card">
                            <div class="section-header">
                                <div class="section-title">
                                    Section ${section.sectionOrder}.
                                    <form method="POST" action="${pageContext.request.contextPath}/section-management">
                                        <input type="hidden" name="action" value="save">
                                        <input type="hidden" name="sectionId" value="${section.getSectionID()}">
                                        <input name="sectionName" id="sectionName" type="text" value="${section.sectionName}" oninput="adjustInputWidth(this)"/>
                                        <button type="submit"><i class="fas fa-edit"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="section-body">
                                <ul class="lecture-list">
                                    <c:set var="currentSection" value="${section}" scope="request" />
                                    <jsp:include page="../template/course/courseSectionComponent.jsp" />
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Modal for Adding New Section -->
        <div class="modal fade" id="addSectionModal" tabindex="-1" role="dialog" aria-labelledby="addSectionModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSectionModalLabel">Add New Section</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/section-management">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="add-section">
                            <input type="hidden" name="courseId" value="${courseId}">
                            <div class="form-group">
                                <label for="newSectionOrder">Section Order</label>
                                <input type="number" class="form-control" id="newSectionOrder" name="sectionOrder" required>
                            </div>
                            <div class="form-group">
                                <label for="newSectionName">Section Name</label>
                                <input type="text" class="form-control" id="newSectionName" name="sectionName" required>
                            </div>
                            <div class="form-group">
                                <label for="newSectionDescription">Section Description</label>
                                <textarea class="form-control" id="newSectionDescription" name="sectionDescription" rows="5" cols="10" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Section</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <script>
            function adjustInputWidth(input) {
                input.style.width = (input.value.length + 1) + 'ch';
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.section-title input').forEach(function (input) {
                    adjustInputWidth(input);
                });
            });
        </script>
    </body>
</html>
