<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products</title>
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/css/styles.css">
        <!-- Normalize -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/normalize/normalize.css">
        <!-- Bootstrap 4.0.0 -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-4.0.0-dist/css/bootstrap.min.css" >
        <!-- Animate -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/animate/animate.css">
        <!-- Elegant Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Elegants/style.css">
        <!-- Glyphicon Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Glyphicons/style.css">
        <!-- FontAwesome -->
        <script src="https://kit.fontawesome.com/0644aaed0c.js" crossorigin="anonymous"></script>
        <style>
            ul.pagination {
                float: right;
            }

            ul.pagination .page-item.prev, ul.pagination .page-item.next {
                display: none;
            }

            ul.pagination .page-item .page-link {
                color: #446084;
                border: 1px solid #446084;
            }

            ul.pagination .page-item {
                transition: 0.3s all;
            }

            ul.pagination .page-item.active .page-link {
                color: #fff;
                background-color: #446084;
            }

            ul.pagination .page-item .page-link:focus {
                outline: none;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../layout/navigation.jsp" />

        <div class="bread-crumb">
            <div class="container">
                <div class="item">
                    <a href="#">Home</a>
                </div>
                <div class="item">
                    <span><i class="arrow_carrot-right"></i></span>
                </div>
                <div class="item active">
                    <a href="#">Products</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="products-page">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="side-bar">
                            <ul class="nav-profile">
                                <li class="item">
                                    <h3 class="wg-title">
                                        Categories
                                    </h3>
                                    <c:forEach var="item" items="${listCat}">
                                        <a href="${context}/Products/Sort-By-Item?catId=${item.categoryId}&brandId=<%= request.getParameter("brandId")%>&gender=<%=request.getParameter("gender")%>">
                                            <span>${item.name}</span>
                                        </a>
                                    </c:forEach>
                                </li>
                                <li class="item">
                                    <h3 class="wg-title">
                                        Brands
                                    </h3>
                                    <c:forEach var="item" items="${listBrand}">
                                        <a class="" href="${context}/Products/Sort-By-Item?catId=<%=request.getParameter("catId")%>&brandId=${item.brandId}&gender=<%=request.getParameter("gender")%>">
                                            <span>${item.name}</span>
                                        </a>
                                    </c:forEach>
                                </li>
                                <li class="item">
                                    <h3 class="wg-title">
                                        Gender  
                                    </h3>

                                    <a class="" href="${context}/Products/Sort-By-Item?catId=<%=request.getParameter("catId")%>&brandId=<%=request.getParameter("brandId")%>&gender=1">
                                        <span>Men</span>
                                    </a>
                                    <a class="" href="${context}/Products/Sort-By-Item?catId=<%=request.getParameter("catId")%>&brandId=<%=request.getParameter("brandId")%>&gender=2">
                                        <span>Women</span>
                                    </a>
                                    <a class="" href="${context}/Products/Sort-By-Item?catId=<%=request.getParameter("catId")%>&brandId=<%=request.getParameter("brandId")%>&gender=3">
                                        <span>Unisex</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <h3 class="wg-title">
                                        Ratings
                                    </h3>
                                    <a href="">
                                        <span>(from 5 stars)</span>
                                    </a>
                                    <a href="">
                                        <span>(from 4 stars)</span>
                                    </a>
                                    <a href="">
                                        <span>(from 3 stars)</span>
                                    </a>
                                </li>
                            </ul>
                            <!-- End ul.nav-profile -->
                        </div>
                        <!-- End div.side-bar -->
                    </div>
                    <!-- End div.col-md-4 -->
                    <div class="col-md-9">
                        <div class="row list-product">
                            <div class="col-md-12 mb-5">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="${context}/assets/images/products/slider-3.png" alt="First slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h1 style="font-family: 'Poppins'; letter-spacing: 0.7px; font-weight: 600;">OVERSIZED & LONGLINE</h1>
                                                <p style="font-family: 'Poppins'; letter-spacing: 0.1px;">WELCOME THE NEW OVERSIZED T-SHIRTS</p>
                                                <div style="width: 60px; border-bottom: 1px solid #fff; margin: 10px auto 70px auto;"></div>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="${context}/assets/images/products/slide-2.png" alt="Second slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h1 style="font-family: 'Poppins'; letter-spacing: 0.7px; font-weight: 600;">NEW SEASON SALE</h1>
                                                <p style="font-family: 'Poppins'; letter-spacing: 0.1px;">STRAP INTO THE NEW SEASON</p>
                                                <div style="width: 60px; border-bottom: 1px solid #fff; margin: 10px auto 70px auto;"></div>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="${context}/assets/images/products/slider1.jpg" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h1 style="font-family: 'Poppins'; letter-spacing: 0.7px; font-weight: 600;">COLLECTION WINTER</h1>
                                                <p style="font-family: 'Poppins'; letter-spacing: 0.1px;">DRESS FOR THE MAIN STAGE WITH FESTIVAL-READY CROCHET</p>
                                                <div style="width: 60px; border-bottom: 1px solid #fff; margin: 10px auto 70px auto;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <!-- End div.col -->
                            <c:forEach var="item" items="${listProd}">
                                <div class="col-md-4 contentPage">
                                    <div class="block-product">
                                        <c:set var="url" value="${fn:split(item.imageUrl, ';')}"/>
                                        <div href="#" class="img" data-url="${context}/assets/images/products/${url[0]}" style="background-image: url(${context}/assets/images/products/${url[0]});">
                                            <a href="${context}/Products/Detail?id=${item.productId}" class="view"><i class="far fa-eye"></i></a>
                                        </div>
                                        <div class="information">
                                            <div class="text">
                                                <a href="#" class="name" data-name="${item.productName}">
                                                    <c:out value="${item.productName}"/>
                                                </a>
                                                <p class="price" data-price="${item.price}"><c:out value="${item.price}"/>$</p>
                                            </div>
                                            <div class="btn-shopping">
                                                <a href="${context}/Cart/StoreItemInCart?id=${item.productId}" data-id="${item.productId}" class="btn-add-cart btn">
                                                    <i class="icon_cart_alt"></i>
                                                </a>
                                                <a href="${context}/Products/AddToListCompare?id=${item.productId}" class="btn-compare btn">
                                                    <i class="icon_tags_alt"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End div.block-product -->
                                </div>
                                <!-- End div.col -->
                            </c:forEach>
                        </div>
                        <!-- End div.row -->
                        <div class="row">
                            <div class="col-md-12">                              
                                <div id="pagination">

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">                              
                                <h3>PRODUCTS VIEWED</h3>
                            </div>
                        </div>
                    </div>
                    <!-- End div.col-md-9 -->
                </div>
                <!-- End div.row -->
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.products-page -->

        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script src="${context}/vendors/twbsPagination/jquery.twbsPagination.js"></script>
        <script>
            $(function() {
                var pageSize = 9; // Hi?n th? 6 s?n ph?m trên 1 trang
                showPage = function(page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function(n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                };
                showPage(1);
                ///** C?n truy?n giá tr? vào ?ây **///
                var totalRows = 10; // T?ng s? s?n ph?m hi?n th?
                var btnPage = 5; // S? nút b?m hi?n th? di chuy?n trang
                var iTotalPages = Math.ceil(${listProd.size()} / pageSize);
                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function(event, page) {
                        showPage(page);
                    }
                });
            });
        </script>
    </body>
</html>
