<%@ page import="model.User" %>
<%@ page import="DAO.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .accordion-item {
        position: relative;
    }
    .do-quiz-btn {
        display: inline-block;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        background-color: #007bff;
        text-align: center;
        text-decoration: none;
        white-space: nowrap;
        border: none;
        border-radius: 5px;
        height: 25px;
    }
</style>

<div class="course-curriculam-accodion mt-30">
    <div class="accordion" id="accordionExample">
        <c:forEach var="section" items="${sectionList}">
            <div class="accordion-item">
                <button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapse${section.sectionID}" aria-expanded="true"
                        aria-controls="collapse${section.sectionID}">
                    <span class="accordion-header d-flex align-items-center">
                        <div>
                            <span style="margin-right: 25px" class="accordion-tittle">
                                <span>${section.sectionName}</span>
                            </span>
                            <span class="accordion-tittle-inner">
                                <span>${CourseSectionDAO.getTotalLectures(section.sectionID)} lectures</span>
                            </span>
                        </div>
                    </span>
                </button>
                <div id="collapse${section.sectionID}" class="accordion-collapse collapse show"
                     aria-labelledby="heading${section.sectionID}" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <c:forEach var="lecture" items="${section.lectures}">
                            <div class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                                <div class="course-curriculum-info">
                                    <i class="flaticon-youtube"></i>
                                    <h4>${lecture.lectureName}</h4>
                                </div>
                                <div style="width: 50%" class="course-curriculum-meta">
                                    <!-- Progress Bar -->
                                    <%
                                        User user = (User) session.getAttribute("user");
                                    %>

                                    <div class="progress" style="width: 100%; margin-right: 10px;">
                                        <div class="progress-bar" role="progressbar" style="width: ${LectureProgressDAO.getLectureProgress(user.getUserID(), lecture.getLectureID())}%;"
                                             aria-valuenow="${LectureProgressDAO.getLectureProgress(user.getUserID(), lecture.getLectureID())}" aria-valuemin="0" aria-valuemax="100">
                                            ${LectureProgressDAO.getLectureProgress(user.getUserID(), lecture.getLectureID())}%
                                        </div>
                                    </div>
                                    <!-- Enrollment Button or Lock Icon -->
                                    <c:choose>
                                        <c:when test="${hasEnrolled || user.getRole() == 3}">
                                            <c:choose>
                                                <c:when test="${LectureProgressDAO.getLectureProgress(user.getUserID(), lecture.getLectureID()) == 0}">
                                                    <a style="width: 30%; height: 36px;" href="${pageContext.request.contextPath}/lecture-details?lectureID=${lecture.lectureID}" class="btn btn-primary">Start</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a style="width: 30%; height: 36px; background-color: #009900; border: none" href="${pageContext.request.contextPath}/lecture-details?lectureID=${lecture.lectureID}" class="btn btn-primary">Continue</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="time"><i class="flaticon-lock"></i></span>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="course-curriculum-content d-sm-flex justify-content-between align-items-center">
                            <div class="course-curriculum-info">
                                <!-- Optional: Any additional content here -->
                            </div>
                            <div style="width: 10%" class="course-curriculum-meta">
                                <c:choose>
                                    <c:when test="${hasEnrolled || user.getRole() == 3}">
                                        <a href="${pageContext.request.contextPath}/student-course-section-servlet?sectionId=${section.sectionID}" class="do-quiz-btn">Do Quiz</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="time"><i class="flaticon-lock"></i></span>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
