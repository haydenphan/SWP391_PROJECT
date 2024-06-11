<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <main>
            <%
                List<String> list = SubcategoryDAO.getSubcategoryNamesByCategoryID(CategoryDAO.getCategoryIdByName((String)session.getAttribute("category")));
            %>

            <div class="contact-area pt-120 pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-7 col-md-12">
                            <form action="save-info" method="POST">
                                <div class="contact-area-wrapper">
                                    <div class="section-title mb-50">
                                        <h2>Step 2</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="display: flex" class="col-xl-12">
                                        <h4><label for="subcategory">subcategory</label></h4>
                                        <select id="subcategory" name="subcategory" class="mb-20" required>
                                            <c:forEach var="subcategory" items="<%=list%>">
                                                <option value="${subcategory}">${subcategory}</option>
                                            </c:forEach>
                                            <option value="Others">Others</option>
                                        </select>
                                    </div>

                                    <div class="col-xl-3">
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

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

</html>