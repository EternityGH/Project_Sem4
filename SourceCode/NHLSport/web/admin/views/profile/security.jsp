<%-- 
    Document   : index
    Created on : May 25, 2020, 1:25:17 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <link rel="stylesheet" href="${context}/admin/vendors/icon-hs/style.css">
        <link rel="stylesheet" href="${context}/admin/vendors/hs-admin-icons/hs-admin-icons.css">
        <!-- CSS Unify -->
        <link rel="stylesheet" href="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
        <link rel="stylesheet" href="${context}/admin/vendors/bootstrap/bootstrap-select.min.css">
        <link rel="stylesheet" href="${context}/admin/vendors/bootstrap/bootstrap-tagsinput.css">
        <link rel="stylesheet" href="${context}/admin/vendors/summernote/unify-lite.css">
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

                    <div class="g-pa-20">
                        <div class="row">
                            <div class="col-md-3 g-mb-30 g-mb-0--md">
                                <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                    <!-- User Information -->
                                    <section class="text-center g-mb-30 g-mb-50--md">
                                        <div class="d-inline-block g-pos-rel g-mb-20">
                                            <a class="u-badge-v2--lg u-badge--bottom-right g-width-32 g-height-32 g-bg-secondary g-bg-primary--hover g-transition-0_3 g-mb-20 g-mr-20" href="#">
                                                <i class="hs-admin-pencil g-absolute-centered g-font-size-16 g-color-white"></i>
                                            </a>
                                            <img class="img-fluid rounded-circle" src="${context}/admin/assets/img/avatar/user-male-icon.png"" alt="Image description">
                                        </div>

                                        <h3 class="g-font-weight-300 g-font-size-20 g-color-black mb-0">${admin.fullName}</h3>
                                    </section>
                                    <!-- User Information -->

                                    <!-- Profile Sidebar -->
                                    <section>
                                        <ul class="list-unstyled mb-0">
                                            <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                                                <a class="d-flex align-items-center u-link-v5 g-parent g-py-15 active" href="/NHLSport/Admin/Profile">
                                                    <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent-active g-mr-15">
                                                        <i class="hs-admin-user"></i>
                                                    </span>
                                                    <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">Profile Information</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </section>
                                    <section>
                                        <ul class="list-unstyled mb-0">
                                            <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                                                <a class="d-flex align-items-center u-link-v5 g-parent g-py-15 active" href="/NHLSport/Admin/Security">
                                                    <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent-active g-mr-15">
                                                          <i class="hs-admin-lock"></i>
                                                    </span>
                                                    <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">Security</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </section>
                                    <!-- End Profile Sidebar -->
                                </div>

                            </div>

                            <div class="col-md-9">
                                <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                    <form  method="post" action="${context}/Admin/updatePassword" class="js-validate">
                                        <input id="lastName" name="id" hidden value="${admin.id}">
                                        <input id="lastName" name="email" hidden value="${admin.email}">

                                        <header>
                                            <h2 class="text-uppercase g-font-size-12 g-font-size-default--md g-color-black mb-0">Change password</h2>
                                        </header>

                                        <hr class="d-flex g-brd-gray-light-v7 g-my-15 g-my-30--md">
                                        
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

                                        <div class="row g-mb-20">
                                            <div class="col-md-3">
                                                <label class="mb-0" for="#currentPassword">Current Password</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div>
                                                    <div class="form-group g-pos-rel mb-0">
                                                        <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                            <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                        </span>
                                                        <input id="currentPassword" name="currentPassword" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="password" required="required" data-msg="This field is mandatory"
                                                               data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                    </div>

                                                    <a class="form-text g-color-secondary" href="#">
                                                        <small class="g-font-size-default g-mt-8">Forgot Your Password?</small>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#newPassword">New Password</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="form-group g-pos-rel mb-0">
                                                    <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                    </span>
                                                    <input id="newPassword" name="newPassword" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="password" required="required" data-msg="This field is mandatory"
                                                           data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#confirmNewPassword">Confirm Password</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="form-group g-pos-rel mb-0">
                                                    <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                    </span>
                                                    <input id="confirmNewPassword" name="confirmNewPassword" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="password" required="required" data-msg="This field is mandatory"
                                                           data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                </div>
                                            </div>
                                        </div>

                                        <hr class="d-flex g-brd-gray-light-v7 g-my-15 g-my-30--md">

                                        <div>
                                            <button class="btn btn-md btn-xl--md u-btn-secondary g-width-160--md g-font-size-12 g-font-size-default--md g-mb-10" type="submit">Save Changes</button>
                                            <button class="btn btn-md btn-xl--md u-btn-outline-gray-dark-v6 g-font-size-12 g-font-size-default--md g-mr-10 g-mb-10" type="reset">Cancel</button>
                                        </div>
                                    </form>
                                </div>
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
    
    <script src="${context}/admin/vendors/appear/appear.js"></script>
    <script src="${context}/admin/vendors/bootstrap/bootstrap-select.min.js"></script>
    <script src="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${context}/admin/vendors/bloodhound/bloodhound.min.js"></script>
    <script src="${context}/admin/vendors/bloodhound/typeahead.jquery.min.js"></script>
    <script src="${context}/admin/vendors/bootstrap/bootstrap-tagsinput.min.js"></script>
    <script src="${context}/admin/vendors/summernote/summernote-bs4.min.js"></script>
    <script src="${context}/admin/vendors/jquery-filter/jquery.filer.min.js"></script>
    

    <!-- JS Unify -->
    <script src="${context}/admin/assets/js/unify/hs.core.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.side-nav.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.dropdown.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.scrollbar.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.text-editor.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.focus-state.js"></script>
    <script src="${context}/admin/vendors/file-attachments/hs.file-attachments.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.file-attachement.js"></script>
    
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
                dropdownHideOnScroll: false
            });
            // initialization of custom scrollbar
            $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));


        });
    </script>
</body>
</html>
