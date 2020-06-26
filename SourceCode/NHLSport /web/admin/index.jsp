<%-- 
    Document   : index
    Created on : May 25, 2020, 1:25:17 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.admin == null}">
    <c:redirect url="http://localhost:8080${context}/Admin/Login"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/admin/assets/css/styles.css">
        <!-- Normalize -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/normalize/normalize.css">
        <!-- Bootstrap 4.0.0 -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-4.0.0-dist/css/bootstrap.min.css">
        <!-- Animate -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/animate/animate.css">
        <!-- Elegant Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Elegants/style.css">
        <!-- FontAwesome -->
        <script src="https://kit.fontawesome.com/0644aaed0c.js" crossorigin="anonymous"></script>
        <!-- CSS Global Icons -->
        <link rel="stylesheet" href="${context}/admin/vendors/hs-admin-icons/hs-admin-icons.css">
        <!-- CSS Unify -->
        <link rel="stylesheet" href="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
        <link rel="stylesheet" href="${context}/admin/assets/css/unify-admin.css">
    </head>
    <body>

        <jsp:include page="views/layout/header.jsp" />

        <main class="container-fluid px-0 g-pt-65">
            <div class="row no-gutters g-pos-rel g-overflow-x-hidden">

                <jsp:include page="views/layout/navigation.jsp" />


                <div class="col g-ml-45 g-ml-0--lg g-pb-65--md">
                    <!-- Breadcrumb-v1 -->
                    <div class="g-hidden-sm-down g-bg-gray-light-v8 g-pa-20">
                        <ul class="u-list-inline g-color-gray-dark-v6">

                            <li class="list-inline-item g-mr-10">
                                <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Dashboard</a>
                                <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                            </li>
                        </ul>
                    </div>
                    <!-- End Breadcrumb-v1 -->

                    <div class="g-pa-20">
                        <div class="row">
                            <div class="col-sm-6 col-lg-6 col-xl-3 g-mb-30">
                                <!-- Panel -->
                                <div class="card h-100 g-brd-gray-light-v7 g-rounded-3">
                                    <div class="card-block g-font-weight-300 g-pa-20">
                                        <div class="media">
                                            <div class="d-flex g-mr-15">
                                                <div class="u-header-dropdown-icon-v1 g-pos-rel g-width-60 g-height-60 g-bg-lightblue-v3 g-font-size-18 g-font-size-24--md g-color-white rounded-circle">
                                                    <i class="hs-admin-briefcase g-absolute-centered"></i>
                                                </div>
                                            </div>

                                            <div class="media-body align-self-center">
                                                <div class="d-flex align-items-center g-mb-5">
                                                    <span class="g-font-size-24 g-line-height-1 g-color-black">99.9%</span>
                                                    <span class="d-flex align-self-center g-font-size-0 g-ml-5 g-ml-10--md">
                                                        <i class="g-fill-gray-dark-v9">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-21.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon points="6 20 0 13.9709049 0.576828937 13.3911999 5.59205874 18.430615 5.59205874 0 6.40794126 0 6.40794126 18.430615 11.4223552 13.3911999 12 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                        <i class="g-fill-lightblue-v3">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-33.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon
                                                                transform="translate(18.000000, 10.000000) scale(1, -1) translate(-18.000000, -10.000000)"
                                                                points="18 20 12 13.9709049 12.5768289 13.3911999 17.5920587 18.430615 17.5920587 0 18.4079413 0 18.4079413 18.430615 23.4223552 13.3911999 24 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                    </span>
                                                </div>

                                                <h6 class="g-font-size-16 g-font-weight-300 g-color-gray-dark-v6 mb-0">Orders</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Panel -->
                            </div>

                            <div class="col-sm-6 col-lg-6 col-xl-3 g-mb-30">
                                <!-- Panel -->
                                <div class="card h-100 g-brd-gray-light-v7 g-rounded-3">
                                    <div class="card-block g-font-weight-300 g-pa-20">
                                        <div class="media">
                                            <div class="d-flex g-mr-15">
                                                <div class="u-header-dropdown-icon-v1 g-pos-rel g-width-60 g-height-60 g-bg-teal-v2 g-font-size-18 g-font-size-24--md g-color-white rounded-circle">
                                                    <i class="hs-admin-check-box g-absolute-centered"></i>
                                                </div>
                                            </div>

                                            <div class="media-body align-self-center">
                                                <div class="d-flex align-items-center g-mb-5">
                                                    <span class="g-font-size-24 g-line-height-1 g-color-black">324</span>
                                                    <span class="d-flex align-self-center g-font-size-0 g-ml-5 g-ml-10--md">
                                                        <i class="g-fill-gray-dark-v9">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-21.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon points="6 20 0 13.9709049 0.576828937 13.3911999 5.59205874 18.430615 5.59205874 0 6.40794126 0 6.40794126 18.430615 11.4223552 13.3911999 12 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                        <i class="g-fill-lightblue-v3">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-33.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon
                                                                transform="translate(18.000000, 10.000000) scale(1, -1) translate(-18.000000, -10.000000)"
                                                                points="18 20 12 13.9709049 12.5768289 13.3911999 17.5920587 18.430615 17.5920587 0 18.4079413 0 18.4079413 18.430615 23.4223552 13.3911999 24 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                    </span>
                                                </div>

                                                <h6 class="g-font-size-16 g-font-weight-300 g-color-gray-dark-v6 mb-0">Total Tasks</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Panel -->
                            </div>

                            <div class="col-sm-6 col-lg-6 col-xl-3 g-mb-30">
                                <!-- Panel -->
                                <div class="card h-100 g-brd-gray-light-v7 g-rounded-3">
                                    <div class="card-block g-font-weight-300 g-pa-20">
                                        <div class="media">
                                            <div class="d-flex g-mr-15">
                                                <div class="u-header-dropdown-icon-v1 g-pos-rel g-width-60 g-height-60 g-bg-darkblue-v2 g-font-size-18 g-font-size-24--md g-color-white rounded-circle">
                                                    <i class="hs-admin-wallet g-absolute-centered"></i>
                                                </div>
                                            </div>

                                            <div class="media-body align-self-center">
                                                <div class="d-flex align-items-center g-mb-5">
                                                    <span class="g-font-size-24 g-line-height-1 g-color-black">$124.2</span>
                                                    <span class="d-flex align-self-center g-font-size-0 g-ml-5 g-ml-10--md">
                                                        <i class="g-fill-red">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-21.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon points="6 20 0 13.9709049 0.576828937 13.3911999 5.59205874 18.430615 5.59205874 0 6.40794126 0 6.40794126 18.430615 11.4223552 13.3911999 12 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                        <i class="g-fill-gray-dark-v9">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-33.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon
                                                                transform="translate(18.000000, 10.000000) scale(1, -1) translate(-18.000000, -10.000000)"
                                                                points="18 20 12 13.9709049 12.5768289 13.3911999 17.5920587 18.430615 17.5920587 0 18.4079413 0 18.4079413 18.430615 23.4223552 13.3911999 24 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                    </span>
                                                </div>

                                                <h6 class="g-font-size-16 g-font-weight-300 g-color-gray-dark-v6 mb-0">Projects Done</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Panel -->
                            </div>

                            <div class="col-sm-6 col-lg-6 col-xl-3 g-mb-30">
                                <!-- Panel -->
                                <div class="card h-100 g-brd-gray-light-v7 g-rounded-3">
                                    <div class="card-block g-font-weight-300 g-pa-20">
                                        <div class="media">
                                            <div class="d-flex g-mr-15">
                                                <div class="u-header-dropdown-icon-v1 g-pos-rel g-width-60 g-height-60 g-bg-lightred-v2 g-font-size-18 g-font-size-24--md g-color-white rounded-circle">
                                                    <i class="hs-admin-user g-absolute-centered"></i>
                                                </div>
                                            </div>

                                            <div class="media-body align-self-center">
                                                <div class="d-flex align-items-center g-mb-5">
                                                    <span class="g-font-size-24 g-line-height-1 g-color-black">148</span>
                                                    <span class="d-flex align-self-center g-font-size-0 g-ml-5 g-ml-10--md">
                                                        <i class="g-fill-gray-dark-v9">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-21.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon points="6 20 0 13.9709049 0.576828937 13.3911999 5.59205874 18.430615 5.59205874 0 6.40794126 0 6.40794126 18.430615 11.4223552 13.3911999 12 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                        <i class="g-fill-gray-dark-v9">
                                                            <svg width="12px" height="20px" viewbox="0 0 12 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                            <g transform="translate(-33.000000, -751.000000)">
                                                            <g transform="translate(0.000000, 64.000000)">
                                                            <g transform="translate(20.000000, 619.000000)">
                                                            <g transform="translate(1.000000, 68.000000)">
                                                            <polygon
                                                                transform="translate(18.000000, 10.000000) scale(1, -1) translate(-18.000000, -10.000000)"
                                                                points="18 20 12 13.9709049 12.5768289 13.3911999 17.5920587 18.430615 17.5920587 0 18.4079413 0 18.4079413 18.430615 23.4223552 13.3911999 24 13.9709049"></polygon>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </g>
                                                            </svg>
                                                        </i>
                                                    </span>
                                                </div>

                                                <h6 class="g-font-size-16 g-font-weight-300 g-color-gray-dark-v6 mb-0">New Clients</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Panel -->
                            </div>
                        </div>
                    </div>
                    <div class="container" style="text-align: center; font-size: 200%;">
                        <a href="${context}/Admin/Wishlist/">Top Most Product Customer Wishlist</a>
                    </div>
                    <div class="container" style="text-align: center; font-size: 200%;">
                        <a href="${context}/Admin/Employees/Top20NewEmployee">Top 20 New Employee</a>
                    </div>
                    <div class="container" style="text-align: center; font-size: 200%;">
                        <a href="${context}/Admin/Products/Top10SellProduct">Top 10 Sell Product</a>
                    </div>
                    <jsp:include page="views/layout/footer.jsp" />   
                </div>
            </div>
        </main>




    <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
    <script src="${context}/admin/vendors/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="${context}/vendors/popper/popper.min.js"></script>
    <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="${context}/admin/vendors/cookiejs/jquery.cookie.js"></script>
    <script src="${context}/admin/assets/js/script.js"></script>

    <script src="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${context}/admin/assets/js/unify/hs.core.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.side-nav.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.dropdown.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.scrollbar.js"></script>

    <!-- JS Plugins Init. -->
    <script>
        $(document).on('ready', function() {


            // initialization of sidebar navigation component
            $.HSCore.components.HSSideNav.init('.js-side-nav', {
                afterOpen: function() {
                    setTimeout(function() {
                    }, 400);
                },
                afterClose: function() {
                    setTimeout(function() {
                    }, 400);
                }
            });


            // initialization of HSDropdown component
            $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
                dropdownHideOnScroll: false
            });

            // initialization of custom scrollbar
            $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));


        });
    </script>
</body>
</html>
