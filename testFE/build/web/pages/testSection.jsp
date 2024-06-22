<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Vendors Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <%@ include file="../template/head.jsp" %>
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

    <body class="layout-top-nav light-skin theme-primary ">

        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <div class="container-full">
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Create Sections and Lectures for Course</h5>
                                        <p class="mb-0 card-subtitle text-muted">Fill in the details for sections and lectures below.</p>
                                    </div>
                                    <div class="card-body">
                                        <form id="sectionLectureForm" action="../section-lecture-servlet" method="post"
                                              enctype="multipart/form-data">
                                            <input type="hidden" name="courseId" value="<%=request.getParameter("courseId")%>">
                                            <input type="hidden" id="sectionCount" name="sectionCount" value="0">

                                            <div id="sections">
                                                <!-- Sections will be added here -->
                                            </div>
                                            <button type="button" id="addSectionBtn" class="btn btn-primary">Add Section</button>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- /.content -->
                </div>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- ./wrapper -->

        <!-- Page Content overlay -->

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
                let sectionCount = 0;

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
                                        <input type="file" class="form-control" name="lectureMaterial${sectionCount}_1[]" id="lectureMaterial${sectionCount}_1" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                                        <button type="button" class="btn btn-info addMaterialBtn">Add Material</button>
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
                                <input type="file" class="form-control" name="lectureMaterial${sectionIndex}_${lectureCount}[]" id="lectureMaterial${sectionIndex}_${lectureCount}" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
                                <button type="button" class="btn btn-info addMaterialBtn">Add Material</button>
                            </div>
                            <button type="button" class="btn btn-danger deleteLectureBtn">Delete Lecture</button>
                        </div>
                    `;
                    section.find('.lectures').append(lectureHtml);
                    $(`#lectureCount${sectionIndex}`).val(lectureCount);
                    updateSectionNumbers();
                });

                // Handle adding material
                $('#sections').on('click', '.addMaterialBtn', function () {
                    const materialField = $(this).siblings('input[type="file"]').first().clone();
                    $(this).before(materialField);
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
                            $(this).find('input[name^="lectureMaterial"]').attr('name', 'lectureMaterial' + sectionIndex + '_' + (lecIndex + 1) + '[]');
                        });
                    });
                }
            });
        </script>
    </body>

</html>
