<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- CART MINI --%>
        <%@ include file="../template/cartMini.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- content-error-area -->
            <div class="content-error-area pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                            <div class="content-error-item text-center">
                                <div class="error-thumb">
                                    <img src="${pageContext.request.contextPath}/img/bg/error-thumb.png" alt="image not found">
                                </div>
                                <div class="section-title">
                                    <h2 class="mb-20">Oops! That page can't be found.</h2>
                                    <p>We couldn't find any results for your search. Use more generic words or double check your
                                        spelling.</p>
                                </div>
                                <div class="error-btn">
                                    <a class="edu-btn" href="${pageContext.request.contextPath}/home?role=${user.getRole()}">Back to homepage</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-error-end -->
        </main>



        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>


</html>