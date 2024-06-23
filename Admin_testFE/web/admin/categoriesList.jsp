<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <% 
        List<String> categories = (List<String>) request.getAttribute("categoriesName");
        Map<String, List<SubCategory>> subcategoriesMap = (Map<String, List<SubCategory>>) request.getAttribute("subcategoriesMap");
    %>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/assets.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/typography.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/styles.css">
        <style>
            body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            color: #343a40;
        }
            .categories-container {
                width: 80%;
                margin: 50px auto;
                padding: 20px;
                background: #EFEFEF;
                border-radius: 12px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }
            .categories-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .categories-header h2 {
                color: #333;
                font-size: 28px;
                font-family: Georgia;
            }
            .categories-list {
                list-style: none;
                padding: 0;
            }
            .categories-list li {
                display: flex;
                flex-direction: column;
                padding: 15px;
                margin: 10px 0;
                background: #F3F8FF;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }
            .categories-list li:hover {
                transform: translateY(-3px);
            }
            .categories-list li .category-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .categories-list li .category-name {
                font-size: 18px;
                color: #373A40;
                cursor: pointer;
            }
            .subcategories-list {
                list-style: none;
                padding: 0;
                margin: 10px 0 0 0;
                display: none;
            }
            .subcategories-list li {
                display:inline-grid;
                justify-content: space-between;
                align-items: center;
                padding: inherit;
                margin: 5px 0;
                background: #E3F4F4;
                border-radius: 8px;
                font-size: 14px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .subcategory-actions img {
                width: 16px;
                height: 16px;
                cursor: pointer;
                margin-left: 5px;
            }
            .add-category-btn {
                background-color: #7BC0A3;
                color: white;
                border: none;
                padding: 8px 18px;
                border-radius: 50%;
                cursor: pointer;
                font-size: 24px;
                transition: background-color 0.3s ease;
            }
            .add-category-btn:hover {
                background-color: #45a049;
            }
            .add-subcategory-btn {
                background-color: #7BC0A3;
                color: white;
                border: none;
                padding: 0px 8.5px;
                border-radius: 50%;
                cursor: pointer;
                font-size: 13px;
                transition: background-color 0.3s ease;
                display: none;
            }
            .add-subcategory-btn:hover {
                background-color: #45a049;
            }
            .new-category-input,
            .new-subcategory-input {
                display: block;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
                padding: 15px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .new-category-input input,
            .new-subcategory-input input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .new-category-input .save-category-btn,
            .new-category-input .cancel-category-btn,
            .new-subcategory-input .save-subcategory-btn,
            .new-subcategory-input .cancel-subcategory-btn {
                padding: 10px;
                cursor: pointer;
                font-size: 10px;
                margin-left: 10px;
                transition: background-color 0.3s ease;
                border: none;
                color: white;
                border-radius: 4px;
            }
            .new-category-input .save-category-btn,
            .new-subcategory-input .save-subcategory-btn {
                background-color: #4CAF50;
            }
            .new-category-input .save-category-btn:hover,
            .new-subcategory-input .save-subcategory-btn:hover {
                background-color: #45a049;
            }
            .new-category-input .cancel-category-btn,
            .new-subcategory-input .cancel-subcategory-btn {
                background-color: #ddd;
                color: black;
            }
            .new-category-input .cancel-category-btn:hover,
            .new-subcategory-input .cancel-subcategory-btn:hover {
                background-color: #e53935;
            }
            .error-message {
                color: red;
                font-size: 16px;
                margin-bottom: 20px;
            }
            .success-message {
                color: green;
                font-size: 16px;
                margin-bottom: 20px;
            }
            .category-actions img {
                width: 20px;
                height: 20px;
                cursor: pointer;
                margin-left: 10px;
            }
            /* Modal container */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
                justify-content: center;
                align-items: center;
                animation: fadeIn 0.5s;
            }
            /* Modal content */
            .modal-content-cate {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                animation: slideIn 0.5s;
            }
            /* Modal animation */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @keyframes slideIn {
                from {
                    transform: translateY(-50px);
                }
                to {
                    transform: translateY(0);
                }
            }
            /* Close button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            /* Modal buttons */
            .modal-save-btn, .modal-delete-btn, .modal-cancel-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-right: 10px;
            }
            .modal-save-btn {
                background-color: #4CAF50;
                color: white;
            }
            .modal-save-btn:hover {
                background-color: #45a049;
            }
            .modal-delete-btn {
                background-color: #f44336;
                color: white;
            }
            .modal-delete-btn:hover {
                background-color: #e53935;
            }
            .modal-cancel-btn {
                background-color: #ddd;
                color: black;
            }
            .modal-cancel-btn:hover {
                background-color: #e53935;
            }
            .modal-content-cate h2 {
                font-family: Georgia;
                font-size: 20px;
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
        </style>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>
        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>
        <%-- HEADER --%>
        <header>
            <div class="header-area header-transparent sticky-header">
                <div class="container-fluid">
                    <div class="header-main-wrapper">
                        <div class="row align-items-center">
                            <div class="col-xl-7 col-lg-7 col-md-5 col-sm-9 col-9">
                                <div class="header-left d-flex align-items-center">
                                    <div class="header-logo">
                                        <a href="${pageContext.request.contextPath}/pages/home.jsp"><img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="logo"></a>
                                    </div>
                                    <div class="main-menu d-none d-xl-block">
                                        <nav id="mobile-menu">
                                            <ul>
                                                <li class="menu-item-has-children"><a href="index.jsp">Dashboard</a></li>
                                                <li class="menu-item-has-children"><a href="${pageContext.request.contextPath}/get-course-info">Course</a></li>
                                                <li class="menu-item-has-children"><a href="shop.jsp">Shop</a></li>
                                                <li class="menu-item-has-children"><a href="#!">Pages</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-7 col-sm-3 col-3">
                                <div class="header-right d-flex align-items-center justify-content-end">
                                    <c:choose>
                                        <c:when test="${user != null}">
                                            <div class="user-avatar-wrapper mr-30">
                                                <a href="" class="user-avatar-btn">
                                                    <div class="header__user-avatar p-relative">
                                                        <img src="${user.getAvatar()}" alt="User Avatar" style="width: 40px; height: 40px; border-radius: 50%;">
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="user-logout-wrapper mr-30">
                                                <a href="${pageContext.request.contextPath}/LogoutServlet" class="user-logout-btn">Logout</a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="user-btn-inner p-relative d-none d-md-block">
                                                <div class="user-btn-wrapper">
                                                    <div class="user-btn-content">
                                                        <a class="user-btn-sign-in" href="${pageContext.request.contextPath}/pages/login.jsp">Sign In</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-none d-md-block">
                                                <a class="user-btn-sign-up edu-btn" href="${pageContext.request.contextPath}/pages/registration.jsp">Sign Up</a>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="menu-bar d-xl-none ml-20">
                                        <a class="side-toggle" href="javascript:void(0)">
                                            <div class="bar-icon">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main container start -->
        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="All Categories" />
        </jsp:include>
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="categories-container">
                    <div class="categories-header">
                        <h2>All Categories</h2>
                        <button class="add-category-btn" onclick="showAddCategoryRow()">+</button>
                    </div>
                    <c:if test="${not empty error}">
                        <div class="error-message">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="success-message">${success}</div>
                    </c:if>
                    <ul class="categories-list">
                        <li class="new-category-input" id="addCategoryRow" style="display: none;">
                            <form id="addCategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                                <input type="hidden" name="action" value="add">
                                <input type="text" name="categoryName" id="newCategoryName" placeholder="Enter new category name">
                                <button type="submit" class="save-category-btn">Save</button>
                                <button type="button" class="cancel-category-btn" onclick="hideAddCategoryRow()">Cancel</button>
                            </form>
                        </li>
                        <c:forEach var="categoryName" items="${categoriesName}">
                            <li>
                                <div class="category-header">
                                    <span class="category-name" onclick="toggleSubcategories('${categoryName}')">${categoryName}</span>
                                    <div class="category-actions">
                                        <img src="${pageContext.request.contextPath}/img/category/edit-text.png" alt="Edit" onclick="editCategory('${categoryName}')">
                                        <img src="${pageContext.request.contextPath}/img/category/delete.png" alt="Delete" onclick="deleteCategory('${categoryName}')">
                                        <button class="add-subcategory-btn" id="addSubcategoryBtn-${categoryName}" onclick="showAddSubcategoryRow('${categoryName}')">+</button>
                                    </div>
                                </div>
                                <ul class="subcategories-list" id="subcategories-${categoryName}">
                                    <c:forEach var="subcategory" items="${subcategoriesMap[categoryName]}">
                                        <li>
                                            <span class="subcategory-name">${subcategory.name}</span>
                                            <div class="subcategory-actions">
                                                <img src="${pageContext.request.contextPath}/img/category/edit-text.png" alt="Edit" onclick="editSubcategory('${subcategory.name}', '${categoryName}')">
                                                <img src="${pageContext.request.contextPath}/img/category/delete.png" alt="Delete" onclick="deleteSubcategory('${subcategory.name}', '${categoryName}')">
                                            </div>
                                        </li>
                                    </c:forEach>
                                    <li class="new-subcategory-input" id="addSubcategoryRow-${categoryName}" style="display: none;">
                                        <form id="addSubcategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                                            <input type="hidden" name="action" value="addSubcategory">
                                            <input type="hidden" name="categoryName" value="${categoryName}">
                                            <input type="text" name="subcategoryName" placeholder="Enter new subcategory name">
                                            <button type="submit" class="save-subcategory-btn">Save</button>
                                            <button type="button" class="cancel-subcategory-btn" onclick="hideAddSubcategoryRow('${categoryName}')">Cancel</button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>
        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src='assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets/vendors/chart/chart.min.js"></script>
        <script src="assets/js/admin.js"></script>
        <script>
            function showAddCategoryRow() {
                document.getElementById('addCategoryRow').style.display = 'flex';
            }
            function hideAddCategoryRow() {
                document.getElementById('addCategoryRow').style.display = 'none';
                document.getElementById('newCategoryName').value = '';
            }
            function editCategory(categoryName) {
                document.getElementById('editCategoryName').value = categoryName;
                document.getElementById('oldCategoryName').value = categoryName;
                openModal('editModal');
            }
            function deleteCategory(categoryName) {
                document.getElementById('deleteCategoryName').value = categoryName;
                openModal('deleteModal');
            }
            function toggleSubcategories(categoryName) {
                var subcategoriesList = document.getElementById('subcategories-' + categoryName);
                var addSubcategoryBtn = document.getElementById('addSubcategoryBtn-' + categoryName);
                if (subcategoriesList.style.display === 'none' || subcategoriesList.style.display === '') {
                    subcategoriesList.style.display = 'block';
                    addSubcategoryBtn.style.display = 'inline';
                } else {
                    subcategoriesList.style.display = 'none';
                    addSubcategoryBtn.style.display = 'none';
                }
            }
            function showAddSubcategoryRow(categoryName) {
                document.getElementById('addSubcategoryRow-' + categoryName).style.display = 'flex';
            }
            function hideAddSubcategoryRow(categoryName) {
                document.getElementById('addSubcategoryRow-' + categoryName).style.display = 'none';
            }
            function editSubcategory(subcategoryName, categoryName) {
                document.getElementById('editSubcategoryName').value = subcategoryName;
                document.getElementById('oldSubcategoryName').value = subcategoryName;
                document.getElementById('categoryNameForSubcategory').value = categoryName;
                openModal('editSubcategoryModal');
            }
            function deleteSubcategory(subcategoryName, categoryName) {
                document.getElementById('deleteSubcategoryName').value = subcategoryName;
                document.getElementById('categoryNameForSubcategoryDelete').value = categoryName;
                openModal('deleteSubcategoryModal');
            }
            function openModal(modalId) {
                document.getElementById(modalId).style.display = 'flex';
            }
            function closeModal(modalId) {
                document.getElementById(modalId).style.display = 'none';
            }
        </script>
        <div id="editModal" class="modal">
            <div class="modal-content-cate">
                <span class="close" onclick="closeModal('editModal')">&times;</span>
                <h2>Edit Category</h2>
                <form id="editCategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="oldCategoryName" id="oldCategoryName">
                    <input type="text" name="newCategoryName" id="editCategoryName" placeholder="Enter new category name">
                    <button type="submit" class="modal-save-btn">Save</button>
                    <button type="button" class="modal-cancel-btn" onclick="closeModal('editModal')">Cancel</button>
                </form>
            </div>
        </div>
        <div id="deleteModal" class="modal">
            <div class="modal-content-cate">
                <span class="close" onclick="closeModal('deleteModal')">&times;</span>
                <h2>Delete Category</h2>
                <form id="deleteCategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="categoryName" id="deleteCategoryName">
                    <p>Are you sure you want to delete this category?</p>
                    <button type="submit" class="modal-delete-btn">Delete</button>
                    <button type="button" class="modal-cancel-btn" onclick="closeModal('deleteModal')">Cancel</button>
                </form>
            </div>
        </div>
        <div id="editSubcategoryModal" class="modal">
            <div class="modal-content-cate">
                <span class="close" onclick="closeModal('editSubcategoryModal')">&times;</span>
                <h2>Edit Subcategory</h2>
                <form id="editSubcategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                    <input type="hidden" name="action" value="editSubcategory">
                    <input type="hidden" name="oldSubcategoryName" id="oldSubcategoryName">
                    <input type="hidden" name="categoryName" id="categoryNameForSubcategory">
                    <input type="text" name="newSubcategoryName" id="editSubcategoryName" placeholder="Enter new subcategory name">
                    <button type="submit" class="modal-save-btn">Save</button>
                    <button type="button" class="modal-cancel-btn" onclick="closeModal('editSubcategoryModal')">Cancel</button>
                </form>
            </div>
        </div>
        <div id="deleteSubcategoryModal" class="modal">
            <div class="modal-content-cate">
                <span class="close" onclick="closeModal('deleteSubcategoryModal')">&times;</span>
                <h2>Delete Subcategory</h2>
                <form id="deleteSubcategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                    <input type="hidden" name="action" value="deleteSubcategory">
                    <input type="hidden" name="subcategoryName" id="deleteSubcategoryName">
                    <input type="hidden" name="categoryName" id="categoryNameForSubcategoryDelete">
                    <p>Are you sure you want to delete this subcategory?</p>
                    <button type="submit" class="modal-delete-btn">Delete</button>
                    <button type="button" class="modal-cancel-btn" onclick="closeModal('deleteSubcategoryModal')">Cancel</button>
                </form>
            </div>
        </div>
    </body>
</html>
ss