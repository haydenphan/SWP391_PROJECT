<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../template/head.jsp" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
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
                                            <input type="hidden" name="courseId" value="<%= currentCourse.getCourseID()%>">

                                            <h4>Course Details</h4>
                                            <div class="form-group">
                                                <label for="courseName">Course Name:</label>
                                                <input type="text" class="form-control" name="courseName" id="courseName" value="<%= currentCourse.getCourseName()%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="courseDescription">Course Description:</label>
                                                <textarea class="form-control" name="courseDescription" id="courseDescription" rows="3" required><%= currentCourse.getDescription()%></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="courseImage">Course Image:</label>
                                                <input type="file" class="form-control" name="courseImage" id="courseImage" accept="image/*">
                                                <img src="<%= currentCourse.getImageURL()%>" alt="Course Image" class="img-thumbnail mt-2" width="200">
                                                <input type="hidden" name="currentCourseImage" value="<%= currentCourse.getImageURL()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="coursePrice">Course Price:</label>
                                                <input type="number" class="form-control" name="coursePrice" id="coursePrice" value="<%= currentCourse.getPrice()%>" required>
                                            </div>

                                            <h4>Course Sections and Lectures</h4>
                                            <input type="hidden" name="sectionCount" id="sectionCount" value="<%= sections.size()%>">
                                            <div id="sections">
                                                <c:forEach var="section" items="${sections}" varStatus="secStatus">
                                                    <div class="section mb-3" data-section-index="${secStatus.index + 1}">
                                                        <h4>Section ${secStatus.index + 1}</h4>
                                                        <input type="hidden" name="sectionId${secStatus.index + 1}" value="${section.sectionID}">
                                                        <input type="hidden" name="deleteSection${secStatus.index + 1}" id="deleteSection${secStatus.index + 1}" value="false">
                                                        <input type="hidden" id="lectureCount${secStatus.index + 1}" name="lectureCount${secStatus.index + 1}" value="${section.lectures.size()}">
                                                        <div class="form-group">
                                                            <label for="sectionTitle${secStatus.index + 1}">Section Title:</label>
                                                            <input type="text" class="form-control" name="sectionTitle${secStatus.index + 1}" id="sectionTitle${secStatus.index + 1}" value="${section.sectionName}" required>
                                                        </div>
                                                        <button type="button" class="btn btn-success addLectureBtn mb-3" data-section-index="${secStatus.index + 1}">Add Lecture</button>
                                                        <div class="lectures">
                                                            <c:forEach var="lecture" items="${section.lectures}" varStatus="lecStatus">
                                                                <div class="lecture mb-3">
                                                                    <h6>Lecture ${lecStatus.index + 1}</h6>
                                                                    <input type="hidden" name="lectureId${secStatus.index + 1}_${lecStatus.index + 1}" value="${lecture.lectureID}">
                                                                    <input type="hidden" name="deleteLecture${secStatus.index + 1}_${lecStatus.index + 1}" id="deleteLecture${secStatus.index + 1}_${lecStatus.index + 1}" value="false">
                                                                    <div class="form-group">
                                                                        <label for="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}">Lecture Title:</label>
                                                                        <input type="text" class="form-control" name="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureTitle${secStatus.index + 1}_${lecStatus.index + 1}" value="${lecture.lectureName}" required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}">Video:</label>
                                                                        <input type="file" class="form-control" name="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureVideo${secStatus.index + 1}_${lecStatus.index + 1}" accept="video/*">
                                                                        <a href="${lecture.lectureURL}" target="_blank">Current Video</a>
                                                                        <input type="hidden" name="currentLectureVideo${secStatus.index + 1}_${lecStatus.index + 1}" value="${lecture.lectureURL}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}">Material:</label>
                                                                        <input type="file" class="form-control" name="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}" id="lectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                                                                        <c:forEach var="material" items="${lecture.lectureMaterials}">
                                                                            <a href="${material.lectureMaterialUrl}" target="_blank">Current Material</a><br/>
                                                                            <input type="hidden" name="currentLectureMaterial${secStatus.index + 1}_${lecStatus.index + 1}_${material.lectureMaterialId}" value="${material.lectureMaterialUrl}">
                                                                        </c:forEach>
                                                                    </div>
                                                                    <button type="button" class="btn btn-danger deleteLectureBtn" data-section-index="${secStatus.index + 1}" data-lecture-index="${lecStatus.index + 1}">Delete Lecture</button>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <button type="button" class="btn btn-danger deleteSectionBtn" data-section-index="${secStatus.index + 1}">Delete Section</button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <button type="button" id="addSectionBtn" class="btn btn-primary">Add Section</button>
                                            <button type="submit" class="btn btn-primary">Save Changes</button>

                                        </form>
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
                let sectionCount = parseInt($('#sectionCount').val());

                $('#addSectionBtn').click(function () {
                    sectionCount++;
                    $('#sectionCount').val(sectionCount);
                    const sectionHtml = `
            <div class="section mb-3" data-section-index="${sectionCount}">
                <h4>Section ${sectionCount}</h4>
                <input type="hidden" name="sectionId${sectionCount}" value="">
                <input type="hidden" name="deleteSection${sectionCount}" id="deleteSection${sectionCount}" value="false">
                <input type="hidden" id="lectureCount${sectionCount}" name="lectureCount${sectionCount}" value="1">
                <div class="form-group">
                    <label for="sectionTitle${sectionCount}">Section Title:</label>
                    <input type="text" class="form-control" name="sectionTitle${sectionCount}" id="sectionTitle${sectionCount}" required>
                </div>
                <button type="button" class="btn btn-success addLectureBtn mb-3" data-section-index="${sectionCount}">Add Lecture</button>
                <div class="lectures">
                    <div class="lecture mb-3">
                        <h6>Lecture 1</h6>
                        <input type="hidden" name="lectureId${sectionCount}_1" value="">
                        <input type="hidden" name="deleteLecture${sectionCount}_1" id="deleteLecture${sectionCount}_1" value="false">
                        <div class="form-group">
                            <label for="lectureTitle${sectionCount}_1">Lecture Title:</label>
                            <input type="text" class="form-control" name="lectureTitle${sectionCount}_1" id="lectureTitle${sectionCount}_1" required>
                        </div>
                        <div class="form-group">
                            <label for="lectureVideo${sectionCount}_1">Video:</label>
                            <input type="file" class="form-control" name="lectureVideo${sectionCount}_1" id="lectureVideo${sectionCount}_1" accept="video/*">
                        </div>
                        <div class="form-group">
                            <label for="lectureMaterial${sectionCount}_1">Material:</label>
                            <input type="file" class="form-control" name="lectureMaterial${sectionCount}_1" id="lectureMaterial${sectionCount}_1" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                        </div>
                        <button type="button" class="btn btn-danger deleteLectureBtn" data-section-index="${sectionCount}" data-lecture-index="1">Delete Lecture</button>
                    </div>
                </div>
                <button type="button" class="btn btn-danger deleteSectionBtn" data-section-index="${sectionCount}">Delete Section</button>
            </div>
        `;
                    $('#sections').append(sectionHtml);
                    updateSectionNumbers();
                });

                // Handle adding lecture
                $('#sections').on('click', '.addLectureBtn', function () {
                    const section = $(this).closest('.section');
                    const sectionIndex = $(this).data('section-index');
                    const lectureCountElem = $(`#lectureCount${sectionIndex}`);
                    let lectureCount = parseInt(lectureCountElem.val());
                    lectureCount++;
                    lectureCountElem.val(lectureCount);
                    const lectureHtml = `
            <div class="lecture mb-3">
                <h6>Lecture ${lectureCount}</h6>
                <input type="hidden" name="lectureId${sectionIndex}_${lectureCount}" value="">
                <input type="hidden" name="deleteLecture${sectionIndex}_${lectureCount}" id="deleteLecture${sectionIndex}_${lectureCount}" value="false">
                <div class="form-group">
                    <label for="lectureTitle${sectionIndex}_${lectureCount}">Lecture Title:</label>
                    <input type="text" class="form-control" name="lectureTitle${sectionIndex}_${lectureCount}" id="lectureTitle${sectionIndex}_${lectureCount}" required>
                </div>
                <div class="form-group">
                    <label for="lectureVideo${sectionIndex}_${lectureCount}">Video:</label>
                    <input type="file" class="form-control" name="lectureVideo${sectionIndex}_${lectureCount}" id="lectureVideo${sectionIndex}_${lectureCount}" accept="video/*">
                </div>
                <div class="form-group">
                    <label for="lectureMaterial${sectionIndex}_${lectureCount}">Material:</label>
                    <input type="file" class="form-control" name="lectureMaterial${sectionIndex}_${lectureCount}" id="lectureMaterial${sectionIndex}_${lectureCount}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                </div>
                <button type="button" class="btn btn-danger deleteLectureBtn" data-section-index="${sectionIndex}" data-lecture-index="${lectureCount}">Delete Lecture</button>
            </div>
        `;
                    section.find('.lectures').append(lectureHtml);
                    updateSectionNumbers();
                });

                // Handle deleting lecture
                $('#sections').on('click', '.deleteLectureBtn', function () {
                    const sectionIndex = $(this).data('section-index');
                    const lectureIndex = $(this).data('lecture-index');
                    $(`#deleteLecture${sectionIndex}_${lectureIndex}`).val("true");
                    $(this).closest('.lecture').hide();
                    updateSectionNumbers();
                });

                // Handle deleting section
                $('#sections').on('click', '.deleteSectionBtn', function () {
                    const sectionIndex = $(this).data('section-index');
                    $(`#deleteSection${sectionIndex}`).val("true");
                    $(this).closest('.section').hide();
                    updateSectionNumbers();
                });

                function updateSectionNumbers() {
                    $('#sections .section').each(function (index) {
                        const sectionIndex = index + 1;
                        $(this).attr('data-section-index', sectionIndex);
                        $(this).find('h4').text('Section ' + sectionIndex);
                        $(this).find('input[name^="sectionTitle"]').attr('name', 'sectionTitle' + sectionIndex);
                        $(this).find('input[name^="lectureCount"]').attr('id', 'lectureCount' + sectionIndex).attr('name', 'lectureCount' + sectionIndex);
                        $(this).find('.addLectureBtn').attr('data-section-index', sectionIndex);
                        $(this).find('.lecture').each(function (lecIndex) {
                            const lectureIndex = lecIndex + 1;
                            $(this).find('h6').text('Lecture ' + lectureIndex);
                            $(this).find('input[name^="lectureTitle"]').attr('name', 'lectureTitle' + sectionIndex + '_' + lectureIndex);
                            $(this).find('input[name^="lectureVideo"]').attr('name', 'lectureVideo' + sectionIndex + '_' + lectureIndex);
                            $(this).find('input[name^="lectureMaterial"]').attr('name', 'lectureMaterial' + sectionIndex + '_' + lectureIndex);
                            $(this).find('input[name^="lectureId"]').attr('name', 'lectureId' + sectionIndex + '_' + lectureIndex);
                            $(this).find('input[name^="deleteLecture"]').attr('id', 'deleteLecture' + sectionIndex + '_' + lectureIndex).attr('name', 'deleteLecture' + sectionIndex + '_' + lectureIndex);
                        });
                    });
                }
            });

        </script>
    </body>
</html>
