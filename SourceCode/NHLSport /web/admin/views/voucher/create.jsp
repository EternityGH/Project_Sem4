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
        <title>Create Voucher Page</title>
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
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="${context}/Admin/Vouchers/Create">Create</a>
                        </li>
                    </ul>
                </div>
                <!-- End Breadcrumb-v1 -->
                <div class="g-pa-20">
                    <c:if test="${errorCreateVou != null}">
                        <div class="noty noty_bar noty_type__error noty_theme__unify--v1 g-mb-25">
                            <div class="noty_body">
                                <div class="g-mr-20">
                                    <div class="noty_body__icon">
                                        <i class="hs-admin-alert"></i>
                                    </div>
                                </div>
                                <div class="error">${errorCreateVou}</div>
                            </div>
                        </div>
                        <c:remove var="errorCreateVou" />
                    </c:if>
                    <div class="row">
                        <div class="col-md-9" style="margin: auto">
                            <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                <form  method="post" action="${context}/Admin/Vouchers/Store" class="js-validate">
                                    <input id="lastName" name="id" hidden >
                                    <header>
                                        <h2 class="text-uppercase g-font-size-12 g-font-size-default--md g-color-black mb-0">Create New Voucher</h2>
                                    </header>
                                    <hr class="d-flex g-brd-gray-light-v7 g-my-15 g-my-30--md">
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
                                                       data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true" pattern="^[0-9A-Za-z]{3,20}$" title="Enter code voucher [3-10]">
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
                                                                                                                        
                                                            <option value="01">January</option>
                                                            <option value="02">February</option>
                                                            <option value="03">March</option>
                                                            <option value="04">April</option>
                                                            <option value="05">May</option>
                                                            <option value="06">June</option>
                                                            <option value="07">July</option>
                                                            <option value="08">August</option>
                                                            <option value="09">September</option>
                                                            <option value="10">October</option>
                                                            <option value="11">November</option>
                                                            <option value="12">December</option>
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
                                                            
                                                            <option value="01">1</option>
                                                            <option value="02">2</option>
                                                            <option value="03">3</option>
                                                            <option value="04">4</option>
                                                            <option value="05">5</option>
                                                            <option value="06">6</option>
                                                            <option value="07">7</option>
                                                            <option value="08">8</option>
                                                            <option value="09">9</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                            <option value="13">13</option>
                                                            <option value="14">14</option>
                                                            <option value="15">15</option>
                                                            <option value="16">16</option>
                                                            <option value="17">17</option>
                                                            <option value="18">18</option>
                                                            <option value="19">19</option>
                                                            <option value="20">20</option>
                                                            <option value="21">21</option>
                                                            <option value="22">22</option>
                                                            <option value="23">23</option>
                                                            <option value="24">24</option>
                                                            <option value="25">25</option>
                                                            <option value="26">26</option>
                                                            <option value="27">27</option>
                                                            <option value="28">28</option>
                                                            <option value="29">29</option>
                                                            <option value="30">30</option>
                                                            <option value="31">31</option>
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
                                                            <option value="2020" selected="true">2020</option>
                                                            <option value="2021">2021</option>
                                                            <option value="2022">2022</option>
                                                            <option value="2023">2023</option>
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
                                                       data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
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
                                                <input class="g-hidden-xs-up g-pos-abs g-top-0 g-right-0"  value="true" name="status" type="checkbox">
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
            
            setInterval(function(){
                $(".noty_bar").slideUp();
            }, 5000);
        });
    </script>
</body>
</html>