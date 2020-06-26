<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}/Admin" />
<!-- Sidebar Nav -->
<div id="sideNav" class="col-auto u-sidebar-navigation-v1 u-sidebar-navigation--dark">
    <ul id="sideNavMenu" class="u-sidebar-navigation-v1-menu u-side-nav--top-level-menu g-min-height-100vh mb-0">
        <!-- Dashboards -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu1">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-server"></i>
                </span>
                <span class="media-body align-self-center">Dashboards</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Dashboards: Submenu-1 -->
            <ul id="subMenu1" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Dashboards v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="#">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-infinite"></i>
                        </span>
                        <span class="media-body align-self-center">Dashboards v1</span>
                    </a>
                </li>
                <!-- End Dashboards v1 -->
            </ul>
            <!-- End Dashboards: Submenu-1 -->
        </li>
        <!-- End Dashboards -->
        <!-- Management Account -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subManagementAccount">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-bag"></i>
                </span>
                <span class="media-body align-self-center">Management Account</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>

                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Management Account Submenu-1 -->
            <ul id="subManagementAccount" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">

                <!-- Customers -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="#" data-hssm-target="#subMenuCustomer">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-user"></i>
                        </span>
                        <span class="media-body align-self-center">Customers</span>
                        <span class="d-flex align-self-center u-side-nav--control-icon">
                            <i class="hs-admin-angle-right"></i>
                        </span>
                    </a>
                    <!-- Customers Submneu -->
                    <ul id="subMenuCustomer" class="u-side-nav--third-level-menu">
                        <!-- States -->
                        <li class="u-side-nav--third-level-menu-item">
                            <a class="u-side-nav--third-level-menu-link u-side-nav--hide-on-hidden g-pl-8 g-pr-15 g-py-6" href="${context}/Customers/List">
                                <i class="hs-admin-list g-pl-8 g-pr-15 g-py-6"></i> List
                            </a>
                        </li>
                        <!-- End States -->
                    </ul>
                    <!-- Customers Submneu -->
                </li>
                <!-- End Customers -->
                <!-- Employees-->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="#" data-hssm-target="#subMenuEmployees">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-user"></i>
                        </span>
                        <span class="media-body align-self-center">Employees</span>
                        <span class="d-flex align-self-center u-side-nav--control-icon">
                            <i class="hs-admin-angle-right"></i>
                        </span>
                    </a>
                    <!-- Employees Submneu -->
                    <ul id="subMenuEmployees" class="u-side-nav--third-level-menu">
                        <!-- States -->
                        <li class="u-side-nav--third-level-menu-item">
                            <a class="u-side-nav--third-level-menu-link u-side-nav--hide-on-hidden g-pl-8 g-pr-15 g-py-6" href="${context}/Employees/List">
                                <i class="hs-admin-list g-pl-8 g-pr-15 g-py-6"></i> List
                            </a>
                        </li>
                        <!-- End States -->
                        <!-- States -->
                        <li class="u-side-nav--third-level-menu-item">
                            <a class="u-side-nav--third-level-menu-link u-side-nav--hide-on-hidden g-pl-8 g-pr-15 g-py-6" href="${context}/Employees/Create">
                                <i class="hs-admin-plus g-pl-8 g-pr-15 g-py-6"></i> Create
                            </a>
                        </li>
                        <!-- End States -->
                    </ul>
                    <!-- Employees Submneu -->
                </li>
                <!-- End Employees -->
            </ul>
            <!-- End Management Account Customers-1 -->
        </li>
        <!-- End Management Account -->
        <!-- Categories -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-cat">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-package"></i>
                </span>
                <span class="media-body align-self-center">Categories</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Categories Submenu-1 -->
            <ul id="subMenu-cat" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Customers v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Categories/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Categories v1 -->
                <!-- Customers v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Categories/Create">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-plus"></i>
                        </span>
                        <span class="media-body align-self-center">Create</span>
                    </a>
                </li>
                <!-- End Categories v1 -->
            </ul>
            <!-- End Categories Submenu-1 -->
        </li>
        <!-- End Categories -->
        <!-- Brands -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-brand">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-layout-cta-right"></i>
                </span>
                <span class="media-body align-self-center">Brands</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Brands Submenu-1 -->
            <ul id="subMenu-brand" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Brands/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Brands v1 -->
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Brands/Create">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-plus"></i>
                        </span>
                        <span class="media-body align-self-center">Create</span>
                    </a>
                </li>
                <!-- End Brands v1 -->
            </ul>
            <!-- End Brands Submenu-1 -->
        </li>
        <!-- End Brands -->
        <!-- Vouchers -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-vou">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="icon_gift_alt"></i>
                </span>
                <span class="media-body align-self-center">Vouchers</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Vouchers Submenu-1 -->
            <ul id="subMenu-vou" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Vouchers v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Vouchers/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Vouchers v1 -->
                <!-- Vouchers v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Vouchers/Create">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-plus"></i>
                        </span>
                        <span class="media-body align-self-center">Create</span>
                    </a>
                </li>
                <!-- End Vouchers v1 -->
            </ul>
            <!-- End Vouchers Submenu-1 -->
        </li>
        <!-- End Vouchers -->
        <!-- Products -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-product">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-tag" style="transform: rotateZ(45deg)"></i>
                </span>
                <span class="media-body align-self-center">Products</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Products Submenu-1 -->
            <ul id="subMenu-product" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Products/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Products v1 -->
                <!-- Products v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Products/Create">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-plus"></i>
                        </span>
                        <span class="media-body align-self-center">Create</span>
                    </a>
                </li>
                <!-- End Products v1 -->
            </ul>
            <!-- End Products Submenu-1 -->
        </li>
        <!-- End Products -->
        <!-- Orders -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-order">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="icon_documents_alt"></i>
                </span>
                <span class="media-body align-self-center">Orders</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Orders Submenu-1 -->
            <ul id="subMenu-order" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Orders/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Orders v1 -->
            </ul>
            <!-- End Orders Submenu-1 -->
        </li>
        <!-- End Orders -->
        
        <!-- Contacts -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-contact">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-email"></i>
                </span>
                <span class="media-body align-self-center">Contacts</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Contacts Submenu-1 -->
            <ul id="subMenu-contact" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Contacts/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Orders v1 -->
            </ul>
            <!-- End Orders Submenu-1 -->
        </li>
        <!-- End Orders -->
        <!-- Orders -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-storage">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="icon_documents_alt"></i>
                </span>
                <span class="media-body align-self-center">Storage</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Orders Submenu-1 -->
            <ul id="subMenu-storage" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Storage/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Orders v1 -->
            </ul>
            <!-- End Orders Submenu-1 -->
        </li>
        <!-- End Orders -->
        <!-- Orders -->
        <li class="u-sidebar-navigation-v1-menu-item u-side-nav--has-sub-menu u-side-nav--top-level-menu-item">
            <a class="media u-side-nav--top-level-menu-link u-side-nav--hide-on-hidden g-px-15 g-py-12" href="#" data-hssm-target="#subMenu-review">
                <span class="d-flex align-self-center g-pos-rel g-font-size-18 g-mr-18">
                    <i class="hs-admin-pencil"></i>
                </span>
                <span class="media-body align-self-center">Reviews</span>
                <span class="d-flex align-self-center u-side-nav--control-icon">
                    <i class="hs-admin-angle-right"></i>
                </span>
                <span class="u-side-nav--has-sub-menu__indicator"></span>
            </a>

            <!-- Orders Submenu-1 -->
            <ul id="subMenu-review" class="u-sidebar-navigation-v1-menu u-side-nav--second-level-menu mb-0">
                <!-- Brands v1 -->
                <li class="u-sidebar-navigation-v1-menu-item u-side-nav--second-level-menu-item">
                    <a class="media u-side-nav--second-level-menu-link g-px-15 g-py-12" href="${context}/Reviews/List">
                        <span class="d-flex align-self-center g-mr-15 g-mt-minus-1">
                            <i class="hs-admin-list"></i>
                        </span>
                        <span class="media-body align-self-center">List</span>
                    </a>
                </li>
                <!-- End Orders v1 -->
            </ul>
            <!-- End Orders Submenu-1 -->
        </li>
        <!-- End Orders -->
        
    </ul>
</div>
<!-- End Sidebar Nav -->