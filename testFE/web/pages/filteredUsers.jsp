<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Filtered Users</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>User Filter</h2>
        <!-- Filter Form -->
        <form id="filterForm" class="mb-4" method="GET" action="${pageContext.request.contextPath}/filterUsers">
            <div class="row">
                <div class="col-md-3">
                    <label for="role" class="form-label">Role</label>
                    <select id="role" name="role" class="form-control">
                        <option value="">All</option>
                        <option value="1">Learner</option>
                        <option value="2">Instructor</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="banned" class="form-label">Banned</label>
                    <select id="banned" name="banned" class="form-control">
                        <option value="">All</option>
                        <option value="true">Banned</option>
                        <option value="false">Not Banned</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="newUser" class="form-label">New User</label>
                    <select id="newUser" name="newUser" class="form-control">
                        <option value="">All</option>
                        <option value="true">New User</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="topPurchaser" class="form-label">Top Purchaser</label>
                    <select id="topPurchaser" name="topPurchaser" class="form-control">
                        <option value="">All</option>
                        <option value="true">Top Purchaser</option>
                    </select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Apply Filters</button>
                </div>
            </div>
        </form>

        <!-- User Table -->
        <div class="bg-white shadow rounded-lg">
            <table class="table table-striped">
                <thead>
                    <tr class="title">
                        <th scope="col">ID</th>
                        <th scope="col">USER FULLNAME</th>
                        <th scope="col">USERNAME</th>
                        <th scope="col">ROLE</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">BANNED</th>
                        <th scope="col">VIEW DETAIL</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listUser}" var="user" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${user.firstName} ${user.lastName}</td>
                            <td>${user.userName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.role == 1}">
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
                                    <c:when test="${!user.isIsActive()}">
                                        Banned
                                    </c:when>
                                    <c:otherwise>
                                        Not Banned
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="pages/newUserProfile.jsp?userID=${user.userID}" class="btn btn-primary">View Detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include Bootstrap JS for functionality -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
