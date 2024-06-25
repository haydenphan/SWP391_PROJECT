<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Categories Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css">
        <style>
            .categories-container {
                width: 80%;
                margin: 50px auto;
                padding: 20px;
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
            .categories-list li.active .category-name {
                background-color: #2467EC;
                color: #fff;
                padding: 5px 10px;
                border-radius: 4px;
            }
            .subcategories-list {
                list-style: none;
                padding: 0;
                margin: 10px 0 0 0;
                display: none;
            }
            .subcategories-list li {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                margin: 5px 0;
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
                background-color: #2467EC;
                color: white;
                border: none;
                padding: 8px 18px;
                border-radius: 25%;
                cursor: pointer;
                font-size: 24px;
                transition: background-color 0.3s ease;
            }
            .add-category-btn:hover {
                background-color: #FFB013;
                color: black;
            }
            .add-subcategory-btn {
                background-color: #28a745;
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
                background-color: #218838;
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
                font-size: 14px;
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
        <%@ include file="../template/adminHeader.jsp" %>

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
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success" role="alert">${success}</div>
                    </c:if>
                    <ul class="categories-list">
                        <li class="new-category-input" id="addCategoryRow" style="display: none;">
                            <form id="addCategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                                <input type="hidden" name="action" value="add">
                                <input type="text" name="categoryName" id="newCategoryName" placeholder="Enter new category name" class="form-control">
                                <button type="submit" class="save-category-btn btn btn-success">Save</button>
                                <button type="button" class="cancel-category-btn btn btn-danger" onclick="hideAddCategoryRow()">Cancel</button>
                            </form>
                        </li>
                        <c:forEach var="categoryName" items="${categoriesName}">
                            <li id="category-${categoryName}">
                                <div class="category-header">
                                    <span class="category-name" onclick="toggleSubcategories('${categoryName}')">${categoryName}</span>
                                    <div class="category-actions">
                                        <i class="fas fa-edit" alt="Edit" onclick="editCategory('${categoryName}')" style="cursor:pointer; margin-right:10px;"></i>
                                        <i class="fas fa-trash-alt" alt="Delete" onclick="deleteCategory('${categoryName}')" style="cursor:pointer; margin-right:10px;"></i>
                                        <button class="add-subcategory-btn" id="addSubcategoryBtn-${categoryName}" onclick="showAddSubcategoryRow('${categoryName}')">+</button>
                                    </div>
                                </div>
                                <ul class="subcategories-list" id="subcategories-${categoryName}">
                                    <c:forEach var="subcategory" items="${subcategoriesMap[categoryName]}">
                                        <li>
                                            <span class="subcategory-name">${subcategory.name}</span>
                                            <div class="subcategory-actions">
                                                <i class="fas fa-edit" alt="Edit" onclick="editSubcategory('${subcategory.name}', '${categoryName}')" style="cursor:pointer; margin-right:10px;"></i>
                                                <i class="fas fa-trash-alt" alt="Delete" onclick="deleteSubcategory('${subcategory.name}', '${categoryName}')" style="cursor:pointer; margin-right:10px;"></i>
                                            </div>
                                        </li>
                                    </c:forEach>
                                    <li class="new-subcategory-input" id="addSubcategoryRow-${categoryName}" style="display: none;">
                                        <form id="addSubcategoryForm" method="POST" action="${pageContext.request.contextPath}/AdminCategory">
                                            <input type="hidden" name="action" value="addSubcategory">
                                            <input type="hidden" name="categoryName" value="${categoryName}">
                                            <input type="text" name="subcategoryName" placeholder="Enter new subcategory name" class="form-control">
                                            <button type="submit" class="save-subcategory-btn btn btn-success">Save</button>
                                            <button type="button" class="cancel-subcategory-btn btn btn-danger" onclick="hideAddSubcategoryRow('${categoryName}')">Cancel</button>
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

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>
        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
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
                                                    var categoryElement = document.getElementById('category-' + categoryName);
                                                    if (subcategoriesList.style.display === 'none' || subcategoriesList.style.display === '') {
                                                        subcategoriesList.style.display = 'block';
                                                        addSubcategoryBtn.style.display = 'inline';
                                                        categoryElement.classList.add('active');
                                                    } else {
                                                        subcategoriesList.style.display = 'none';
                                                        addSubcategoryBtn.style.display = 'none';
                                                        categoryElement.classList.remove('active');
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
                    <input type="text" name="newCategoryName" id="editCategoryName" placeholder="Enter new category name" class="form-control">
                    <button type="submit" class="modal-save-btn btn btn-success">Save</button>
                    <button type="button" class="modal-cancel-btn btn btn-danger" onclick="closeModal('editModal')">Cancel</button>
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
                    <button type="submit" class="modal-delete-btn btn btn-danger">Delete</button>
                    <button type="button" class="modal-cancel-btn btn btn-secondary" onclick="closeModal('deleteModal')">Cancel</button>
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
                    <input type="text" name="newSubcategoryName" id="editSubcategoryName" placeholder="Enter new subcategory name" class="form-control">
                    <button type="submit" class="modal-save-btn btn btn-success">Save</button>
                    <button type="button" class="modal-cancel-btn btn btn-danger" onclick="closeModal('editSubcategoryModal')">Cancel</button>
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
                    <button type="submit" class="modal-delete-btn btn btn-danger">Delete</button>
                    <button type="button" class="modal-cancel-btn btn btn-secondary" onclick="closeModal('deleteSubcategoryModal')">Cancel</button>
                </form>
            </div>
        </div>
    </body>
</html>