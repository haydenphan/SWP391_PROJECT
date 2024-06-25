<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Create Sections and Lectures</title>
        <link rel="stylesheet" href="path/to/your/css/styles.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <h1>Create Sections and Lectures for Course</h1>

        <form id="sectionLectureForm" action="section-lecture-servlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="courseId" value="${param.courseId}">

            <div id="sections">
                <div class="section">
                    <h2>Section 1</h2>
                    <label for="sectionTitle1">Section Title:</label>
                    <input type="text" name="sectionTitle1" id="sectionTitle1" required>
                    <button type="button" class="addLectureBtn">Add Lecture</button>

                    <div class="lectures">
                        <div class="lecture">
                            <h3>Lecture 1</h3>
                            <label for="lectureTitle1_1">Lecture Title:</label>
                            <input type="text" name="lectureTitle1_1" id="lectureTitle1_1" required>
                            <label for="lectureVideo1_1">Video:</label>
                            <input type="file" name="lectureVideo1_1" id="lectureVideo1_1" accept="video/*" required>
                            <label for="lectureMaterial1_1">Material:</label>
                            <input type="file" name="lectureMaterial1_1" id="lectureMaterial1_1" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                            <button type="button" class="deleteLectureBtn">Delete Lecture</button>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" id="addSectionBtn">Add Section</button>
            <button type="submit">Save</button>
        </form>

        <script>
            let sectionCount = 1;
            let lectureCount = [1];

            $(document).ready(function () {
                $('#addSectionBtn').click(function () {
                    sectionCount++;
                    lectureCount.push(1);
                    const sectionHtml = `
                        <div class="section">
                            <h2>Section ${sectionCount}</h2>
                            <label for="sectionTitle${sectionCount}">Section Title:</label>
                            <input type="text" name="sectionTitle${sectionCount}" id="sectionTitle${sectionCount}" required>
                            <button type="button" class="addLectureBtn">Add Lecture</button>
                        
                            <div class="lectures">
                                <div class="lecture">
                                    <h3>Lecture 1</h3>
                                    <label for="lectureTitle${sectionCount}_1">Lecture Title:</label>
                                    <input type="text" name="lectureTitle${sectionCount}_1" id="lectureTitle${sectionCount}_1" required>
                                    <label for="lectureVideo${sectionCount}_1">Video:</label>
                                    <input type="file" name="lectureVideo${sectionCount}_1" id="lectureVideo${sectionCount}_1" accept="video/*" required>
                                    <label for="lectureMaterial${sectionCount}_1">Material:</label>
                                    <input type="file" name="lectureMaterial${sectionCount}_1" id="lectureMaterial${sectionCount}_1" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                                    <button type="button" class="deleteLectureBtn">Delete Lecture</button>
                                </div>
                            </div>
                        </div>
                    `;
                    $('#sections').append(sectionHtml);
                });

                $(document).on('click', '.addLectureBtn', function () {
                    const sectionIndex = $(this).closest('.section').index();
                    lectureCount[sectionIndex]++;
                    const lectureHtml = `
                        <div class="lecture">
                            <h3>Lecture ${lectureCount[sectionIndex]}</h3>
                            <label for="lectureTitle${sectionIndex+1}_${lectureCount[sectionIndex]}">Lecture Title:</label>
                            <input type="text" name="lectureTitle${sectionIndex+1}_${lectureCount[sectionIndex]}" id="lectureTitle${sectionIndex+1}_${lectureCount[sectionIndex]}" required>
                            <label for="lectureVideo${sectionIndex+1}_${lectureCount[sectionIndex]}">Video:</label>
                            <input type="file" name="lectureVideo${sectionIndex+1}_${lectureCount[sectionIndex]}" id="lectureVideo${sectionIndex+1}_${lectureCount[sectionIndex]}" accept="video/*" required>
                            <label for="lectureMaterial${sectionIndex+1}_${lectureCount[sectionIndex]}">Material:</label>
                            <input type="file" name="lectureMaterial${sectionIndex+1}_${lectureCount[sectionIndex]}" id="lectureMaterial${sectionIndex+1}_${lectureCount[sectionIndex]}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                            <button type="button" class="deleteLectureBtn">Delete Lecture</button>
                        </div>
                    `;
                    $(this).siblings('.lectures').append(lectureHtml);
                });

                $(document).on('click', '.deleteLectureBtn', function () {
                    $(this).closest('.lecture').remove();
                });
            });
        </script>
    </body>
</html>