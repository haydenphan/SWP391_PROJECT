<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartDetails" %>
<%@ page import="model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../template/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function deleteOrder(courseID) {
                var contextPath = '<%= request.getContextPath() %>';
                var url = contextPath + "/Cart/remove-from-cart?CourseID=" + courseID;
                $.ajax({
                    url: url,
                    type: "get",
                    dataType: "json",
                    success: function (responseData) {
                        if (responseData.success) {
                            document.getElementById("product-row-" + courseID).remove();
                            updateCartTotals();
                            alert('Item removed successfully');
                        } else {
                            alert('Failed to remove item from cart');
                        }
                    },
                    error: function () {
                        alert('Failed to remove item from cart');
                    }
                });
                location.reload();
            }

            $(document).ready(function () {
                $("#cancelOrderBtn").click(function () {
                    if (confirm("Are you sure you want to delete all courses in cart?")) {
                        var contextPath = '<%= request.getContextPath() %>';
                        var url = contextPath + "/Cart/cancelcart";
                        $.ajax({
                            url: url,
                            type: "get",
                            success: function (responseData) {
                                alert("Courses have been deleted.");
                                window.location.href = contextPath + "/CourseList";
                            },
                            error: function () {
                                alert('Failed to delete all courses');
                            }
                        });
                    }
                });
                $("#proceedToCheckoutBtn").click(function () {
                    var cartIsEmpty = ${fn:length(cartDetails) == 0};
                    if (cartIsEmpty) {
                        alert("Please add product to cart before checkout");
                    } else {
                        var contextPath = '<%= request.getContextPath() %>';
                        window.location.href = contextPath + "/pages/checkout.jsp?total=${total}";
                    }
                });
            });
        </script>
        <style>
            .btn-view-course {
                display: inline-block;
                padding: 10px 20px;
                padding-top: 10px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                text-align: center;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .btn-view-course:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <%@ include file="../template/preLoader.jsp" %>
        <%@ include file="../template/sideToggle.jsp" %>
        <%@ include file="../template/header.jsp" %>

        <main>
            <div class="hero-arera course-item-height" data-background="assets/img/slider/course-slider.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-course-1-text">
                                <h2>My Cart</h2>
                            </div>
                            <div class="course-title-breadcrumb">
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/pages/home.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Cart</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="cart-area pt-100 pb-100">
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
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty cartDetails}">
                                                <c:forEach var="item" items="${cartDetails}">
                                                    <c:set var="course" value="${item.course}" />
                                                    <tr id="product-row-${course.courseID}">
                                                        <td class="product-thumbnail">
                                                            <a href="${pageContext.request.contextPath}/course-details.jsp?CourseID=${course.courseID}">
                                                                <img src="${course.imageURL}" alt="">
                                                            </a>
                                                        </td>
                                                        <td class="product-name">
                                                            <a href="${pageContext.request.contextPath}/course-details.jsp?CourseID=${course.courseID}">${course.courseName}</a>
                                                        </td>
                                                        <td class="product-price">
                                                            <span class="amount">$${item.price}</span>
                                                        </td>
                                                        <td class="product-remove">
                                                            <a href="javascript:void(0);" onclick="deleteOrder(${course.courseID})">
                                                                <i class="fa fa-times"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="4">Your cart is empty.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="coupon-all">
                                        <div class="coupon d-flex align-items-center">
                                            <input id="coupon_code" class="input-text" name="coupon_code" value=""
                                                   placeholder="Coupon code" type="text">
                                            <button class="edu-btn" name="apply_coupon" type="submit">Apply coupon</button>
                                        </div>
                                        <div class="coupon2">
                                            <button onClick="window.location.reload()" class="edu-btn" name="update_cart"
                                                    type="submit">Update cart</button>
                                            <button class="edu-btn" id="cancelOrderBtn">Delete All Courses</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 ml-auto">
                                    <div class="cart-page-total">
                                        <h2>Cart totals</h2>
                                        <ul class="mb-20">
                                            <li>Total <span id="total">$<c:out value="${total != null ? total : 0}" /></span></li>
                                        </ul>
                                        <button id="proceedToCheckoutBtn" class="edu-border-btn">Proceed to checkout</button>
                                        <a href="${pageContext.request.contextPath}/CourseList" class="btn-view-course">Continue to View Course</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <%@ include file="../template/footer.jsp" %>
        <%@ include file="../template/backToTop.jsp" %>
        <%@ include file="../template/script.jsp" %>
    </body>
</html>
