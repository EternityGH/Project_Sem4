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
        <title>Create Category Page</title>
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
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/admin/assets/css/styles.css">
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
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Categories</a>
                            <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                        </li>
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Create</a>
                        </li>
                    </ul>
                </div>
                <!-- End Breadcrumb-v1 -->

                <div class="g-pa-20">
                    <c:if test="${errors != null}">
                        <div class="noty_bar noty_type__error noty_theme__unify--v1 g-mb-25">
                            <div class="noty_body">
                                <div class="g-mr-20">
                                    <div class="noty_body__icon">
                                        <i class="hs-admin-alert"></i>
                                    </div>
                                </div>
                                <div><c:out value="${errors}" /></div>
                            </div>
                        </div>
                    </c:if>
                    <div class="row">
                        <!-- 1-st column -->
                        <div class="col-md-8" style="margin: 0 auto">
                            <!-- Basic Text Inputs -->
                            <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                <h3 class="d-flex align-self-center text-uppercase g-font-size-12 g-font-size-default--md g-color-black g-mb-20">Create New Employee</h3>


                                <form action="${context}/Admin/Employees/Store" method="post">
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10" for="inputGroup-1_1">Employee Code</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input required="required" id="inputGroup-1_1" name="code" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter employee code">
                                        </div>
                                    </div>
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10" for="inputGroup-1_1">Employee Name</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input required="required" id="inputGroup-1_1" name="fullName" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter full name">
                                        </div>
                                    </div>
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10" for="inputGroup-1_1">Email</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input required="required" id="inputGroup-1_1" name="email" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="email" placeholder="Enter email">
                                        </div>
                                    </div>
                                    <!-- End Default Input -->
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10" for="inputGroup-1_1">Password</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input required="required" id="inputGroup-1_1" name="password" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter password">
                                        </div>
                                    </div>
                                    <!-- End Default Input -->
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10" for="inputGroup-1_1">Confirm Password</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input required="required" id="inputGroup-1_1" name="confirmPassword" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter confirm password">
                                        </div>
                                    </div>
                                    <!-- End Default Input -->                                        
                                    <div>
                                        <button class="btn btn-md btn-xl--md u-btn-secondary g-width-160--md g-font-size-12 g-font-size-default--md g-mb-10" type="submit">
                                            Save Changes
                                        </button>
                                        <button class="btn btn-md btn-xl--md u-btn-outline-gray-dark-v6 g-font-size-12 g-font-size-default--md g-mr-10 g-mb-10" type="reset">
                                            Cancel
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <!-- End Basic Text Inputs -->
                        </div>
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
