<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <%-- Include head template --%>
        <%@ include file="../template/head.jsp" %>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            /* Background and general styles */
            body {
                background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
                font-family: 'Poppins', sans-serif;
                color: #333;
                padding-top: 50px;
            }
            .container {
                margin-top: 30px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            h1 {
                color: #333;
                margin-bottom: 40px;
                text-align: center;
                font-size: 2.5rem;
                font-weight: 600;
            }
            .lecture-card {
                border: none;
                border-radius: 0px 0px 15px 15px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
                position: relative;
                overflow: hidden;
            }
            .lecture-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }
            .lecture-title {
                font-size: 1.5rem;
                color: #2467EC;
                transition: color 0.3s ease-in-out;
                text-align: center;
                font-weight: 600;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                background-color: #2467EC;
                color: white;
                padding: 10px 0;
            }
            .lecture-title form {
                display: inline-flex;
                align-items: center;
            }
            .lecture-title input[type="text"] {
                border: none;
                font-size: 1.5rem;
                text-align: center;
                background-color: transparent;
                outline: none;
                margin-right: 5px;
                width: auto;
                flex-grow: 1;
                color: white;
                padding: 10px;
            }
            .lecture-title button {
                background: none;
                border: none;
                cursor: pointer;
                color: white;
                font-size: 1.5rem;
                padding: 0;
            }
            .lecture-title button:hover {
                color: #FFB013;
            }
            .lecture-link {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 15px;
            }
            .lecture-link:hover {
                color: #0056b3;
                text-decoration: underline;
            }
            .material-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .material-list li {
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 5px 0;
                border-bottom: 1px solid #ddd;
            }
            .material-list a {
                color: #2467EC;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease-in-out;
            }
            .material-list a:hover {
                color: #FFB013;
                text-decoration: underline;
            }
            .material-list .delete-material {
                color: red;
                margin-left: 10px;
                cursor: pointer;
                font-size: 1.2rem;
            }
            .floating-icons {
                position: absolute;
                top: -20px;
                right: -20px;
                width: 100px;
                height: 100px;
                background: rgba(36, 103, 236, 0.1);
                border-radius: 50%;
                z-index: 0;
            }
            .floating-icons::before, .floating-icons::after {
                content: '';
                position: absolute;
                border-radius: 50%;
                background: rgba(36, 103, 236, 0.1);
            }
            .floating-icons::before {
                width: 60px;
                height: 60px;
                top: -10px;
                left: 30px;
            }
            .floating-icons::after {
                width: 80px;
                height: 80px;
                top: 20px;
                right: 20px;
            }
            .lecture-number {
                position: absolute;
                top: 5px;
                left: 20px;
                color: white;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1rem;
                font-weight: bold;
                background-color: #2467EC;
                z-index: 2;
            }
            .edit-upload {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 15px 0;
            }
            .edit-upload form {
                display: inline-flex;
                align-items: center;
                margin-left: 10px;
            }
            .edit-upload label {
                background-color: #2467EC;
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
                margin-left: 10px;
                font-weight: 600;
            }
            .edit-upload label:hover {
                background-color: #FFB013;
            }
            .add-material {
                background-color: #28a745;
                color: white;
                padding: 10px;
                border-radius: 50%;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
                height: 35px;
                width: 35px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-left: 10px;
                font-size: 1.2rem;
            }
            .add-material:hover {
                background-color: #218838;
            }
            .add-section-btn {
                position: absolute;
                top: 20px;
                right: 20px;
                background-color: #2467EC;
                color: white;
                border: none;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 24px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .add-section-btn:hover {
                background-color: #FFB013;
            }
            .no-lectures {
                text-align: center;
                margin-top: 2rem;
                font-size: 1.5rem;
                color: #555;
                width: 100%;
            }
            /* Keyframes for floating effect */
            @keyframes floating {
                0% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-10px);
                }
                100% {
                    transform: translateY(0);
                }
            }
            .floating-icons {
                animation: floating 4s ease-in-out infinite;
            }
            /* Form field styles */
            .form-control {
                font-size: 1rem;
                border-radius: 5px;
                border: 2px solid #ddd;
                transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }
            .form-control:focus {
                border-color: #2467EC;
                box-shadow: 0 0 8px rgba(36, 103, 236, 0.2);
            }
            .form-control-file {
                font-size: 1rem;
                border-radius: 5px;
                transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }
            .form-control-file:focus {
                border-color: #2467EC;
                box-shadow: 0 0 8px rgba(36, 103, 236, 0.2);
            }
            .modal-header, .modal-footer {
                border: none;
            }
            .modal-title {
                font-weight: 600;
            }
            .btn-primary, .btn-secondary {
                font-weight: 600;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }
            .btn-primary:hover, .btn-secondary:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Lectures Of Section ${section.sectionOrder} - ${section.sectionName}</h1>
            <button class="btn btn-primary add-section-btn" data-toggle="modal" data-target="#addLectureModal">+</button>
            <div class="row">
                <c:if test="${fn:length(lectures) == 0}">
                    <div class="no-lectures">
                        No lectures available. Please add a new lecture.
                    </div>
                </c:if>
                <c:forEach var="lecture" items="${lectures}" varStatus="status">
                    <div class="col-md-6 col-lg-4">
                        <div class="lecture-number">${status.index + 1}</div>
                        <div class="lecture-title">
                            <form method="POST" action="${pageContext.request.contextPath}/lecture-management">
                                <input type="hidden" name="action" value="edit-name">
                                <input type="hidden" name="sectionId" value="${section.sectionID}">
                                <input type="hidden" name="lectureId" value="${lecture.lectureID}">
                                <input name="lectureName" type="text" value="${lecture.lectureName}" oninput="adjustInputWidth(this)">
                                <button type="submit"><i class="fas fa-edit"></i></button>
                            </form>
                        </div>
                        <div class="lecture-card">
                            <div class="edit-upload">
                                <a class="lecture-link" href="${lecture.lectureURL}" target="_blank">Watch Current Video</a>
                                <form method="POST" action="${pageContext.request.contextPath}/lecture-management?action=edit-video&sectionId=${section.sectionID}&lectureId=${lecture.lectureID}" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="edit-video">
                                    <label for="videoUpload-${status.index}">Upload Video</label>
                                    <input style="display: none;" id="videoUpload-${status.index}" name="lectureVideo" type="file" accept="video/*" onchange="this.form.submit()">
                                </form>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin: 15px 0;">
                                <h4>Materials:</h4>
                                <form method="POST" action="${pageContext.request.contextPath}/lecture-management" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="add-material">
                                    <input type="hidden" name="sectionId" value="${section.sectionID}">
                                    <input type="hidden" name="lectureId" value="${lecture.lectureID}">
                                    <label class="add-material" for="materialUpload-${status.index}">+</label>
                                    <input style="display: none;" id="materialUpload-${status.index}" name="lectureMaterial" type="file" accept=".pdf,.doc,.docx,.ppt,.pptx,.xls,.xlsx" onchange="this.form.submit()">
                                </form> 
                            </div>
                            <ul class="material-list">
                                <c:forEach var="material" items="${lecture.lectureMaterials}" varStatus="status">
                                    <li>
                                        <a href="${material.lectureMaterialUrl}" target="_blank">View Material ${status.index + 1}</a>
                                        <form method="POST" action="${pageContext.request.contextPath}/lecture-management" style="display:inline;">
                                            <input type="hidden" name="action" value="delete-material">
                                            <input type="hidden" name="sectionId" value="${section.sectionID}">
                                            <input type="hidden" name="materialId" value="${material.lectureMaterialId}">
                                            <button type="submit" class="delete-material"><i class="fas fa-times"></i></button>
                                        </form>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Modal for Adding New Lecture -->
        <div class="modal fade" id="addLectureModal" tabindex="-1" role="dialog" aria-labelledby="addLectureModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addLectureModalLabel">Add New Lecture</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/lecture-management" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="add-lecture">
                            <input type="hidden" name="sectionId" value="${section.sectionID}">
                            <div class="form-group">
                                <label for="lectureName">Lecture Name</label>
                                <input type="text" class="form-control" id="lectureName" name="lectureName" required>
                            </div>
                            <div class="form-group">
                                <label for="lectureVideo">Upload Lecture Video</label>
                                <input type="file" class="form-control-file" id="lectureVideo" name="lectureVideo" accept="video/*" required>
                            </div>
                            <div class="form-group">
                                <label for="lectureMaterials">Upload Lecture Materials</label>
                                <div id="materialUploads">
                                    <div class="input-group mb-2">
                                        <input type="file" class="form-control-file" name="lectureMaterials" accept=".pdf,.doc,.docx,.ppt,.pptx,.xls,.xlsx">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-danger remove-material">&times;</button>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-secondary mt-2" id="addMaterialField">+</button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Lecture</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <!-- Include script template -->
        <%@ include file="../template/script.jsp" %>

        <script>
                                        document.getElementById('addMaterialField').addEventListener('click', function () {
                                            var newFieldContainer = document.createElement('div');
                                            newFieldContainer.className = 'input-group mb-2';

                                            var newField = document.createElement('input');
                                            newField.type = 'file';
                                            newField.name = 'lectureMaterials';
                                            newField.className = 'form-control-file';
                                            newField.accept = '.pdf,.doc,.docx,.ppt,.pptx,.xls,.xlsx';

                                            var removeButton = document.createElement('button');
                                            removeButton.type = 'button';
                                            removeButton.className = 'btn btn-danger remove-material';
                                            removeButton.innerHTML = '&times;';

                                            var inputGroupAppend = document.createElement('div');
                                            inputGroupAppend.className = 'input-group-append';
                                            inputGroupAppend.appendChild(removeButton);

                                            newFieldContainer.appendChild(newField);
                                            newFieldContainer.appendChild(inputGroupAppend);

                                            document.getElementById('materialUploads').appendChild(newFieldContainer);

                                            // Add event listener for the remove button
                                            removeButton.addEventListener('click', function () {
                                                newFieldContainer.remove();
                                            });
                                        });

                                        // Add event listener for existing remove button
                                        document.querySelectorAll('.remove-material').forEach(function (button) {
                                            button.addEventListener('click', function () {
                                                button.closest('.input-group').remove();
                                            });
                                        });

                                        function adjustInputWidth(input) {
                                            input.style.width = (input.value.length + 1) + 'ch';
                                        }

                                        document.addEventListener('DOMContentLoaded', function () {
                                            document.querySelectorAll('.lecture-title input').forEach(function (input) {
                                                adjustInputWidth(input);
                                            });
                                        });
        </script>
    </body>
</html>
