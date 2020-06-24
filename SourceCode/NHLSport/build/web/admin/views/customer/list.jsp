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
        <title>List Customers Page</title>
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
        <link rel="stylesheet" href="${context}/admin/vendors/bootstrap/bootstrap-select.min.css">
        <link rel="stylesheet" href="${context}/admin/assets/css/unify-admin.css">
    </head>
    <body>

        <jsp:include page="../layout/header.jsp" />
        
    <main class="container-fluid px-0 g-pt-65">
        <div class="row no-gutters g-pos-rel g-overflow-x-hidden">

            <jsp:include page="../layout/navigation.jsp" />


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
                    <h1 class="g-font-weight-300 g-font-size-28 g-color-black g-mb-30">All Customers</h1>

                    <div class="media-md align-items-center g-mb-30">
                        <div class="d-flex g-mb-15 g-mb-0--md">
                            <h3 class="g-font-weight-400 g-font-size-16 g-color-black mb-0">Table Customers</h3>
                        </div>

                        <div class="media d-md-flex align-items-center ml-auto">
                            <div class="d-flex align-items-center">
                                <span class="g-hidden-sm-down g-color-gray-dark-v6 g-mr-12">Show:</span>

                                <div class="u-select--v1 g-pr-20">
                                    <select id="datatableEntries1" class="js-select u-select--v1-select w-100">
                                        <option data-content='<span class="d-flex align-items-center g-line-height-1_2 g-color-black">5 Entries</span>' value="5">5 Entries</option>
                                        <option data-content='<span class="d-flex align-items-center g-line-height-1_2 g-color-black">10 Entries</span>' value="10">10 Entries</option>
                                        <option data-content='<span class="d-flex align-items-center g-line-height-1_2 g-color-black">15 Entries</span>' value="15">15 Entries</option>
                                        <option data-content='<span class="d-flex align-items-center g-line-height-1_2 g-color-black">20 Entries</span>' value="20">20 Entries</option>
                                        <option data-content='<span class="d-flex align-items-center g-line-height-1_2 g-color-black">25 Entries</span>' value="25">25 Entries</option>
                                    </select>
                                    <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6"></i>
                                </div>
                            </div>

                            <div class="d-flex g-ml-15 g-ml-55--md">
                                <div class="input-group g-pos-rel g-width-320--md">
                                    <input id="datatableSearch1" class="form-control g-font-size-default g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-rounded-20 g-pl-20 g-pr-50 g-py-10" type="text" placeholder="Search for name, position">
                                    <button class="btn g-pos-abs g-top-0 g-right-0 g-z-index-2 g-width-60 h-100 g-bg-transparent g-font-size-16 g-color-primary g-color-secondary--hover rounded-0" type="submit">
                                        <i class="hs-admin-search g-absolute-centered"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="g-mb-40">
                        <div class="table-responsive">
                            <table class="js-datatable table u-table--v3 u-editable-table--v1 g-color-black" data-dt-info="#datatableInfo1" data-dt-search="#datatableSearch1" data-dt-entries="#datatableEntries1" data-dt-is-show-paging="true" data-dt-pagination="datatablePagination1"
                                   data-dt-page-length="5" data-dt-is-responsive="false" data-dt-pagination-classes="list-inline text-right mb-0" data-dt-pagination-items-classes="list-inline-item g-hidden-sm-down" data-dt-pagination-links-classes="u-pagination-v1__item u-pagination-v1-2 g-bg-secondary--active g-color-white--active g-brd-gray-light-v7 g-brd-secondary--hover g-brd-secondary--active g-rounded-4 g-py-8 g-px-15"
                                   data-dt-pagination-next-classes="list-inline-item" data-dt-pagination-next-link-classes="u-pagination-v1__item u-pagination-v1-2 g-brd-gray-light-v7 g-brd-secondary--hover g-rounded-4 g-py-8 g-px-12" data-dt-pagination-next-link-markup='<span class="g-line-height-1 g-valign-middle" aria-hidden="true"><i class="hs-admin-angle-right"></i></span><span class="sr-only">Next</span>'
                                   data-dt-pagination-prev-classes="list-inline-item" data-dt-pagination-prev-link-classes="u-pagination-v1__item u-pagination-v1-2 g-brd-gray-light-v7 g-brd-secondary--hover g-rounded-4 g-py-8 g-px-12" data-dt-pagination-prev-link-markup='<span class="g-line-height-1 g-valign-middle" aria-hidden="true"><i class="hs-admin-angle-left"></i></span><span class="sr-only">Prev</span>'>
                                <thead>
                                    <tr>
                                        <th>
                                <div class="media">
                                    <div class="d-flex align-self-center">#</div>

                                    <div class="d-flex align-self-center ml-auto">
                                        <span class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
                                            <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                <i class="hs-admin-angle-up"></i>
                                            </a>
                                            <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                <i class="hs-admin-angle-down"></i>
                                            </a>
                                        </span>
                                    </div>
                                </div>
                                </th>
                                <th>
                                <div class="media">
                                    <div class="d-flex align-self-center">Name</div>

                                    <div class="d-flex align-self-center ml-auto">
                                        <span class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
                                            <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                <i class="hs-admin-angle-up"></i>
                                            </a>
                                            <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                <i class="hs-admin-angle-down"></i>
                                            </a>
                                        </span>
                                    </div>
                                </div>
                                </th>
                                <th>
                                    <div class="media">
                                        <div class="d-flex align-self-center">Email</div>

                                        <div class="d-flex align-self-center ml-auto">
                                            <span class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
                                                <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                    <i class="hs-admin-angle-up"></i>
                                                </a>
                                                <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                    <i class="hs-admin-angle-down"></i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="media">
                                        <div class="d-flex align-self-center">Status</div>

                                        <div class="d-flex align-self-center ml-auto">
                                            <span class="d-inline-block g-width-10 g-line-height-1 g-font-size-10">
                                                <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                    <i class="hs-admin-angle-up"></i>
                                                </a>
                                                <a class="g-color-gray-light-v6 g-color-secondary--hover g-text-underline--none--hover" href="#">
                                                    <i class="hs-admin-angle-down"></i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </th>
                                <th></th>
                                </tr>
                                </thead>

                                <tbody>
                                    <c:set var="i" value="0" />
                                    <c:forEach var="cus" items="${listCus}">
                                        <tr>
                                            <td><c:out value="${i = i + 1}" /></td>
                                            <td><c:out value="${cus.fullName}" /></td>
                                            <td><c:out value="${cus.email}" /></td>
                                            <td>
                                                <c:if test = "${cus.status == 'True'}">
                                                    <div class="d-inline-block">
                                                        <span class="d-flex align-items-center justify-content-center u-tags-v1 g-brd-around g-bg-gray-light-v8 g-bg-gray-light-v8 g-font-size-default g-color-gray-dark-v6 g-rounded-50 g-py-4 g-px-15">
                                                            <span class="u-badge-v2--md g-pos-stc g-transform-origin--top-left g-bg-lightblue-v3 g-mr-8"></span>
                                                            <c:out value="Active" />
                                                        </span>
                                                    </div>
                                                </c:if>
                                                <c:if test = "${cus.status == 'False'}">
                                                    <div class="d-inline-block">
                                                        <span class="d-flex align-items-center justify-content-center u-tags-v1 g-brd-around g-bg-gray-light-v8 g-bg-gray-light-v8 g-font-size-default g-color-gray-dark-v6 g-rounded-50 g-py-4 g-px-15">
                                                            <span class="u-badge-v2--md g-pos-stc g-transform-origin--top-left g-bg-lightred-v2 g-mr-8"></span>
                                                            <c:out value="InActive" />
                                                        </span>
                                                    </div>
                                                </c:if>
                                            </td>
                                            <td class="text-right">
                                                <div class="g-pos-rel g-top-3 d-inline-block">
                                                    <a id="dropDown1Invoker" class="u-link-v5 g-line-height-0 g-font-size-24 g-color-gray-light-v6 g-color-secondary--hover" href="#" aria-controls="dropDown-${cus.customerId}" aria-haspopup="true" aria-expanded="false" data-dropdown-event="click" data-dropdown-target="#dropDown-${cus.customerId}">
                                                        <i class="hs-admin-more-alt"></i>
                                                    </a>

                                                    <div id="dropDown-${cus.customerId}" class="u-shadow-v31 g-pos-abs g-right-0 g-z-index-2 g-bg-white u-dropdown--css-animation u-dropdown--hidden u-dropdown--reverse-y" aria-labelledby="dropDown1Invoker">
                                                        <ul class="list-unstyled g-nowrap mb-0">
                                                            <li>
                                                                <a class="d-flex align-items-center u-link-v5 g-bg-gray-light-v8--hover g-font-size-12 g-font-size-default--md g-color-gray-dark-v6 g-px-25 g-py-14" href="#">
                                                                    <i class="hs-admin-pencil g-font-size-18 g-color-gray-light-v6 g-mr-10 g-mr-15--md"></i>
                                                                    Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="d-flex align-items-center u-link-v5 g-bg-gray-light-v8--hover g-font-size-12 g-font-size-default--md g-color-gray-dark-v6 g-px-25 g-py-14" href="#">
                                                                    <i class="hs-admin-trash g-font-size-18 g-color-gray-light-v6 g-mr-10 g-mr-15--md"></i>
                                                                    Delete
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                     </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="media align-items-center g-mb-45">
                        <div id="datatableInfo1" class="media-body"></div>

                        <nav id="datatablePagination1" class="d-flex ml-auto" aria-label="Page Navigation"></nav>
                    </div>

                </div>
                 <jsp:include page="../layout/footer.jsp" />               
            </div>
        </div>
