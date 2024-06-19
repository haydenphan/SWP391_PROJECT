<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartDetails" %>
<%@ page import="model.Course" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <%@ include file="../template/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function deleteCourse(courseID) {
                var contextPath = '<%= request.getContextPath() %>';
                var url = contextPath + "/Wishlist/remove-from-wishlist?CourseID=" + courseID;
                $.ajax({
                    url: url,
                    type: "get",
                    success: function (responseData) {
                        document.getElementById("product-row-" + courseID).remove();
                    },
                    error: function () {
                        alert('Failed to remove item from Wishlist');
                    }
                });
                location.reload();
            }
        </script>
    </head>
    <body>
        <%@ include file="../template/preLoader.jsp" %>
        <%@ include file="../template/sideToggle.jsp" %>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- hero-area-start -->
            <div class="hero-arera course-item-height" data-background="assets/img/slider/course-slider.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-course-1-text">
                                <h2>My Wishlist</h2>
                            </div>
                            <div class="course-title-breadcrumb">
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- hero-area-end -->

            <!-- Wishlist Area Start -->
            <div class="wishlist_area section_padding">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-content table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Images</th>
                                            <th class="cart-product-name">Product</th>
                                            <th class="product-price">Unit Price</th>
                                            <th class="product-AddToCart">Add To Cart</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                        Cart wishlist = (Cart) request.getAttribute("wishlist");
                                        List<CartDetails> cartDetails = wishlist.getCartDetails();
                                        if (cartDetails != null && !cartDetails.isEmpty()) {
                                            for (CartDetails item : cartDetails) {
                                                Course course = item.getCourse();
                                        %>
                                        <tr id="product-row-<%= course.getCourseID() %>">
                                            <td class="product-thumbnail"><img src="<%= course.getImageURL() %>" alt=""></td>
                                            <td class="product-name"><a href="course-details.html"><%= course.getCourseName() %></a></td>
                                            <td class="product-price">$<%= course.getPrice() %></td>
                                            <td class="product-AddToCart">
                                                <a href="<%= request.getContextPath() %>/Cart/add-to-cart?CourseID=<%= course.getCourseID() %>" class="edu-border-btn">Add To Cart</a>
                                            </td> 
                                            <td class="product-remove">
                                                <a href="javascript:void(0);" onclick="deleteCourse(<%= course.getCourseID() %>)">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <% 
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="6">Your Wishlist is empty.</td>
                                        </tr>
                                        <% 
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Wishlist Area End -->
        </main>

        <%@ include file="../template/footer.jsp" %>
        <%@ include file="../template/backToTop.jsp" %>
        <%@ include file="../template/script.jsp" %>
    </body>
</html>
