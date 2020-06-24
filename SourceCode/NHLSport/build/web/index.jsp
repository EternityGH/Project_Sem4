<%-- 
    Document   : index
    Created on : Apr 22, 2020, 9:56:44 AM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${listProd == null}">
    <c:redirect url="http://localhost:8080${context}/Home/"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
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
    </head>
    <body>
        <jsp:include page="views/layout/navigation.jsp" />

        <div class="header">
            <div class="middle-block">
                <div class="caption">
                    <div class="border-top-left"></div>
                    <div class="border-top-right"></div>
                    <h1 class="animated fadeIn">New in bag</h1>
                    <span class="txt-top animated fadeInDown">It's time to get smart</span>
                    <span class="txt-bottom animated fadeInUp">Big sale - 50% shop</span>
                    <div class="border-bottom-left"></div>
                    <div class="border-bottom-right"></div>
                    <a href="#" class="view-all">
                        <span class="txt">View all</span>
                    </a>
                    <div class="border-view-left"></div>
                    <div class="border-view-right"></div>
                </div>
            </div>
            <!-- End div.middle-block -->
        </div>
        <!-- End div.header -->

        <section class="list-category">
            <div class="container">
                <div class="title">
                    <h1>Are you looking for yourself?</h1>
                </div>
                <!-- End div.title -->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="block-category">
                            <div class="img"  style="background-image: url(${context}/assets/images/home-page-shoes.jpg);"></div>
                            <div class="text-center">
                                <a href="#">Shoes</a>
                            </div>
                        </div>
                        <!-- End div.block-category -->
                    </div>
                    <!-- End div.col -->
                    <div class="col-sm-4">
                        <div class="block-category">
                            <div class="img" style="background-image: url(${context}/assets/images/home-page-shirt.jpg);"> </div>
                            <div class="text-center">
                                <a href="#">T-Shirt</a>
                            </div>
                        </div>
                        <!-- End div.block-category -->
                    </div>
                    <div class="col-sm-4">
                        <div class="block-category">
                            <div class="img" style="background-image: url(${context}/assets/images/home-page-watch.jpg)" ></div>
                            <div class="text-center">
                                <a href="#">Watch</a>
                            </div>
                        </div>
                        <!-- End div.block-category -->
                    </div>
                </div>
                <!-- End div.row -->
            </div>
            <!-- End div.container -->
        </section>
        <!-- End section.list-category -->

        <section class="best-seller">
            <div class="container">
                <div class="title">
                    <h1>The Best Items</h1>
                    <h6>TOP SALE FOR ALL DAYS</h6>
                </div>
                <!-- End div.title -->
                <div class="row">
                    <c:set var="i" value="0" />
                    <c:forEach var="item" items="${listProd}">
                        <c:set var="i" value="${i = i + 1}" />
                        <c:if test="${item.brandId.status == true && item.categoryId.status == true && i <= 8}">
                            <div class="col-md-3">
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
                                            <a href="${context}/Products/AddToListCompare?id=${item.productId}" data-id="${item.productId}" class="btn-compare btn">
                                                <i class="icon_tags_alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- End div.block-product -->
                            </div>
                            <!-- End div.col -->
                        </c:if>
                    </c:forEach>
                </div>
                <!-- End div.row -->
            </div>
            <!-- End div.container -->
        </section>
        <!-- End section.best-seller -->

        <jsp:include page="views/layout/footer.jsp" />

        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script>
            $(document).ready(function(){
                $(".btn-compare").on("click", function(){
                    event.preventDefault();
                    var dataId  = $(this).attr("data-id");
                     $.ajax({
                        url : '../Products/AddToListCompare',
                        data : {
                            id : dataId
                        },
                        success : function(data) {
                            $('.notification').css({'right':'15px','opacity':'1'});
                            $('.notification .messages').text(data);
                        }
                    });
                });

                $(".btn-add-cart").on("click", function(){
                    event.preventDefault();

                    var dataId  = $(this).attr("data-id");
                    var name    = $(this).parents(".information").children(".text").children(".name").attr("data-name");
                    var price   = $(this).parents(".information").children(".text").children(".price").attr("data-price");
                    var url     = $(this).parents(".block-product").children(".img").attr("data-url");

                    $.ajax({
                        url : '../Cart/StoreItemInCart',
                        data : {
                            id : dataId
                        },
                        success : function(data) {
                            var check = $("#"+dataId);

                            if(check.length > 0){
                                var quantity = parseInt($(".cart-quan-"+dataId).text());
                                quantity+=1;
                                $(".cart-quan-"+dataId).text(quantity);
                                var total = parseInt($("#cart-total").text());
                                total = total + parseInt(price);
                                $("#cart-total").text(total);
                            }
                            else {
                                if($(".dropdown-cart li.null-product").length > 0){
                                    $(".dropdown-cart li.null-product").remove();
                                    var html = '<li class="html">'+
                                                    '<div>'+
                                                        '<ul class="product-list">'+
                                                        '<li id="'+dataId+'">'+
                                                            '<a class="remove" href="${context}/Cart/Delete?id='+dataId+'">x</a>'+
                                                            '<a href="${context}/Products/Detail?id='+dataId+'">'+
                                                                '<img src="'+url+'" />'+
                                                                '<span>'+name+'</span>'+
                                                            '</a>'+
                                                            '<span class="quantity">'+
                                                                '<span class="cart-quan-'+dataId+'">1</span> ×'+ 
                                                                '<span class="amount">'+
                                                                    price+
                                                                    '<span>$</span>'+
                                                                '</span>'+
                                                            '</span>'+
                                                        '</li>'+
                                                '</ul>'+
                                                '<!-- End product-list -->'+
                                                '<p class="total">'+
                                                    '<strong>Total:</strong> '+
                                                    '<span class="amount">'+
                                                        '<span id="cart-total">'+price+'</span>'+
                                                        '<span>$</span>'+
                                                    '</span>'+	
                                                '</p>'+
                                                '<!-- End total -->'+
                                                '<p class="buttons">'+
                                                    '<a href="${context}/Cart/" class="button wc-forward">View cart</a>'+
                                                    '<a href="${context}/Cart/Checkout" class="button checkout wc-forward">Checkout</a>'+
                                                '</p>'+
                                                '<!-- End button -->'+
                                            '</div>'+
                                        '</li>';
                                    $(".dropdown-cart").html(html);
                                    $(".cart-total").first().text("1");
                                }
                                else {
                                    var total = parseInt($("#cart-total").text());
                                    total = total + parseInt(price);
                                    $("#cart-total").text(total);
                                    var html = '<li id="'+dataId+'">'+
                                                            '<a class="remove" href="${context}/Cart/Delete?id='+dataId+'">x</a>'+
                                                            '<a href="${context}/Products/Detail?id='+dataId+'">'+
                                                                '<img src="'+url+'" />'+
                                                                '<span>'+name+'</span>'+
                                                            '</a>'+
                                                            '<span class="quantity">'+
                                                                '<span class="cart-quan-'+dataId+'">1</span> ×'+ 
                                                                '<span class="amount">'+
                                                                    price+
                                                                    '<span>$</span>'+
                                                                '</span>'+
                                                            '</span>'+
                                                        '</li>';
                                    $(".dropdown-cart .product-list").append(html);

                                    var itemInCart = parseInt($(".cart-total").first().text()) + 1;
                                    $(".cart-total").first().text(itemInCart);

                                }


                            }
                            $('.notification').css({'right':'15px','opacity':'1'});
                        }
                    });

                });
                
                setInterval(function(){
                    $(".notification").css({'right':'-100px','opacity':'0'});
                }, 5000);
            });
        </script>
    </body>
</html>
