<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- side toggle start -->
<div class="fix">
    <div class="side-info">
        <div class="side-info-content">
            <div class="offset-widget offset-logo mb-40">
                <div class="row align-items-center">
                    <div class="col-9">
                        <a href="index.html">
                            <img src="${pageContext.request.contextPath}/img/logo/logo-black.png" alt="Logo">
                        </a>
                    </div>
                    <div class="col-3 text-end"><button class="side-info-close"><i class="fal fa-times"></i></button>
                    </div>
                </div>
            </div>
            <div class="mobile-menu d-xl-none fix"></div>
            <div class="offset-widget offset_searchbar mb-30">
                <div class="menu-search position-relative ">
                    <form action="#" class="filter-search-input">
                        <input type="text" placeholder="Search keyword">
                        <button><i class="fal fa-search"></i></button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="offcanvas-overlay"></div>
<div class="offcanvas-overlay-white"></div>
<!-- side toggle end -->