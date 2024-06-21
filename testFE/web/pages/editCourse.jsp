<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../template/head.jsp" %>


<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
//    List<Category> categories = CategoryDAO.getAllCategories();
    List<CourseSection> sections = (List<CourseSection>) request.getAttribute("sections");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .section {
            border: 1px solid #e9ecef;
            background-color: #f8f9fa;
            padding: 15px;
            margin-bottom: 20px;
        }
        .lecture {
            border: 1px solid #dee2e6;
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body class="layout-top-nav light-skin theme-primary">
<div class="wrapper">
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Edit Course</h5>
                                <p class="mb-0 card-subtitle text-muted">Edit course details, sections, and lectures below.</p>
                            </div>
                            <div class="card-body">
                                <form id="editCourseForm" action="${pageContext.request.contextPath}/edit-course-servlet" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="save">
                                    <input type="hidden" name="courseId" value="<%= currentCourse.getCourseID() %>">

                                    <h4>Course Details</h4>
                                    <div class="form-group">
                                        <label for="courseName">Course Name:</label>
                                        <input type="text" class="form-control" name="courseName" id="courseName" value="<%= currentCourse.getCourseName() %>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="courseDescription">Course Description:</label>
                                        <textarea class="form-control" name="courseDescription" id="courseDescription" rows="3" required><%= currentCourse.getDescription() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="courseImage">Course Image:</label>
                                        <input type="file" class="form-control" name="courseImage" id="courseImage" accept="image/*">
                                        <img src="<%= currentCourse.getImageURL() %>" alt="Course Image" class="img-thumbnail mt-2" width="200">
                                    </div>
                                    <div class="form-group">
                                        <label for="coursePrice">Course Price:</label>
                                        <input type="number" class="form-control" name="coursePrice" id="coursePrice" value="<%= currentCourse.getPrice() %>" required>
                                    </div>
<!--                                    <div class="form-group">
                                        <label for="courseCategory">Course Category:</label>
                                        <select class="form-control" name="courseCategory" id="courseCategory" required>
                                            
                                        </select>
                                    </div>-->

                                    <h4>Course Sections and Lectures</h4>
                                    <input type="hidden" id="sectionCount" name="sectionCount" value="<%= sections.size() %>">
                                    <div id="sections">
                                        <c:forEach var="section" items="${sections}" varStatus="secStatus">
                                            <div class="section mb-3">
                                                <h4>Section ${secStatus.index + 1}</h4>
                                                <input type="hidden" id="sectionId" name="sectionId" value="${section.sectionID}">
                                                <input type="hidden" id="lectureCount${secStatus.index + 1}" name="lectureCount${secStatus.index + 1}" value="${section.lectures.size()}">
                                                <div class="form-group">
                                                    <label for="sectionTitle${secStatus.index + 1}">Section Title:</label>
                                                    <input type="text" class="form-control" name="sectionTitle${secStatus.index + 1}" id="sectionTitle${secStatus.index + 1}" value="${section.sectionName}" required>
                                                </div>
                                                <button type="button" class="btn btn-success addLectureBtn mb-3">Add Lecture</button>
                                                <div class="lectures">
                                                    <c:forEach var="lecture" items="${section.lectures}" varStatus="lecStatus">
                                                        <div class="lecture mb-3">
                                                            <h6>Lecture ${lecStatus.index + 1}</h6>
                                                            <input type="hidden" id="lectureId" name="lectureId" value="${lecture.lectureID}">
                                                            <div class="form-group">
                                                                <label for="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}">Lecture Title:</label>
                                                                <input type="text" class="form-control" name="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}" value="${lecture.lectureName}" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}">Video:</label>
                                                                <input type="file" class="form-control" name="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}" accept="video/*">
                                                                <a href="${lecture.lectureURL}" target="_blank">Current Video</a>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}">Material:</label>
                                                                <input type="file" class="form-control" name="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                                                                <a href="${lecture.getMaterialURL()}" target="_blank">Current Material</a>
                                                            </div>
                                                            <button type="button" class="btn btn-danger deleteLectureBtn">Delete Lecture</button>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button type="button" class="btn btn-danger deleteSectionBtn">Delete Section</button>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <button type="button" id="addSectionBtn" class="btn btn-primary">Add Section</button>
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<!-- Vendor JS -->
<script src="${pageContext.request.contextPath}/adminCSS/js/vendors.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/icons/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/adminCSS/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/adminCSS/js/jquery.smartmenus.js"></script>
<script src="${pageContext.request.contextPath}/adminCSS/js/menus.js"></script>
<script src="${pageContext.request.contextPath}/adminCSS/js/template.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        let sectionCount = <%= sections.size() %>;

        $('#addSectionBtn').click(function () {
            sectionCount++;
            $('#sectionCount').val(sectionCount);
            const sectionHtml = `
                <div class="section mb-3">
                    <h4>Section ${sectionCount}</h4>
                    <input type="hidden" id="lectureCount${sectionCount}" name="lectureCount${sectionCount}" value="1">
                    <div class="form-group">
                        <label for="sectionTitle${sectionCount}">Section Title:</label>
                        <input type="text" class="form-control" name="sectionTitle${sectionCount}" id="sectionTitle${sectionCount}" required>
                    </div>
                    <button type="button" class="btn btn-success addLectureBtn mb-3">Add Lecture</button>
                    <div class="lectures">
                        <div class="lecture mb-3">
                            <h6>Lecture 1</h6>
                            <div class="form-group">
                                <label for="lectureTitle${sectionCount}_1">Lecture Title:</label>
                                <input type="text" class="form-control" name="lectureTitle${sectionCount}_1" id="lectureTitle${sectionCount}_1" required>
                            </div>
                            <div class="form-group">
                                <label for="lectureVideo${sectionCount}_1">Video:</label>
                                <input type="file" class="form-control" name="lectureVideo${sectionCount}_1" id="lectureVideo${sectionCount}_1" accept="video/*" required>
                            </div>
                            <div class="form-group">
                                <label for="lectureMaterial${sectionCount}_1">Material:</label>
                                <input type="file" class="form-control" name="lectureMaterial${sectionCount}_1" id="lectureMaterial${sectionCount}_1" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                            </div>
                            <button type="button" class="btn btn-danger deleteLectureBtn">Delete Lecture</button>
                        </div>
                    </div>
                    <button type="button" class="btn btn-danger deleteSectionBtn">Delete Section</button>
                </div>
            `;
            $('#sections').append(sectionHtml);
            updateSectionNumbers();
        });

        // Handle adding lecture
        $('#sections').on('click', '.addLectureBtn', function () {
            const section = $(this).closest('.section');
            const sectionIndex = section.index() + 1;
            const lectureCount = section.find('.lecture').length + 1;
            const lectureHtml = `
                <div class="lecture mb-3">
                    <h6>Lecture ${lectureCount}</h6>
                    <div class="form-group">
                        <label for="lectureTitle${sectionIndex}_${lectureCount}">Lecture Title:</label>
                        <input type="text" class="form-control" name="lectureTitle${sectionIndex}_${lectureCount}" id="lectureTitle${sectionIndex}_${lectureCount}" required>
                    </div>
                    <div class="form-group">
                        <label for="lectureVideo${sectionIndex}_${lectureCount}">Video:</label>
                        <input type="file" class="form-control" name="lectureVideo${sectionIndex}_${lectureCount}" id="lectureVideo${sectionIndex}_${lectureCount}" accept="video/*" required>
                    </div>
                    <div class="form-group">
                        <label for="lectureMaterial${sectionIndex}_${lectureCount}">Material:</label>
                        <input type="file" class="form-control" name="lectureMaterial${sectionIndex}_${lectureCount}" id="lectureMaterial${sectionIndex}_${lectureCount}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                    </div>
                    <button type="button" class="btn btn-danger deleteLectureBtn">Delete Lecture</button>
                </div>
            `;
            section.find('.lectures').append(lectureHtml);
            $(`#lectureCount${sectionIndex}`).val(lectureCount);
            updateSectionNumbers();
        });

        // Handle deleting lecture
        $('#sections').on('click', '.deleteLectureBtn', function () {
            const section = $(this).closest('.section');
            const sectionIndex = section.index() + 1;
            $(this).closest('.lecture').remove();
            const lectureCount = section.find('.lecture').length;
            $(`#lectureCount${sectionIndex}`).val(lectureCount);
            updateSectionNumbers();
        });

        // Handle deleting section
        $('#sections').on('click', '.deleteSectionBtn', function () {
            $(this).closest('.section').remove();
            sectionCount--;
            $('#sectionCount').val(sectionCount);
            updateSectionNumbers();
        });

        function updateSectionNumbers() {
            $('#sections .section').each(function (index) {
                $(this).find('h4').text('Section ' + (index + 1));
                const sectionIndex = index + 1;
                $(this).find('input[name^="sectionTitle"]').attr('name', 'sectionTitle' + sectionIndex);
                $(this).find('input[name^="lectureCount"]').attr('name', 'lectureCount' + sectionIndex);
                $(this).find('.lecture').each(function (lecIndex) {
                    $(this).find('h6').text('Lecture ' + (lecIndex + 1));
                    $(this).find('input[name^="lectureTitle"]').attr('name', 'lectureTitle' + sectionIndex + '_' + (lecIndex + 1));
                    $(this).find('input[name^="lectureVideo"]').attr('name', 'lectureVideo' + sectionIndex + '_' + (lecIndex + 1));
                    $(this).find('input[name^="lectureMaterial"]').attr('name', 'lectureMaterial' + sectionIndex + '_' + (lecIndex + 1));
                });
            });
        }
    });
</script>
</body>
</html>
