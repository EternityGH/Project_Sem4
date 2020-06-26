<%-- 
    Document   : index
    Created on : May 25, 2020, 1:25:17 PM
    Author     : Lark
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
        <title>Edit Voucher Page</title>
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
                <!-- Breadcrumb-v1 -->
                <div class="g-hidden-sm-down g-bg-gray-light-v8 g-pa-20">
                    <ul class="u-list-inline g-color-gray-dark-v6">
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="${context}/Admin/">Dashboard</a>
                            <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                        </li>
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="${context}/Admin/Vouchers/List">Vouchers</a>
                            <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                        </li>
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="${context}/Admin/Vouchers/Edit?id=${list.voucherId}">Edit</a>
                        </li>
                    </ul>
                </div>
                <!-- End Breadcrumb-v1 -->
                <div class="g-pa-20">
                    <div class="row">
                        <div class="col-md-9" style="margin: auto">
                            <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                <form  method="post" action="${context}/Admin/Vouchers/Update" class="js-validate">
                                    <input id="lastName" name="id" hidden value="${list.voucherId}" >
                                    <header>
                                        <h2 class="text-uppercase g-font-size-12 g-font-size-default--md g-color-black mb-0">Update Voucher</h2>
                                    </header>
                                    <hr class="d-flex g-brd-gray-light-v7 g-my-15 g-my-30--md">
                                    <h4 style="color: red">${errorUpdateVou}</h4>
                                    <div class="row g-mb-20">
                                        <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                            <label class="mb-0" for="#fullname">Code</label>
                                        </div>
                                        <div class="col-md-9 align-self-center">
                                            <div class="form-group g-pos-rel mb-0">
                                                <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                    <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                </span>
                                                <input id="code" name="code" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="text" required="required" data-msg="This field is mandatory"
                                                        data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true" value="${list.code}" pattern="^[0-9A-Za-z]{3,20}$" title="Enter code voucher [3-10]">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-mb-20">
                                        <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                            <label class="mb-0">Expiration Date</label>
                                        </div>
                                        <div class="col-md-9 align-self-center">
                                            <div class="row g-mx-minus-10">
                                                <div class="col-md align-self-center g-px-10 g-mb-20 g-mb-0--md">
                                                    <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                        <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                            <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                        </span>
                                                        <select name="Month" class="js-select u-select--v2-select" style="display: none;">
                                                            <option value="01">--</option>                                                               
                                                            <option value="01" <c:if test="${listDate[1] == '01'}">selected="" </c:if> >January</option>
                                                            <option value="02" <c:if test="${listDate[1] == '02'}">selected="" </c:if> >February</option>
                                                            <option value="03" <c:if test="${listDate[1] == '03'}">selected="" </c:if> >March</option>
                                                            <option value="04" <c:if test="${listDate[1] == '04'}">selected="" </c:if> >April</option>
                                                            <option value="05" <c:if test="${listDate[1] == '05'}">selected="" </c:if> >May</option>
                                                            <option value="06" <c:if test="${listDate[1] == '06'}">selected="" </c:if> >June</option>
                                                            <option value="07" <c:if test="${listDate[1] == '07'}">selected="" </c:if> >July</option>
                                                            <option value="08" <c:if test="${listDate[1] == '08'}">selected="" </c:if> >August</option>
                                                            <option value="09" <c:if test="${listDate[1] == '09'}">selected="" </c:if> >September</option>
                                                            <option value="10" <c:if test="${listDate[1] == '10'}">selected="" </c:if> >October</option>
                                                            <option value="11"  <c:if test="${listDate[1] == '11'}">selected="" </c:if> >November</option>
                                                            <option value="12"  <c:if test="${listDate[1] == '12'}">selected="" </c:if> >December</option>
                                                        </select>
                                                        <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-md-auto align-self-center g-width-100--md g-px-10">
                                                    <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                        <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                            <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                        </span> 
                                                        <c:set var="day" value="${fn:substring(daymonthyear, 0, 2)}"/>  
                                                        <select name="Day" class="js-select u-select--v2-select" style="display: none;">
                                                            <c:forEach begin="01" end="31" var="item">
                                                                <option value="${item}" <c:if test="${listDate[0] == item.toString()}">selected="" </c:if> >${item}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-md-auto align-self-center g-width-135--md g-px-10">
                                                    <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                        <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                            <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                        </span>
                                                        <c:set var="year" value="${fn:substring(daymonthyear, 6, 10)}"/>  
                                                        <select name="Year" class="js-select u-select--v2-select" style="display: none;">
                                                            <c:forEach begin="2020" end="2030" var="item">
                                                                <option value="${item}" <c:if test="${listDate[2] == item}">selected="" </c:if> >${item}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-mb-20">
                                        <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                            <label class="mb-0" for="#fullname">Discount</label>
                                        </div>
                                        <div class="col-md-9 align-self-center">
                                            <div class="form-group g-pos-rel mb-0">
                                                <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                    <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                </span>
                                                <input id="code" name="disc" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="text" required="required" data-msg="This field is mandatory"
                                                       data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true" value="${list.discount}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-mb-20">
                                        <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                            <label class="mb-0" for="#fullname">Status</label>
                                        </div>
                                        <div class="col-md-9 align-self-center">
                                            <!-- Toggles Views -->
                                            <label class="form-check-inline u-check g-mr-20 mx-0 mb-0" style="vertical-align: text-bottom;">
                                                <input class="g-hidden-xs-up g-pos-abs g-top-0 g-right-0"  value="true" name="status" type="checkbox" <c:if test="${list.status == true}"> checked=""</c:if> >
                                                <div class="u-check-icon-radio-v7">
                                                    <i class="fa" data-check-icon="&#xf00c" data-uncheck-icon="&#xf00d"></i>
                                                </div>
                                            </label>
                                            <!-- End Toggles Views -->
                                        </div>
                                    </div>
                                    <div>
                                        <button class="btn btn-md btn-xl--md u-btn-secondary g-width-160--md g-font-size-12 g-font-size-default--md g-mb-10" type="submit">Save Changes</button>
                                        <a href="${context}/Admin/Vouchers/List" class="btn btn-md btn-xl--md u-btn-outline-gray-dark-v6 g-font-size-12 g-font-size-default--md g-mr-10 g-mb-10">Cancel</a>
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