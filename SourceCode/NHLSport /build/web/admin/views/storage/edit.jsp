<%-- 
    Document   : index
    Created on : Jun 21, 2020, 1:25:17 PM
    Author     : Lark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
                <!-- Breadcrumb-v1 -->
                <div class="g-hidden-sm-down g-bg-gray-light-v8 g-pa-20">
                    <ul class="u-list-inline g-color-gray-dark-v6">

                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Dashboard</a>
                            <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                        </li>
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Storage</a>
                            <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
                        </li>
                        <li class="list-inline-item g-mr-10">
                            <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">Add More</a>
                        </li>
                    </ul>
                </div>
                <!-- End Breadcrumb-v1 -->

                <div class="g-pa-20">
                    <h1 class="g-font-weight-300 g-font-size-28 g-color-black g-mb-28" style="text-align: center; font-weight: bold">Add More Quantity</h1>
                    <form action="${context}/Admin/Storage/UpdateStorage"  method="post">
                        <div class="row">
                            <!-- 1-st column -->
                            <div class="col-md-9">
                                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                    <!-- Advanced File Input -->
                                    <div class="form-group mb-0">
                                        <c:set var="yasuo" value="${fn:split(list.productId.imageUrl, ';')}"/>
                                        <c:forEach items="${yasuo}" var="url">  
                                            <img src="${context}/assets/images/products/${url}" height="80" width="80"/>
                                        </c:forEach>

                                    </div>
                                    <!-- End Advanced File Input -->
                                </div>
                                <!-- Basic Text Inputs -->
                                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                    <!-- Default Input -->

                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10">Product Name</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter product name" value="${list.productId.productName}" readonly="">
                                        </div>
                                    </div>
                                    <!-- End Default Input -->
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10">Price</label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="text" placeholder="Enter price" value="${list.productId.price}" readonly="">
                                        </div>
                                    </div>
                                    <!-- End Default Input -->
                                    
                                    <!-- Default Input -->
                                    <div class="form-group g-mb-30">
                                        <label class="g-mb-10">Enter quantity to Edit </label>
                                        <div class="g-pos-rel">
                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                            </span>
                                            <input name="quanEdit" value="${list.quantity}" class="form-control form-control-md g-brd-gray-light-v7 g-brd-gray-light-v3--focus g-rounded-4 g-px-14 g-py-10" type="number"  placeholder="Enter quantity" min="1" max="10000" required="" title="Please enter digit [0-10000]" >
                                        </div>
                                    </div>
                                    <!-- End Default Input -->
                                </div>

                                <!-- End Basic Text Inputs -->
                            </div>
                            <!-- End col-9 -->
                            <div class="col-md-3">
                                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                    <!-- Default Select -->
                                    <div class="g-mb-10">
                                        <label class="g-mb-10">Categories</label>

                                        <div class="form-group u-select--v3 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                            <select  class="js-select u-select--v3-select u-sibling w-100" title="Select Category" style="display: none;" data-live-search="true" disabled="">
                                                <c:forEach var="item" items="${listCat}">
                                                    ${item}
                                                    <option value="${item.categoryId}" data-content='<span class="d-flex align-items-center w-100"><span>${item.name}</span></span>' <c:if test="${item.categoryId == list.productId.categoryId.categoryId}">selected="true" </c:if>>
                                                        <c:out value="${item.name}"  />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <div class="d-flex align-items-center g-absolute-centered--y g-right-0 g-color-gray-light-v6 g-color-lightblue-v9--sibling-opened g-mr-15">
                                                <i class="hs-admin-angle-down"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Default Select -->
                                </div>
                                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                    <!-- Default Select -->
                                    <div class="g-mb-10">
                                        <label class="g-mb-10">Brands</label>

                                        <div class="form-group u-select--v3 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                            <select  class="js-select u-select--v3-select u-sibling w-100" title="Select Brand" style="display: none;" data-live-search="true" disabled="">

                                                <c:forEach var="item" items="${listBrand}">
                                                    <option value="${item.brandId}" data-content='<span class="d-flex align-items-center w-100"><span>${item.name}</span></span>' <c:if test="${item.brandId == list.productId.brandId.brandId}">selected="true" </c:if> >
                                                        <c:out value="${item.name}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <div class="d-flex align-items-center g-absolute-centered--y g-right-0 g-color-gray-light-v6 g-color-lightblue-v9--sibling-opened g-mr-15">
                                                <i class="hs-admin-angle-down"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Default Select -->
                                </div>
                                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                                    <!-- Default Select -->
                                    <div class="g-mb-10">
                                        <label class="g-mb-10">Gender</label>
                                        <div class="form-group u-select--v3 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                            <select  class="js-select u-select--v3-select u-sibling w-100" title="Select Gender" style="display: none;" data-live-search="true" disabled="">
                                                <option value="1" data-content='<span class="d-flex align-items-center w-100"><span>Men</span></span>' <c:if test="${list.productId.gender == 1}"> selected="true"  </c:if>  disabled="">
                                                        Men
                                                    </option>
                                                    <option value="2" data-content='<span class="d-flex align-items-center w-100"><span>Women</span></span>'  <c:if test="${list.productId.gender == 2}"> selected="true" </c:if> disabled="">
                                                        Women
                                                    </option>
                                                    <option value="3" data-content='<span class="d-flex align-items-center w-100"><span>Women</span></span>'  <c:if test="${list.productId.gender == 3}"> selected="true" </c:if> disabled="">
                                                        Unisex
                                                    </option>
                                                </select>
                                                <div class="d-flex align-items-center g-absolute-centered--y g-right-0 g-color-gray-light-v6 g-color-lightblue-v9--sibling-opened g-mr-15">
                                                    <i class="hs-admin-angle-down"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Default Select -->
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div>
                                        <button class="btn btn-md btn-xl--md u-btn-secondary g-width-160--md g-font-size-12 g-font-size-default--md g-mb-10" type="submit">
                                            Save
                                        </button>
                                        <a href="${context}/Admin/Storage/List" class="btn btn-md btn-xl--md u-btn-outline-gray-dark-v6 g-font-size-12 g-font-size-default--md g-mr-10 g-mb-10">Cancel</a>
                                    </div>
                                </div>
                            </div>

                        </form>
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

            $.HSCore.helpers.HSFileAttachments.init();
            $.HSCore.components.HSFileAttachment.init('.js-file-attachment');
            $.HSCore.helpers.HSFocusState.init();

            // initialization of custom scrollbar
            $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

            // initialization of text editors
            $.HSCore.components.HSTextEditor.init('.js-text-editor');

        });
    </script>