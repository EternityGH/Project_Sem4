<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="emp" value="${sessionScope.admin}" />
<!-- Header -->
<header id="js-header" class="u-header u-header--sticky-top">
    <div class="u-header__section u-header__section--admin-dark g-min-height-65">
        <nav class="navbar no-gutters g-pa-0">
            <div class="col-auto d-flex flex-nowrap u-header-logo-toggler g-py-12">
                <!-- Logo -->
                <a href="index.html" class="navbar-brand d-flex align-self-center g-hidden-xs-down g-line-height-1 py-0 g-mt-5"> Admin </a>
                <!-- End Logo -->

                <!-- Sidebar Toggler -->
                <a class="js-side-nav u-header__nav-toggler d-flex align-self-center ml-auto" href="#" data-hssm-class="u-side-nav--mini u-sidebar-navigation-v1--mini" data-hssm-body-class="u-side-nav-mini" data-hssm-is-close-all-except-this="true" data-hssm-target="#sideNav">
                    <i class="hs-admin-align-left"></i>
                </a>
                <!-- End Sidebar Toggler -->
            </div>

            <!-- Messages/Notifications/Top Search Bar/Top User -->
            <div class="col-auto d-flex g-py-12 g-pl-40--lg ml-auto">

                <!-- Top Notifications -->
                <div class="g-pos-rel g-hidden-sm-down">
                    <a id="notificationsInvoker" class="d-block text-uppercase u-header-icon-v1 g-pos-rel g-width-40 g-height-40 rounded-circle g-font-size-20" href="#" aria-controls="notificationsMenu" aria-haspopup="true" aria-expanded="false" data-dropdown-event="click"
                       data-dropdown-target="#notificationsMenu" data-dropdown-type="css-animation" data-dropdown-duration="300" data-dropdown-animation-in="fadeIn" data-dropdown-animation-out="fadeOut">
                        <i class="hs-admin-bell g-absolute-centered"></i>
                    </a>

                    <!-- Top Notifications List -->
                    <div id="notificationsMenu" class="js-custom-scroll g-absolute-centered--x g-width-340 g-max-width-400 g-height-400 g-mt-17 rounded" aria-labelledby="notificationsInvoker">
                        <div class="media text-uppercase u-header-dropdown-bordered-v1 g-pa-20">
                            <h4 class="d-flex align-self-center g-font-size-default g-letter-spacing-0_5 g-mr-20 g-mb-0">Notifications</h4>
                        </div>

                        <ul class="p-0 mb-0">
                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-bookmark-alt g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">A Pocket PC is a handheld computer features</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->

                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-blackboard g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">The first is a non technical method which requires</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->

                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-calendar g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">Stu Unger is of the biggest superstarsis</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->

                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-pie-chart g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">Sony laptops are among the most well known laptops</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->
                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-bookmark-alt g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">A Pocket PC is a handheld computer features</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->

                            <!-- Top Notifications List Item -->
                            <li class="media u-header-dropdown-item-v1 g-parent g-px-20 g-py-15">
                                <div class="d-flex align-self-center u-header-dropdown-icon-v1 g-pos-rel g-width-55 g-height-55 g-font-size-22 rounded-circle g-mr-15">
                                    <i class="hs-admin-blackboard g-absolute-centered"></i>
                                </div>

                                <div class="media-body align-self-center">
                                    <p class="mb-0">The first is a non technical method which requires</p>
                                </div>

                                <a class="d-flex g-color-lightblue-v2 g-font-size-12 opacity-0 g-opacity-1--parent-hover g-transition--ease-in g-transition-0_2" href="#">
                                    <i class="hs-admin-close"></i>
                                </a>
                            </li>
                            <!-- End Top Notifications List Item -->
                        </ul>
                    </div>
                    <!-- End Top Notifications List -->
                </div>
                <!-- End Top Notifications -->

                <!-- Top User -->
                <div class="col-auto d-flex g-pt-5 g-pt-0--sm g-pl-10 g-pl-20--sm">
                    <div class="g-pos-rel g-px-10--lg">
                        <a id="profileMenuInvoker" class="d-block" href="#" aria-controls="profileMenu" aria-haspopup="true" aria-expanded="false" data-dropdown-event="click" data-dropdown-target="#profileMenu" data-dropdown-type="css-animation" data-dropdown-duration="300"
                           data-dropdown-animation-in="fadeIn" data-dropdown-animation-out="fadeOut">
                            <span class="g-pos-rel">
                                <span class="u-badge-v2--xs u-badge--top-right g-hidden-sm-up g-bg-secondary g-mr-5"></span>
                                <img class="g-width-30 g-width-40--md g-height-30 g-height-40--md rounded-circle g-mr-10--sm" src="${context}/admin/assets/img/avatar/img1.jpg" alt="Image description">
                            </span>
                            <span class="g-pos-rel g-top-2">
                                <c:set var="name" value="${fn:split(emp.fullName, ' ')}"/>
                                <span class="g-hidden-sm-down">${name[fn:length(name)-2]} ${name[fn:length(name)-1]}</span>
                                <i class="hs-admin-angle-down g-pos-rel g-top-2 g-ml-10"></i>
                            </span>
                        </a>

                        <!-- Top User Menu -->
                        <ul id="profileMenu" class="g-pos-abs g-left-0 g-width-100x--lg g-nowrap g-font-size-14 g-py-20 g-mt-17 rounded" aria-labelledby="profileMenuInvoker">
                            <li class="g-hidden-sm-up g-mb-10">
                                <a class="media g-py-5 g-px-20" href="#">
                                    <span class="d-flex align-self-center g-mr-12">
                                        <i class="hs-admin-bell"></i>
                                    </span>
                                    <span class="media-body align-self-center">Notifications</span>
                                </a>
                            </li>
                            <li class="g-mb-10">
                                <a class="media g-color-primary--hover g-py-5 g-px-20" href="/NHLSport/Admin/Profile">
                                    <span class="d-flex align-self-center g-mr-12">
                                        <i class="hs-admin-user"></i>
                                    </span>
                                    <span class="media-body align-self-center">My Profile</span>
                                </a>
                            </li>
                            <li class="mb-0">
                                <a class="media g-color-primary--hover g-py-5 g-px-20" href="${context}/Admin/Logout">
                                    <span class="d-flex align-self-center g-mr-12">
                                        <i class="hs-admin-shift-right"></i>
                                    </span>
                                    <span class="media-body align-self-center">Sign Out</span>
                                </a>
                            </li>
                        </ul>
                        <!-- End Top User Menu -->
                    </div>
                </div>
                <!-- End Top User -->
            </div>
            <!-- End Messages/Notifications/Top Search Bar/Top User -->

    </div>
</header>
<!-- End Header -->