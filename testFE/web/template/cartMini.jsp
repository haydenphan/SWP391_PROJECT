<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartDetails" %>

<div class="cartmini__area">
    <div class="cartmini__wrapper">
        <div class="cartmini__title">
            <h4>Shopping cart</h4>
        </div>
        <div class="cartmini__close">
            <button type="button" class="cartmini__close-btn"><i class="fal fa-times"></i></button>
        </div>
        <div class="cartmini__widget">
            <div class="cartmini__inner">
                <ul>
                    <c:forEach var="cartDetail" items="${cartDetails}">
                        <c:set var="course" value="${cartDetail.course}" />
                        <li id="product-row-${course.courseID}">
                            <div class="cartmini__thumb">
                                <a href="course.html">
                                    <img src="${course.imageURL}" alt="image not found">
                                </a>
                            </div>
                            <div class="cartmini__content">
                                <h5><a href="course.html">${course.courseName}</a></h5>
                                <div class="product__sm-price-wrapper">
                                    <span class="product__sm-price">$${cartDetail.price}</span>
                                </div>
                            </div>
                            <a href="javascript:void(0);" onclick="deleteOrder(${course.courseID})" class="cartmini__del"><i class="fal fa-times"></i></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="cartmini__checkout">
                <div class="cartmini__checkout-title mb-30">
                    <h4>Subtotal:</h4>
                    <span id="cartmini-total">$<c:out value="${total}" /></span>
                </div>
            </div>
            <div class="cartmini__viewcart">
                <a href="${pageContext.request.contextPath}/Cart/" class="edu-sec-btn">View cart</a>
                <a href="${pageContext.request.contextPath}/pages/checkout.jsp" class="edu-sec-btn">Checkout</a>
            </div>
        </div>
    </div>
</div>
<div class="body-overlay"></div>
