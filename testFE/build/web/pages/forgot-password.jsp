<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <!-- sign in-area start-->
        <div class="signin-page-area pt-120 pb-120">
            <div class="signin-page-area-wrapper">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <form action="${pageContext.request.contextPath}/forgotPassword" method="POST">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="signup-box text-center">
                                            <div class="signup-text">
                                                <h3>Forgot Password</h3>
                                            </div>
                                            <div class="signup-thumb">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up.png" alt="image not found">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="signup-form-wrapper">
                                            <p class='mb-25'>Lost your password? Please enter your email address. You
                                                will receive a link to create a new password via email.</p>
                                            <div class="signup-wrapper">
                                                <input name="email" type="email" placeholder="Enter your email">
                                            </div>
                                            <div class="sign-button mb-20">
                                                <button type='submit' class="sign-btn">Send</button>
                                            </div>
                                            <div class="registered wrapper">
                                                <div class="not-register">
                                                    <span>Back to?</span><span><a href="login.jsp">Login</a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- sign in-area end-->

    </main>

    <!-- JS here -->
    <%@ include file="../template/script.jsp" %>
</body>


</html>