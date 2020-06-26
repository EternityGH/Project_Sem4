<%-- 
    Document   : index
    Created on : May 25, 2020, 1:25:17 PM
    Author     : lark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.admin == null}">
    <c:redirect url="http://localhost:8080${context}/Admin/Login"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Voucher Page</title>
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
        <style>
            .noty {
                display: none;
            }
            
            .table td {
                border-bottom: 1px solid #dee2e6;
            }
        </style>
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
        
        $(".btn-delete").on("click", function(){
            event.preventDefault();
            var dataId = $(this).attr("data-id");
            
            $.ajax({
                url : 'Delete',
                data : {
                    id : dataId
                },
                success : function() {
                    $(".item-"+dataId).hide();
                    $(".noty").slideDown();
                    setInterval(function(){
                        $(".noty").slideUp();
                    }, 5000);
                }
            });
        });
        
        setInterval(function(){
            $(".noty_bar").slideUp();
        }, 5000);
    });
</script>
</body>
</html>