</main>




<script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
<script src="${context}/admin/vendors/jquery-migrate/jquery-migrate.min.js"></script>
<script src="${context}/vendors/popper/popper.min.js"></script>
<script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
<script src="${context}/admin/vendors/cookiejs/jquery.cookie.js"></script>

<script src="${context}/admin/vendors/appear/appear.js"></script>
<script src="${context}/admin/vendors/bootstrap/bootstrap-select.min.js"></script>
<script src="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${context}/admin/vendors/datatables/jquery.dataTables.min.js"></script>
<script src="${context}/admin/vendors/datatables/dataTables.select.js"></script>

<!-- JS Unify -->
<script src="${context}/admin/assets/js/unify/hs.core.js"></script>
<script src="${context}/admin/assets/js/unify/hs.side-nav.js"></script>
<script src="${context}/admin/assets/js/unify/hs.dropdown.js"></script>
<script src="${context}/admin/assets/js/unify/hs.scrollbar.js"></script>
<script src="${context}/admin/assets/js/unify/hs.datatables.js"></script>

<script src="${context}/admin/assets/js/script.js"></script>

<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function() {
        // initialization of custom select
        $('.js-select').selectpicker();

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
            dropdownHideOnScroll: false,
            dropdownType: 'css-animation',
            dropdownAnimationIn: 'fadeIn',
            dropdownAnimationOut: 'fadeOut'
        });

        // initialization of custom scrollbar
        $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

        // initialization of datatables
        $.HSCore.components.HSDatatables.init('.js-datatable');
    });
</script>
</body>
</html>
