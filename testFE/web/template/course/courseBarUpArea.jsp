<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- course-bar up-area -->
<div class="course-bar-up-area pt-120">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="course-main-wrapper mb-30">
                    <div class="bar-filter">
                        <i class="flaticon-filter"></i>
                        <span>Filter</span>
                        <span>(2)</span>
                    </div>
                    <div class="corse-bar-wrapper">
                        <div class="bar-search">
                            <form action="#">
                                <div class="bar-secrch-icon position-relative">
                                    <input type="text" placeholder="Search keyword...">
                                    <button type="submit"><i class="far fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="course-sidebar-tab">
                        <div class="course-sidebar-wrapper">
                            <div class="curse-tab-left-wrap">
                                <div class="course-results">
                                    <% 
                                    // Assuming 'courses' is the attribute name for the list of courses
                                    List<Course> crs = (List<Course>) request.getAttribute("courses");
                                    int totalCourses = (crs != null) ? crs.size() : 0;
                                    %>
                                    Showing <span class="course-result-showing"><%= totalCourses %></span> of <span
                                        class="course-result-number">${totalResults}</span> results
                                </div>
                            </div>
                            <div class="couse-dropdown">
                                <div class="course-drop-inner">
                                    <select id="sortOrder" class="form-control" onchange="changeSortOrder()">
                                        <option value="latest">Newly published</option>
                                        <option value="popularity">Most Viewed</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- course-bar up-area-end -->
