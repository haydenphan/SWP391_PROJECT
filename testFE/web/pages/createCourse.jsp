<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
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


            <!-- User Profile Start-->
            <div class="course-details-area pt-120 pb-100">
                <div class="container">

                                            <!-- Page Heading -->
                                            <h1 class="h3 mb-2 text-gray-800 pb-4">Adding Course</h1>

                                            <form action="createCourse" method="POST" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-md-7">
                                                        <div class="form-group row">
                                                            <label for="Name" class="col-sm-2 col-form-label">Course
                                                                Name</label>
                                                            <div class="col-sm-10">
                                                                <textarea class="form-control" id="Name" name="name"
                                                                    rows="2" placeholder="Course Description"
                                                                    required></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="Description"
                                                                class="col-sm-2 col-form-label">Course
                                                                Description</label>
                                                            <div class="col-sm-10 ">
                                                                <textarea class="form-control" id="Description"
                                                                    name="description" rows="5"
                                                                    placeholder="Course Description"
                                                                    required></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="Objective"
                                                                class="col-sm-2 col-form-label">Course Objective</label>
                                                            <div class="col-sm-10">
                                                                <textarea class="form-control" id="Objective"
                                                                    name="objective" rows="5"
                                                                    placeholder="Course Objective" required></textarea>
                                                            </div>
                                                        </div>
                                                        <fieldset class="form-group">
                                                            <div class="row">
                                                                <legend class="col-form-label col-sm-2 pt-0"> Level </legend>
                                                                <div class="col-sm-10">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="level" id="gridRadios1" value="1"
                                                                            checked>
                                                                        <label class="form-check-label"
                                                                            for="gridRadios1">
                                                                            Easy
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="level" id="gridRadios2" value="2">
                                                                        <label class="form-check-label"
                                                                            for="gridRadios2">
                                                                            Medium
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="level" id="gridRadios3" value="3">
                                                                        <label class="form-check-label"
                                                                            for="gridRadios3">
                                                                            Hard
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <div class="form-group row">
                                                            <label for="Price"
                                                                class="col-sm-2 col-form-label">Price</label>
                                                            <div class="col-sm-10">
                                                                <input type="number" step="0.01" class="form-control"
                                                                    name="price" id="Price" placeholder="Price"
                                                                    required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="catogory"
                                                                class="col-sm-2 col-form-label">Category</label>
                                                            <div class="col-sm-10">
                                                                <select id="catogory" name="catogory"
                                                                    class="form-control" required>
                                                                    <c:forEach items="${category}" var="category"
                                                                        varStatus="loop">
                                                                        <option value="${category.id}">${category.name}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="multiple-select"
                                                                class="col-sm-2 col-form-label">Instructor</label>
                                                            <div class="col-sm-10">
                                                                <label>
                                                                    <input mbsc-input id="my-input" data-dropdown="true"
                                                                        data-tags="true" />
                                                                </label>
                                                                <select id="multiple-select" multiple name="instructor"
                                                                    required>
                                                                    <c:forEach items="${listInstructor}"
                                                                        var="instructor" varStatus="loop">
                                                                        <option value="${instructor.id}">
                                                                            ${instructor.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-10">
                                                                <button type="submit"
                                                                    class="btn btn-primary">Create</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label class="form-label" for="customFile">Upload image
                                                            cover</label>
                                                        <div
                                                            class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                                                            <input id="upload" type="file" onchange="readURL(this);"
                                                                accept="image/*" class="form-control border-0"
                                                                name="images" required>
                                                        </div>
                                                        <div class="image-area mt-4">
                                                            <img id="imageResult"
                                                                src="https://bootstrapious.com/i/snippets/sn-img-upload/image.svg"
                                                                alt=""
                                                                class="img-fluid rounded shadow-sm mx-auto d-block"
                                                                style="max-height: 350px">
                                                        </div>

                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                        <!-- /.container-fluid -->

                                </div>
        
            <!-- User Profile End-->

        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <script>
            function changeAva() {
                const fileInput = document.getElementById('avatarUpload');
                const avatarImage = document.getElementById('avatarImage');
                const file = fileInput.files[0];

                if (file) {
                    // Update the avatar preview
                    avatarImage.src = window.URL.createObjectURL(file);

                    // Prepare form data
                    const formData = new FormData();
                    formData.append('avatar', file);

                    // Send the file to the server
                    fetch('${pageContext.request.contextPath}/uploadAvatar', {
                        method: 'POST',
                        body: formData
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    console.log('Avatar uploaded successfully');
                                } else {
                                    console.error('Error uploading avatar');
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                }
            }
        </script>
    </body>

</html>