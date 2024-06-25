<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
                            <form action="${pageContext.request.contextPath}/verify-email" method="POST">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="signup-form-wrapper">
                                            <p class='mb-25'>OTP will be sent to your Email!</p>                                   
                                            <div class="sign-button mb-20">
                                                <button type='submit' class="sign-btn">Continue</button>
                                            </div>
                                            <div class="registered wrapper">
                                                <div class="not-register">
                                                    <span>Back to?</span><span><a href="home.jsp">Homepage</a></span>
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