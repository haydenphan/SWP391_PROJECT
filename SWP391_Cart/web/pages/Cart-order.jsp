<%@ page import="java.util.HashMap" %>
<%@ page import="model.ProductCart" %>
<%@ page import="model.Course" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <%@ include file="../template/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function deleteOrder(CourseID) {
                var contextPath = '<%= request.getContextPath() %>';
                var url = contextPath + "/Cart/remove-from-cart?CourseID=" + CourseID;
                $.ajax({
                    url: url,
                    type: "get",
                    success: function (responseData) {
                        document.getElementById("contentTotalMoney").innerHTML = responseData;
                        document.getElementById("product-row-" + CourseID).remove();
                    },
                    error: function () {
                        alert('Failed to remove item from cart');
                    }
                });
            }
        </script>
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
                                        <li class="breadcrumb-item"><a href="/pages/home.jsp">Home</a></li>
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
                                        <% 
                                            HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) request.getAttribute("cart");
                                            double total = 0;
                                            if (cart != null && !cart.isEmpty()) {
                                                for (ProductCart item : cart.values()) {
                                                    Course course = item.getCourse();
                                                    double itemTotal = course.getPrice();
                                                    total += itemTotal;
                                        %>
                                        <tr id="product-row-<%= course.getCourseID() %>">
                                            <td class="product-thumbnail">
                                                <a href="course-details.html"><img src="<%= course.getImageURL() %>" alt=""></a>
                                            </td>
                                            <td class="product-name">
                                                <a href="course-details.html"><%= course.getCourseName() %></a>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">$<%= course.getPrice() %></span>
                                            </td>
                                            <td class="product-remove">
                                                <a href="javascript:void(0);" onclick="deleteOrder(<%= course.getCourseID() %>)">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <% 
                                                }
                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="4">Your cart is empty.</td>
                                        </tr>
                                        <% 
                                            }
                                        %>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 ml-auto">
                                    <div class="cart-page-total">
                                        <h2>Cart totals</h2>
                                        <ul class="mb-20">
                                            <li>Subtotal <span>$<%= total %></span></li>
                                            <li>VAT <span>$<%= total * 0.1 %></span></li>
                                            <li>Total <span>$<%= total * 1.1 %></span></li>
                                        </ul>
                                        <a class="edu-border-btn" href="checkout.html">Proceed to checkout</a>
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
