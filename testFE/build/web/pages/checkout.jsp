<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.ProductCart" %>
<%@ page import="model.Course" %> <!-- Import ajouté pour la classe Course -->
<%@ page import="java.util.List" %> <!-- Import ajouté pour la classe List -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <%@ include file="../template/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <style>
            .required:after {
                content: " *";
                color: red;
            }
            .error {
                color: red;
                display: none;
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
                                <h2>Checkout</h2>
                            </div>
                            <div class="course-title-breadcrumb">
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="coupon-area pt-100 pb-30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="coupon-accordion">
                                <h3>Have a coupon? <span id="showcoupon">Click here to enter your code</span></h3>
                                <div id="checkout_coupon" class="coupon-checkout-content" style="display:none;">
                                    <div class="coupon-info">
                                        <form action="#">
                                            <p class="checkout-coupon">
                                                <input type="text" placeholder="Coupon Code">
                                                <button class="edu-btn" type="submit">Apply Coupon</button>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="checkout-area pb-70">
                <div class="container">
                    <form id="checkout-form" action="process_checkout" method="post" onsubmit="return validateForm()">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkbox-form">
                                    <h3>Billing Details</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label class="required">First Name</label>
                                                <input type="text" name="firstName" value="${user != null ? user.firstName : ''}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label class="required">Last Name</label>
                                                <input type="text" name="lastName" value="${user != null ? user.lastName : ''}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list" style="width: 150%">
                                                <label class="required">Email Address</label>
                                                <input type="email" name="email" value="${user != null ? user.email : ''}" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="your-order">
                                    <h3>Your order</h3>
                                    <div class="your-order-table table-responsive">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product-name">Product</th>
                                                    <th class="product-unitprice">Unit Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");
                                                double total = 0;
                                                if (cart != null && !cart.isEmpty()) {
                                                    for (ProductCart item : cart.values()) {
                                                        Course course = item.getCourse();
                                                        double itemTotal = course.getPrice();
                                                        total += itemTotal;
                                                %>
                                                <tr id="product-row-<%= course.getCourseID() %>">
                                                    <td class="product-name">
                                                        <a href="<%= request.getContextPath() %>/Cart-order.jsp?CourseID=<%= course.getCourseID() %>"><%= course.getCourseName() %></a>
                                                    </td>
                                                    <td class="product-unitprice">
                                                        <span class="amount">$<%= course.getPrice() %></span>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                            <tfoot>
                                                <tr class="order-total" style="color: #005C78; font-family: fantasy">
                                                    <th>Order Total</th>
                                                    <th>$<%= total %></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="payment-method">
                                        <div class="payment-accordion">
                                            <div class="accordion" id="checkoutAccordion">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="paypal">
                                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#paypalPayment" aria-expanded="false" aria-controls="paypalPayment">VN Pay</button>
                                                    </h2>
                                                    <div id="paypalPayment" class="accordion-collapse collapse" aria-labelledby="paypal">
                                                        <div class="accordion-body">
                                                            Pay via VNPay; you can pay with your credit card if you don't have a VNPay account.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-button-payment mt-20">
                                            <button class="edu-btn" type="submit">Payment</button>
<!--                                            <button class="edu-btn" id="cancelOrderBtn">Cancel Order</button>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </main>

        <%@ include file="../template/footer.jsp" %>
        <%@ include file="../template/backToTop.jsp" %>
        <%@ include file="../template/script.jsp" %>

        <script>
            document.getElementById('showlogin').addEventListener('click', function () {
                document.getElementById('checkout-login').style.display = 'block';
            });
            document.getElementById('showcoupon').addEventListener('click', function () {
                document.getElementById('checkout_coupon').style.display = 'block';
            });
            document.getElementById('cbox').addEventListener('change', function () {
                document.getElementById('cbox_info').style.display = this.checked ? 'block' : 'none';
            });

//            function validateForm() {
//                var requiredFields = document.querySelectorAll('.required input, .required select');
//                var valid = true;
//
//                requiredFields.forEach(function (field) {
//                    if (!field.value) {
//                        field.style.borderColor = 'red';
//                        valid = false;
//                    } else {
//                        field.style.borderColor = '';
//                    }
//                });
//                return valid;
//            }
        </script>
    </body>
</html>