<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>

<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- hero-area -->
            <jsp:include page="../template/heroArea.jsp">
                <jsp:param name="title" value="My profile" />
            </jsp:include>

            <%
                ArrayList<String> categoryList = CategoryDAO.getAllCategoryName();
                ArrayList<String> languageList = LanguageDAO.getAllLanguageName();
                ArrayList<String> levelList = LevelDAO.getAllLevelName();
            %>
            <div class="contact-area pt-120 pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-7 col-md-12">
                            <form action="course-info" method="POST" enctype="multipart/form-data">
                                <div class="contact-area-wrapper">
                                    <div class="section-title mb-50">
                                        <h2>Step 1</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <h4><label for="courseName">Course Name:</label></h4>
                                        <div class="contact-from-input mb-20">
                                            <input id="courseName" name="courseName" type="text" placeholder="Course Name" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <h4><label for="price">Price:</label></h4>
                                        <div class="contact-from-input mb-20">
                                            <input id="price" name="price" type="number" placeholder="Price" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="contact-select">
                                            <h4><label for="category">Choose a category:</label></h4>
                                            <select id="category" name="category" class="mb-20" required>
                                                <c:forEach var="category" items="<%=categoryList%>">
                                                    <option value="${category}">${category}</option>
                                                </c:forEach>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Cover Image Upload -->
                                    <div class="col-xl-6">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="coverImage">Cover Image:</label></h4>
                                            <input id="coverImage" name="coverImage" type="file" required>
                                        </div>
                                    </div>

                                    <div class="col-xl-6">
                                        <div class="contact-select">
                                            <h4><label for="language">Choose a language:</label></h4>
                                            <select id="language" name="language" class="mb-20">
                                                <c:forEach var="language" items="<%=languageList%>">
                                                    <option value="${language}">${language}</option>
                                                </c:forEach>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xl-6">
                                        <div class="contact-select">
                                            <h4><label for="level">Choose a level:</label></h4>
                                            <select id="level" name="level" class="mb-20">
                                                <c:forEach var="level" items="<%=levelList%>">
                                                    <option value="${level}">${level}</option>
                                                </c:forEach>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="description">Description:</label></h4>
                                            <textarea id="description" placeholder="Description" name="description"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="contact-from-input mb-20">
                                            <h4><label for="requirements">Requirements (optional): </label></h4>
                                            <textarea id="requirements" placeholder="Course Requirements" name="requirements"></textarea>
                                        </div>
                                    </div>

                                    <div class="colxl-2 ">
                                        <div class="sing-buttom mb-20">
                                            <button type="submit" class="sing-btn">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

</html>
