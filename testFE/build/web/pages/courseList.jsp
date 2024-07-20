<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>

<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>

            <!-- hero-area -->
            <jsp:include page="../template/heroArea.jsp">
                <jsp:param name="title" value="Courses" />
            </jsp:include>

            <!-- course-bar up-area -->
            <%@ include file="../template/course/courseBarUpArea.jsp" %>

            <!-- course-content-start -->
            <section class="course-content-area pb-90">
                <div class="container">
                    <div class="row mb-10">
                        <div class="col-xl-3 col-lg-4 col-md-8">
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Categories</h3>
                                    <ul>
                                        <c:forEach var="entry" items="${courseQuantityOfCategory}">
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="checkbox" id="category-${entry.key}" name="category" value="${entry.key}" onclick="onCategoryChange()">
                                                    <label class="edu-check-label" for="category-${entry.key}">
                                                        ${entry.key} (${entry.value})
                                                    </label>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <!-- Ratings filter -->
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Ratings</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-5" name="rating" value="5" onclick="onRatingChange(this.value)">
                                                <label class="edu-check-star" for="e-25">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>

                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-4" name="rating" value="4" onclick="onRatingChange(this.value)">
                                                <label class="edu-check-star" for="e-24">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>

                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-3" name="rating" value="3" onclick="onRatingChange(this.value)">
                                                <label class="edu-check-star" for="e-12">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>

                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-2" name="rating" value="2" onclick="onRatingChange(this.value)">
                                                <label class="edu-check-star" for="e-28">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>

                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-1" name="rating" value="1" onclick="onRatingChange(this.value)">
                                                <label class="edu-check-star" for="e-14">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>
                                                    <i class="fal fa-star"></i>

                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Price filter -->
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Price</h3>
                                    <ul>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-85" name="price" value="all" onclick="onPriceChange(this.value)">
                                                <label class="edu-check-label" for="e-85">All</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="e-all" name="price" value="free" onclick="onPriceChange(this.value)">
                                                <label class="edu-check-label" for="e-all">Free</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="course-sidebar-list">
                                                <input class="edu-check-box" type="radio" id="f-all" name="price" value="paid" onclick="onPriceChange(this.value)">
                                                <label class="edu-check-label" for="f-all">Paid</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Level filter -->
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Level</h3>
                                    <ul>
                                        <c:forEach var="level" items="${courseLevels}">
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="checkbox" id="level-${level.levelId}" name="level" value="${level.levelId}" onclick="onLevelChange()">
                                                    <label class="edu-check-label" for="level-${level.levelId}">${level.levelName}</label>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <!-- Language filter -->
                            <div class="course-sidebar-widget mb-20">
                                <div class="course-sidebar-info">
                                    <h3 class="drop-btn">Language</h3>
                                    <ul>
                                        <c:forEach var="language" items="${languages}">
                                            <li>
                                                <div class="course-sidebar-list">
                                                    <input class="edu-check-box" type="checkbox" id="language-${language.languageId}" name="language" value="${language.languageId}" onclick="onLanguageChange()">
                                                    <label class="edu-check-label" for="language-${language.languageId}">${language.languageName}</label>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-9 col-lg-8 col-md-12">
                            <div class="row">
                                <c:forEach var="course" items="${courses}">
                                    <c:set var="currentCourse" value="${course}" scope="request" />
                                    <jsp:include page="../template/course/courseComponent.jsp" />
                                </c:forEach>
                                <%                                    int totalDisplayedCourses = (crs != null) ? crs.size() : 0;
                                    boolean isCoursesEmpty = (totalDisplayedCourses == 0);
                                    if (isCoursesEmpty) {
                                %>
                                <p>No more content available</p>
                                <%
                                    }
                                %>
                            </div>

                            <!-- Pagination controls -->
                            <div class="d-flex mt-4">
                                <button class="btn btn-primary mr-2" onclick="changePage(-1)" id="prevBtn">Previous</button>
                                <div class="input-group" style="width: 120px; margin: 0px 10px">
                                    <input style="margin-right: 10px" type="number" class="form-control" id="pageInput" onkeypress="handleEnterKey(event)" value="1">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" onclick="goToPage()">Go</button>
                                    </div>
                                </div>
                                <button class="btn btn-primary ml-2" onclick="changePage(1)" id="nextBtn">Next</button>
                            </div>
                        </div>                        
                    </div>
                </div>
            </section>
            <!-- course-content-end -->

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
        <script>
            function getSelectedOptions() {
                const params = new URLSearchParams();

                // Get selected rating
                const rating = document.querySelector('input[name="rating"]:checked');
                if (rating) {
                    params.append('rating', rating.value);
                }

                // Get selected price
                const price = document.querySelector('input[name="price"]:checked');
                if (price) {
                    params.append('price', price.value);
                }

                // Get selected levels
                document.querySelectorAll('input[name="level"]:checked').forEach(level => {
                    params.append('level', level.value);
                });

                // Get selected languages
                document.querySelectorAll('input[name="language"]:checked').forEach(language => {
                    params.append('language', language.value);
                });

                // Get selected categories
                document.querySelectorAll('input[name="category"]:checked').forEach(category => {
                    params.append('category', category.value);
                });

                return params.toString();
            }

            function redirectToCourseList() {
                const queryString = getSelectedOptions();
                console.log(queryString);
                window.location.href = "/testFE/CourseList?" + queryString;
            }

            // Function to handle change in category selection
            function onCategoryChange() {
                redirectToCourseList();
            }

            // Function to handle change in rating selection
            function onRatingChange() {
                redirectToCourseList();
            }

            // Function to handle change in price selection
            function onPriceChange() {
                redirectToCourseList();
            }

            // Function to handle change in level selection
            function onLevelChange() {
                redirectToCourseList();
            }

            // Function to handle change in language selection
            function onLanguageChange() {
                redirectToCourseList();
            }

            // Event listener for changes in checkboxes and radio buttons
            document.querySelectorAll('input[type="checkbox"], input[type="radio"]').forEach(input => {
                input.addEventListener('change', redirectToCourseList);
            });

            // Function to parse query parameters from URL
            function parseQueryParams() {
                const queryParams = new URLSearchParams(window.location.search);

                // Select rating
                const rating = queryParams.get('rating');
                if (rating) {
                    const ratingInput = document.getElementById('e-' + rating);
                    if (ratingInput) {
                        ratingInput.checked = true;
                    }
                }

                // Select price
                const price = queryParams.get('price');
                if (price) {
                    document.querySelector("input[name=price][value=" + price + "]").checked = true;
                }

                // Select levels
                const levels = queryParams.getAll('level');
                levels.forEach(level => {
                    const levelInput = document.getElementById('level-' + level);
                    if (levelInput) {
                        levelInput.checked = true;
                    }
                });

                // Select languages
                const languages = queryParams.getAll('language');
                languages.forEach(language => {
                    const languageInput = document.getElementById('language-' + language);
                    if (languageInput) {
                        languageInput.checked = true;
                    }
                });

                // Select categories
                const categories = queryParams.getAll('category');
                categories.forEach(category => {
                    const categoryInput = document.getElementById('category-' + category);
                    if (categoryInput) {
                        categoryInput.checked = true;
                    }
                });
            }

            // Parse query parameters on page load
            parseQueryParams();

            function changePage(offset) {
                const urlParams = new URLSearchParams(window.location.search);
                let currentPage = parseInt(urlParams.get('currentPage')) || 1;
                const newPage = currentPage + offset;

                if (newPage < 1)
                    return;

                urlParams.set('currentPage', newPage);
                window.location.search = urlParams.toString();
            }

            function goToPage() {
                const pageInput = document.getElementById('pageInput').value;
                const newPage = parseInt(pageInput);

                if (isNaN(newPage) || newPage < 1)
                    return;

                const urlParams = new URLSearchParams(window.location.search);
                urlParams.set('currentPage', newPage);
                window.location.search = urlParams.toString();
            }

            function handleEnterKey(event) {
                if (event.keyCode === 13) {
                    goToPage();
                }
            }
            function changeSortOrder() {
                const sortOrder = document.getElementById('sortOrder').value;
                const urlParams = new URLSearchParams(window.location.search);
                urlParams.set('sortOrder', sortOrder);
                urlParams.set('currentPage', 1); // Reset to first page
                window.location.search = urlParams.toString();
            }
        </script>
    </body>

</html>
