<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartDetails" %>
<%@ page import="model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                    <form id="checkout-form" action="<%= request.getContextPath()%>/process_checkout" method="post">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkbox-form">
                                    <h3>Billing Details</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label class="required">First Name</label>
                                                <input type="text" name="firstName" value="${user != null ? user.getFirstName() : ''}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list">
                                                <label class="required">Last Name</label>
                                                <input type="text" name="lastName" value="${user != null ? user.getLastName() : ''}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="checkout-form-list" style="width: 150%">
                                                <label class="required">Email Address</label>
                                                <input type="email" name="email" value="${user != null ? user.getEmail() : ''}" required>
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
                                                    Cart cart = (Cart) session.getAttribute("cart");
                                                    double total = 0;
                                                    if (cart != null && !cart.isEmpty()) {
                                                        for (CartDetails item : cart.getCartDetails()) {
                                                            Course course = item.getCourse();
                                                            double itemTotal = item.getPrice();
                                                            total += itemTotal;
                                                %>
                                                <tr id="product-row-<%= course.getCourseID()%>">
                                                    <td class="product-name">
                                                        <a href="<%= request.getContextPath()%>/Cart-order.jsp?CourseID=<%= course.getCourseID()%>"><%= course.getCourseName()%></a>
                                                    </td>
                                                    <td class="product-unitprice">
                                                        <span class="amount">$<%= item.getPrice()%></span>
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
                                                    <th>$<%= total%></th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="payment-method">
                                        <div class="payment-accordion">
                                            <div class="accordion" id="checkoutAccordion">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="vnpay">
                                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#vnpayPayment" aria-expanded="false" aria-controls="vnpayPayment">
                                                            VN Pay
                                                        </button>
                                                    </h2>
                                                    <div id="vnpayPayment" class="accordion-collapse collapse" aria-labelledby="vnpay">
                                                        <div class="accordion-body">
                                                            Pay via VNPay; you can pay with your credit card if you don't have a VNPay account.
                                                            <button class="edu-btn" type="submit">Pay with VNPay</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Add other payment methods here if needed -->
                                            </div>
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
        </script>
    </body>
</html>