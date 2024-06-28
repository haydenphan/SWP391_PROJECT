<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.CategoryDAO" %>
<%@ page import="DAO.LanguageDAO" %>
<%@ page import="DAO.LevelDAO" %>

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
                            <form id="courseForm" action="save-info" method="POST" enctype="multipart/form-data">
                                <div class="contact-area-wrapper">
                                    <div class="section-title mb-50">
                                        <h2>Enter Course Information:</h2>
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

                                    <div class="col-xl-12">
                                        <div class="sing-buttom mb-20">
                                            <button type="button" class="sing-btn" onclick="openModal()">Next</button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal -->
                                <div id="subcategoryModal" class="modal" style="display:none;">
                                    <div class="modal-content">
                                        <span class="close" onclick="closeModal()">&times;</span>
                                        <h2>Select Subcategory</h2>
                                        <div class="contact-select">
                                            <h4><label for="subcategory">Subcategory:</label></h4>
                                            <select id="subcategory" name="subcategory" class="mb-20" required>
                                                <!-- Options will be populated by JavaScript -->
                                            </select>
                                        </div>
                                        <div class="sing-buttom mb-20">
                                            <button type="submit" class="sing-btn">Submit</button>
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
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
            }

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

            .alert {
                position: fixed;
                top: 20px;
                right: 20px;
                padding: 20px;
                background-color: #4CAF50;
                color: white;
                z-index: 1000;
                border-radius: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .alert button {
                margin-left: 20px;
                padding: 10px;
                border: none;
                background-color: white;
                color: #4CAF50;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>
        <script>
            function openModal() {
                console.log("openModal called");
                var selectedCategory = document.getElementById("category").value;
                console.log("Selected category: " + selectedCategory);
                fetchSubcategories(selectedCategory);
                document.getElementById("subcategoryModal").style.display = "block";
            }

            function closeModal() {
                console.log("closeModal called");
                document.getElementById("subcategoryModal").style.display = "none";
            }

            function fetchSubcategories(category) {
                console.log("fetchSubcategories called with category: " + category);
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "../getSubcategories?category=" + category, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log("AJAX request successful");
                        console.log("Response: " + xhr.responseText);
                        var subcategories = JSON.parse(xhr.responseText);
                        var subcategorySelect = document.getElementById("subcategory");
                        console.log("Subcategory select element: ", subcategorySelect);
                        subcategorySelect.innerHTML = "";
                        subcategories.forEach(function (subcategory) {
                            var option = document.createElement("option");
                            option.value = subcategory;
                            option.text = subcategory;
                            subcategorySelect.add(option);
                        });
                        var option = document.createElement("option");
                        option.value = "Others";
                        option.text = "Others";
                        subcategorySelect.add(option);

                        // Initialize nice-select after populating options
                        $('#subcategory').niceSelect('update');
                    } else if (xhr.readyState === 4) {
                        console.error("Error fetching subcategories: " + xhr.status);
                    }
                };
                xhr.send();
            }

            // Initialize nice-select on document ready
            document.addEventListener('DOMContentLoaded', function () {
                $('#subcategory').niceSelect();
            });

            // Check if course was successfully created and show the popup
            document.addEventListener('DOMContentLoaded', function () {
                const courseCreated = '<%= session.getAttribute("courseCreated")%>';
                if (courseCreated === 'true') {
                    showAlert();
            <% session.removeAttribute("courseCreated");%>
                }
            });

            function showAlert() {
                const alertBox = document.createElement('div');
                alertBox.classList.add('alert', 'alert-success');
                alertBox.textContent = 'Course created successfully!';
                const profileButton = document.createElement('button');
                profileButton.textContent = 'Go to Profile';
                profileButton.onclick = function () {
                    window.location.href = '<%= request.getContextPath() %>/pages/instructor-profile.jsp';
                };
                alertBox.appendChild(profileButton);
                document.body.appendChild(alertBox);
                setTimeout(() => {
                    alertBox.style.display = 'none';
                }, 5000);
            }
        </script>
    </body>
</html>
