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

        <!-- sign in area start-->
        <div class="signin-page-area pt-120 pb-120">
            <div class="signin-page-area-wrapper">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <form action="${pageContext.request.contextPath}/dang-nhap" method="post">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="signup-box text-center">
                                            <div class="signup-text">
                                                <h3>Sign in</h3>
                                            </div>
                                            <div class="signup-thumb">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up.png"
                                                     alt="image not found">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="signup-form-wrapper">
                                            <div class="signup-wrapper">
                                                <input required type="text" id="tendangnhap" name="tendangnhap" placeholder="Email or Username">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input required type="password" id="password" name="password" placeholder="Password">
                                            </div>
                                            <div class="signup-action">
                                                <div class="course-sidebar-list">
                                                    <input class="signup-checkbox" type="checkbox" id="sing-in">
                                                    <label class="sign-check" for="sing-in"><span>Remember
                                                            me</span></label>
                                                </div>
                                            </div>
                                            <div class="sing-buttom mb-20">
                                                <button type="submit" class="sing-btn">Sign In</button>
                                            </div>
                                            <div class="registered wrapper">
                                                <div class="not-register">
                                                    <span>Not registered?</span><span><a href="registration.jsp">Sign
                                                            up</a></span>
                                                </div>
                                                <div class="forget-password">
                                                    <a href="${pageContext.request.contextPath}/pages/forgot-password.jsp">Forgot password?</a>
                                                </div>
                                            </div>
                                            <div style="margin-top: 25px" class="sign-social text-center">
                                                <span>Or Sign- in with</span>
                                            </div>
                                            <div class="sign-social-icon">
                                                <div class="sign-gmail">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="21.692"
                                                         height="16.273" viewBox="0 0 21.692 16.273">
                                                    <g id="gmail" transform="translate(0 -63.953)">
                                                    <path id="Path_8685" data-name="Path 8685"
                                                          d="M1.479,169.418H4.93v-8.381l-2.26-3.946L0,157.339v10.6a1.479,1.479,0,0,0,1.479,1.479Z"
                                                          transform="translate(0 -89.192)" fill="#0085f7" />
                                                    <path id="Path_8686" data-name="Path 8686"
                                                          d="M395.636,169.418h3.451a1.479,1.479,0,0,0,1.479-1.479v-10.6l-2.666-.248-2.264,3.946v8.381Z"
                                                          transform="translate(-378.874 -89.192)"
                                                          fill="#00a94b" />
                                                    <path id="Path_8687" data-name="Path 8687"
                                                          d="M349.816,65.436,347.789,69.3l2.027,2.541,4.93-3.7V66.176A2.219,2.219,0,0,0,351.2,64.4Z"
                                                          transform="translate(-333.054)" fill="#ffbc00" />
                                                    <path id="Path_8688" data-name="Path 8688"
                                                          d="M72.7,105.365l-1.932-4.08L72.7,98.956l5.916,4.437,5.916-4.437v6.409L78.619,109.8Z"
                                                          transform="translate(-67.773 -33.52)" fill="#ff4131"
                                                          fill-rule="evenodd" />
                                                    <path id="Path_8689" data-name="Path 8689"
                                                          d="M0,66.176v1.972l4.93,3.7V65.436L3.55,64.4A2.219,2.219,0,0,0,0,66.176Z"
                                                          transform="translate(0)" fill="#e51c19" />
                                                    </g>
                                                    </svg>

                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/testFE/loginByGG&response_type=code&client_id=151505397859-gras04bfo18abfhbguik5cqtgaaleaqs.apps.googleusercontent.com&prompt=consent&state=login">Google</a>
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
        <!-- sign in area end-->

    </main>

    <%-- FOOTER --%>
    <%@ include file="../template/footer.jsp" %>

    <%-- BACK TO TOP --%>
    <%@ include file="../template/backToTop.jsp" %>

    <!-- JS here -->
    <%@ include file="../template/script.jsp" %>
</body>



</html>