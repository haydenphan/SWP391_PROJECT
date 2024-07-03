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
                    <div class="course-sidebar-tab">
                        <div class="course-sidebar-wrapper">
                            <div class="curse-tab-left-wrap">
                                <div class="course-results">
                                    Showing <span class="course-result-showing">15</span> of <span class="course-result-number">60</span> results
                                </div>
                            </div>
                            <div class="couse-dropdown">
                                <div class="course-drop-inner">
                                    <select name="sortOrder" form="filterForm" onchange="applyFilters()">
                                        <option value="latest">Newly published</option>
                                        <option value="popularity">Most Viewed</option>
                                        <option value="rating">5 Star Rated</option>
                                        <option value="duration">Duration</option>
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