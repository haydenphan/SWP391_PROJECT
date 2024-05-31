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

        <div class="signup-page-area pt-120 pb-120">
            <div class="signup-page-area-wrapper">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <form action="${pageContext.request.contextPath}/validate-register-info" method="POST">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="signup-box text-center">
                                            <div class="signup-text">
                                                <h3>Sign up</h3>
                                            </div>
                                            <div class="signup-message">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up-message.png" alt="image not found">
                                            </div>
                                            <div class="signup-thumb">
                                                <img src="${pageContext.request.contextPath}/img/sing-up/sign-up.png" alt="image not found">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="signup-form-wrapper" style="padding-top: 10px">
                                            <div class="signup-input-wrapper">
                                                <input id="firstname" name="firstname" required type="text" placeholder="First Name">
                                                <input id="lastname" name="lastname" required type="text" placeholder="Last Name">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input id="email" name="email" required type="email" placeholder="Email">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input id="username" name="username" required type="text" placeholder="Username">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input id="password" name="password" required type="password" placeholder="Password" oninput="kiemTraMatKhau();">
                                            </div>
                                            <div class="signup-wrapper">
                                                <input id="passwordR" required type="password" placeholder="Enter password again" oninput="kiemTraMatKhau();">
                                            </div>
                                            <div id="msg" style="color: red; padding: 0px 10px 0px 10px;">

                                                ${baoLoi}

                                            </div> <!-- Message display area -->
                                            <div style="display: flex;">
                                                <label style="padding: 10px; margin-right: 10px" for="roles">Are you Learner or Lecturer?</label>
                                                <select name="roles" required id="roles" aria-label="Default select example">
                                                    <option value="learner">Learner</option>
                                                    <option value="lecturer">Lecturer</option>
                                                </select>
                                            </div>
                                            <br/>
                                            <div class="signup-action">
                                                <div class="course-sidebar-list">
                                                    <input onchange="xuLyChonDongY(); kiemTraMatKhau();" id="policycheckbox" name="policycheckbox" class="signup-checkbox" type="checkbox" checked="false">
                                                    <label class="sign-check" for="policycheckbox"><span>Accept the terms and <a href="#">Privacy Policy</a></span></label>
                                                </div>
                                            </div>

                                            <div class="sign-button mb-20">
                                                <input id="submitbtn" class="sign-btn" type="submit" value="Register now" disabled />
                                            </div>

                                            <div class="acount-login text-center">
                                                <span>Already have an account? <a href="login.jsp">Log in</a></span>
                                            </div>
                                            <div class="sign-social text-center">
                                                <span>Or Sign- in with</span>
                                            </div>
                                            <div class="sign-social-icon">
                                                <div class="sign-gmail">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="21.692" height="16.273" viewBox="0 0 21.692 16.273">
                                                    <g id="gmail-01" transform="translate(0 -63.953)">
                                                    <path id="Path_868365" data-name="Path 863185" d="M1.479,169.418H4.93v-8.381l-2.26-3.946L0,157.339v10.6a1.479,1.479,0,0,0,1.479,1.479Z" transform="translate(0 -89.192)" fill="#0085f7" />
                                                    <path id="Path_863286" data-name="Path 8683106" d="M395.636,169.418h3.451a1.479,1.479,0,0,0,1.479-1.479v-10.6l-2.666-.248-2.264,3.946v8.381Z" transform="translate(-378.874 -89.192)" fill="#00a94b" />
                                                    <path id="Path_8322687" data-name="Path 831687" d="M349.816,65.436,347.789,69.3l2.027,2.541,4.93-3.7V66.176A2.219,2.219,0,0,0,351.2,64.4Z" transform="translate(-333.054)" fill="#ffbc00" />
                                                    <path id="Path_863088" data-name="Path 868038" d="M72.7,105.365l-1.932-4.08L72.7,98.956l5.916,4.437,5.916-4.437v6.409L78.619,109.8Z" transform="translate(-67.773 -33.52)" fill="#ff4131" fill-rule="evenodd" />
                                                    <path id="Path_8682519" data-name="Path 868921" d="M0,66.176v1.972l4.93,3.7V65.436L3.55,64.4A2.219,2.219,0,0,0,0,66.176Z" transform="translate(0)" fill="#e51c19" />
                                                    </g>
                                                    </svg>
                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile&redirect_uri=http://localhost:8080/testFE/loginByGG&response_type=code&client_id=151505397859-gras04bfo18abfhbguik5cqtgaaleaqs.apps.googleusercontent.com&prompt=consent&state=register">Google</a>
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
    </body>

    <%-- FOOTER --%>
    <%@ include file="../template/footer.jsp" %>

    <%-- BACK TO TOP --%>
    <%@ include file="../template/backToTop.jsp" %>

    <!-- JS here -->
    <%@ include file="../template/script.jsp" %>

    <script>
        function kiemTraMatKhau() {
            var matKhau = document.getElementById("password").value;
            var matKhauNhapLai = document.getElementById("passwordR").value;
            var msg = document.getElementById("msg");

            if (matKhau !== matKhauNhapLai) {
                msg.innerHTML = "The password did not match!";
                return false;
            } else {
                msg.innerHTML = "";
                return true;
            }
        }

        function xuLyChonDongY() {
            var policycheckbox = document.getElementById("policycheckbox");
            if (policycheckbox.checked) {
                document.getElementById("submitbtn").disabled = false;
            } else {
                document.getElementById("submitbtn").disabled = true;
            }
        }

        // Ensure the function is called when the page loads to set the initial state
        document.addEventListener('DOMContentLoaded', function () {
            xuLyChonDongY();
        });

        function validateForm() {
            var passwordsMatch = kiemTraMatKhau();
            var termsAccepted = document.getElementById("policycheckbox").checked;

            if (!passwordsMatch || !termsAccepted) {
                if (!termsAccepted) {
                    document.getElementById("msg").innerHTML = "You must accept the privacy policy!";
                }
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
</html>