<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- cart mini area start -->
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
                    <li>
                        <div class="cartmini__thumb">
                            <a href="course.html">
                                <img src="${pageContext.request.contextPath}/img/products/product-thumb-01.png" alt="image not found">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="course.html">Turn Yourself</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$24.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="course.html">
                                <img src="${pageContext.request.contextPath}/img/products/product-thumb-02.png" alt="image not found">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="course.html">Art of Not Giving</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$12.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                    <li>
                        <div class="cartmini__thumb">
                            <a href="course.html">
                                <img src="${pageContext.request.contextPath}/img/products/product-thumb-03.png" alt="image not found">
                            </a>
                        </div>
                        <div class="cartmini__content">
                            <h5><a href="course.html">Attract Women</a></h5>
                            <div class="product-quantity mt-10 mb-10">
                                <span class="cart-minus">-</span>
                                <input class="cart-input" type="text" value="1">
                                <span class="cart-plus">+</span>
                            </div>
                            <div class="product__sm-price-wrapper">
                                <span class="product__sm-price">$42.00</span>
                            </div>
                        </div>
                        <a href="#" class="cartmini__del"><i class="fal fa-times"></i></a>
                    </li>
                </ul>
            </div>
            <div class="cartmini__checkout">
                <div class="cartmini__checkout-title mb-30">
                    <h4>Subtotal:</h4>
                    <span>$78.00</span>
                </div>
            </div>
            <div class="cartmini__viewcart">
                <a href="cart.html" class="edu-sec-btn">View cart</a>
                <a href="checkout.html" class="edu-sec-btn">Checkout</a>
            </div>
        </div>
    </div>
</div>
<div class="body-overlay"></div>
<!-- cart mini area end -->