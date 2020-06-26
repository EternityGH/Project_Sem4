<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
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
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${context}/vendors/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="${context}/vendors/slick/slick-theme.css">

        <style>
            /*Css for product_view*/
            a:focus {
                outline: none;
            }

            div:focus {
                outline: none;
            }
            div.product-view {
                margin: 50px 0;
            }

            div.product-view div.info div.block-1 {
                padding: 0;
            }

            div.product-view div.info div.block-1 ul {
                list-style-type: none;
            }

            div.product-view div.info div.block-1 ul li img{
                cursor: pointer;
                width: 95px;
                height: 95px;
                transition: 0.4s all;
                margin: 10px 0;
                padding: 10px; 
            }

            div.product-view div.info div.block-1 ul li img.current {
                border: 2px solid #1c1c1c;
            }

            div.product-view div.info div.block-1 ul li img:hover {
                opacity: 0.6;
            }

            div.product-view div.info div.block-3 div.brand-name {
                color: #bfbfbf;
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 1.2px;
                font-weight: 500;
            } 

            div.product-view div.info div.block-3 div.watch-name {
                font-size: 22px;
                line-height: 29px;
                font-weight: 500;
                text-transform: uppercase;
                margin: 5px 0;
            }

            div.product-view div.info div.block-3 div.price {
                font-size: 24px;
                font-weight: 600;
            }

            div.product-view div.info div.block-3 div.row a {
                display: block;
                box-sizing: border-box;
                cursor: pointer;
                background-color: #fff;
                padding: 15px 0;
                width: 100%;
                font-size: 13px;
                font-family: 'Poppins';
                font-weight: 400;
                text-align: center;
                color: #446084;
                text-transform: uppercase;
                border: 1px solid #446084;
                transition: 0.4s all;
                letter-spacing: 1px;
                text-decoration: none;;
            }

            div.product-view div.info div.block-3 div.row {
                margin: 0 0;
            }

            div.product-view div.info div.block-3 div.row div.col-sm-6 {
                margin: 30px 0 5px 0;
                padding: 0 5px;
            }

            div.product-view div.info div.block-3 div.row a:hover {
                background: #446084;
                color: #fff;
            }

            div.product-view div.info div.block-3 div.row a.payment {
                background: #446084;
                color: #fff;
            }

            div.product-view div.info div.block-3 div.row a.payment:hover {
                opacity: 0.8;
            }

            div.product-view div.info div.block-3 div.product-tabs div.product-tabs-nav {
                display: flex;
                border-bottom: 1px solid #e5e5e5;
                margin: 25px 0 0;
            }

            div.product-view div.info div.block-3 div.product-tabs div.product-tabs-nav a {
                font-size: 12px;
                font-weight: 500;
                text-transform: uppercase;
                color: #916841;
                display: block;
                padding: 15px 0;
                position: relative;
                cursor: pointer;
            }

            div.product-view div.info div.block-3 div.product-tabs div.product-tabs-nav a+a {
                margin-left: 55px;
            }

            .product-tabs__nav--current {
                color: #1c1c1c !important;
                border-bottom: 1px solid #916841;
            }

            div.product-view div.info div.block-3 div.product-tabs .product-tabs__tab {
                display: none;
                line-height: 26px;
                padding: 15px 0;
                font-size: 14px;
                text-align: justify;
                transition: 0.4s all;
            }

            div.product-view div.info div.block-3 div.product-tabs .current {
                display: block;
            }

            div.product-view div.info div.block-3 {
                padding-top: 0;
            }

            .product-tabs__header {
                display: none;
            }

            div.product-view div.block-2 {
                position: relative;
                width: 100%;
                padding-top: 0;
            }

            div.product-view .tile {
                position: absolute;
                width: 500px;
                overflow: hidden;
                height: 500px;
                display: none;
            }

            div.product-view div.block-2 div.current {
                display: block;
            } 

            .photo {
                position: absolute;
                width: 100%;
                height: 100%;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                transition: transform .5s ease-out;
            }

            .txt {
                position: absolute;
                z-index: 2;
                right: 0;
                bottom: 10%;
                left: 0;
                font-family: 'Roboto Slab', serif;
                font-size: 9px;
                line-height: 12px;
                text-align: center;
                cursor: default;
            }

            .x {
                font-size: 32px;
                line-height: 32px;
            }

            div.product-view div.info div.star {
                margin: 10px 0;
            }

            div.product-view div.info div.star .spr-badge {
                zoom: 1;
                min-height: auto;
                min-width: auto;
                display: block;
            }

            div.product-view div.info div.star .spr-badge:before,  div.product-view div.info div.star .spr-badge:after {
                content: " ";
                display: table;
            }

            div.product-view div.info div.star .spr-badge .spr-badge-starrating {
                margin: 0 3px 0 0;
                padding: 10px 0;
                border: none;
            }

            div.product-view div.info div.star .spr-badge .spr-badge-starrating i {
                font-size: 120%;
                position: relative;
                top: 1px;
                width: 1.3em;
                height: 1.3em;
                color: #edc419;
            }

            div.product-view div.info div.star .spr-badge .spr-badge-caption {
                margin-left: 5px;
                font-size: 14px;
                color: #bfbfbf;
            }



            /*End css for product_view*/
            /*Css for feed-back*/

            div.feed-back {
                margin: 50px 0 80px 0;
            }

            div.feed-back div.container div.title h1 {
                font-size: 22px;
                line-height: 28px;
                letter-spacing: 4.4px;
                text-align: center;
                margin-bottom: 40px;
                text-transform: uppercase;
                font-weight: 600;
                color: #446084;
                font-family: 'Poppins';
            }

            div.feed-back div.container div.header  {
                position: unset;
                width: 100%;
                height: inherit;
                padding-top: 0px;
                background-image: unset;
            }

            div.feed-back div.container div.header div.row div.col-6 a.open-write-review {
                font-family: 'Poppins';
                display: inline-flex;
                align-items: center;
                text-align: center;
                cursor: pointer;
                box-shadow: none;
                text-shadow: none;
                outline: none;
                justify-content: center;
                height: 55px;
                padding: 0 50px;
                font-size: 12px;
                text-transform: uppercase;
                font-weight: 500;
                letter-spacing: 1.2px;
                white-space: nowrap;
                transition: .2s all;
                border: 1px solid transparent;
                border-color: #446084;
                background: #fff;
                color: #446084;
                float: right;
                transition: 0.4s all;
            }

            div.feed-back div.container div.header div.row div.col-6 a.open-write-review:hover {
                background: #446084;
                color: #fff;
            }

            div.feed-back div.container div.header div.row div.col-6:nth-child(1){
                line-height: 55px;
            }

            div.feed-back div.container div.header div.row div.col-6 i {
                color: #edc419;
            }

            div.feed-back div.container div.header div.row div.col-6 span.spr-badge-caption {
                font-weight: 400;
                font-size: 14px;
                color: #1c1c1c;
            }

            div.feed-back div.container div.form-review {
                border-top: 1px solid #e5e5e5;
                padding: 50px 0;
                margin: 50px 0;
                display: none;
            }

            div.feed-back div.container div.form-review.current {
                display: block;
            }

            div.feed-back div.container div.form-review h6 {
                color: #1c1c1c;
                font-weight: 600;
                font-size: 16px;
                line-height: 24px;
                margin-top: 0;
                color: #446084;
                font-family: 'Poppins';
            }

            div.feed-back div.container div.form-review form label {
                font-size: 13px;
                line-height: 20px;
                font-weight: 4 00;
                margin-bottom: 10px;
                font-family: 'Poppins';
            }

            div.feed-back div.container div.form-review form input {
                border: 1px solid #ebebeb;
                background-color: #e2e2e2;
                box-shadow: none;
                height: 45px;
                outline: none;
                padding: 0 20px;
                font-size: 14px;
            }

            div.feed-back div.container div.form-review form textarea {
                border: 1px solid #ebebeb;
                background-color: #e2e2e2;
                box-shadow: none;
                outline: none;
                padding: 10px 20px;
                font-size: 14px
            }

            div.feed-back div.container div.form-review form button {
                width: auto;
                margin: 10px 0;
                min-height: 1em;
                float: right;
                background: #446084;
                color: #fff;
                display: inline-flex;
                align-items: center;
                text-align: center;
                cursor: pointer;
                box-shadow: none;
                text-shadow: none;
                outline: none;
                justify-content: center;
                height: 55px;
                padding: 0 70px;
                font-size: 12px;
                text-transform: uppercase;
                font-weight: 500;
                letter-spacing: 1.2px;
                white-space: nowrap;
                transition: .2s all;
                border: 1px solid transparent;
            }

            div.feed-back div.container div.form-review form button:hover {
                opacity: 0.8;
            }

            div.stars {
                width: 215px;
                display: inline-block;
            }

            div.feed-back div.container div.form-review form input.star { display: none; }

            div.feed-back div.container div.form-review form label.star {
                float: right;
                padding: 10px;
                font-size: 24px;
                color: #444;
                transition: all .2s;
            }

            div.feed-back div.container div.form-review form input.star:checked ~ label.star:before {
                content: '\f005';
                font-family: FontAwesome;
                color: #FD4;
                transition: all .25s;
            }

            div.feed-back div.container div.form-review form input.star-1:checked ~ label.star:before { color: #edc419; }

            div.feed-back div.container div.form-review form input.star-5:checked ~ label.star:before {
                color: #edc419;
            }

            div.feed-back div.container div.form-review form label.star:hover { transform: rotate(-15deg) scale(1.3); }

            div.feed-back div.container div.form-review form label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }  

            /*End css for feed-back*/
            .recently-viewed-item h1 {
                font-size: 22px;
                line-height: 28px;
                letter-spacing: 4.4px;
                text-align: center;
                margin-bottom: 40px;
                text-transform: uppercase;
                font-weight: 600;
                color: #446084;
                font-family: 'Poppins';
            }

            .recently-viewed-item {
                margin-bottom: 80px;
            }

            .slick-prev:before, .slick-next:before {
                color: #446084;
            }

            .slick-slide {
                margin: 0 10px;
            }

            .slick-track {
                float: left;
            }

            .block-product {
                border-bottom: none;
            }

            .divider-block {
                height: 2px;
                width: 200px;
                margin: 50px auto;
                border-top: 2px solid #446084;
            }

        </style>
    </head>
    <body>
        <jsp:include page="../layout/navigation.jsp" />

        <div class="bread-crumb">
            <div class="container">
                <div class="item">
                    <a href="${context}/Home/">Home</a>
                </div>
                <div class="item">
                    <span><i class="arrow_carrot-right"></i></span>
                </div>
                <div class="item">
                    <a href="${context}/Products/">Products</a>
                </div>
                <div class="item">
                    <span><i class="arrow_carrot-right"></i></span>
                </div>
                <div class="item active">
                    <a href="${context}/Products/Detail?id=${product.productId}">Product Detail</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="product-detail-page">

            <div class="product-view">
                <div class="container info">
                    <div class="row">
                        <div class="col-sm-1 block-1">
                            <ul>
                                <c:set var="url" value="${fn:split(product.imageUrl, ';')}"/>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:if test="${url[i] != null && i == 0}">
                                        <li><img src="${context}/assets/images/products/${url[i]}" class="img-fluid current" data-id="image-${i+1}"></li>
                                    </c:if>
                                    <c:if test="${url[i] != null && i != 0}">
                                        <li><img src="${context}/assets/images/products/${url[i]}" class="img-fluid" data-id="image-${i+1}"></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="col-sm-5 block-2 tiles">
                            <c:forEach var="i" begin="0" end="4">
                                <c:if test="${i == 0}">
                                    <div class="tile current" id="image-${i+1}" data-scale="1.6" data-image="${context}/assets/images/products/${url[i]}"></div>
                                </c:if>
                                <c:if test="${i != 0 && url[i] != null}">
                                    <div class="tile" id="image-${i+1}" data-scale="1.6" data-image="${context}/assets/images/products/${url[i]}"></div>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div class="col-sm-1"></div>
                        <div class="col-sm-5 block-3">
                            <div class="brand-name">
                                <span>${product.brandId.name}</span>
                            </div>
                            <div class="watch-name">
                                <span>${product.productName}</span>
                            </div>
                            <div class="star">
                                <c:set var="star" value="0"/>
                                <c:set var="count" value="0"/>
                                <c:forEach var="item" items="${listReview}">
                                    <c:if test="${count == 0}">
                                        <c:set var="star" value="${(star + item.rating)}"/>
                                        <c:set var="count" value="${count + 1}"/>
                                    </c:if>
                                    <c:if test="${count != 0}">
                                        <c:set var="star" value="${(star + item.rating)/2}"/>
                                    </c:if>
                                </c:forEach>
                                <fmt:formatNumber var="star" value="${star}" maxFractionDigits="0"/>
                                <span class="spr-badge" id="spr_badge_8556186881" data-rating="4.523809523809524"><span class="spr-starrating spr-badge-starrating">
                                        <c:forEach var="i" begin="1" end="${star}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                        <c:forEach var="i" begin="1" end="${5 - star}">
                                            <i class="far fa-star"></i>
                                        </c:forEach>
                                    </span>
                                    <span class="spr-badge-caption">${listReview.size()} reviews</span>
                                </span>
                            </div>
                            <div class="price">
                                <span>${product.price}$</span>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="${context}/Cart/StoreItemInCart?id=${product.productId}" data-id="${product.productId}" class="btn-add-cart-2">Add to Cart</a>
                                </div>
                                <div class="col-sm-6">
                                    <c:if test="${error !=null}">
                                        <p style="color: red; font-size: 150%; font-weight: bold"></p>
                                    </c:if>
                                    <c:if test="${customer != null}">
                                        <a href="${context}/Customer/AddToWishlist?idProduct=${product.productId}" data-id="${product.productId}" class="btn-wishlist payment">
                                            Add to wishlist
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="product-tabs">
                                <div class="product-tabs-nav">
                                    <a class="product-tabs__nav--current guarantee" >WARRANTy POLICY</a>
                                    <a class="shipping" >DELIVERY POLICY</a>
                                </div>
                                <div class="product-tabs__panel">
                                    <div id="guarantee" class="product-tabs__tab current">
                                        <p>Guarantee<strong> 10 years</strong> with errors from the manufacturer.</p>
                                        <p>Replace batteries<strong> Free forever</strong>.</p>
                                        <p><strong>1 switch 1 </strong>within 3 days with products that fail from the manufacturer in a completely intact state and have no signs of use.
                                        </p>
                                    </div>
                                    <div id="shipping" class="product-tabs__tab">
                                        <p><strong> Free shipping</strong> with order from 50USD</p>
                                        <p>Shipping time: 3-7 days (depending on the destination)</p>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End product view -->
            <div class="description" style="margin: 100px 0;">
                <div class="container">
                    ${product.description}
                </div>
            </div>
            <div class="divider-block"></div>
            <div class="recently-viewed-item">
                <div class="container">
                    <h1 class="title">YOU MAY ALSO LIKE</h1>
                    <div class="list-product">
                        <c:set var="i" value="1" />
                        <c:forEach var="item" items="${listProd}">
                            <c:if test="${item.brandId.brandId == product.brandId.brandId && item.categoryId.categoryId == product.categoryId.categoryId && i <= 8 && item.status == true}">
                                <c:set var="i" value="${i=i+1}" />
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
                                            <a href="${context}/Cart/StoreItemInCart?id=${item.productId}" data-id="${item.productId}" class="btn-add-cart btn" >
                                                <i class="icon_cart_alt"></i>
                                            </a>
                                            <a href="${context}/Products/AddToListCompare?id=${item.productId}" data-id="${item.productId}" class="btn-compare btn">
                                                <i class="icon_tags_alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- End div.block-product -->
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="divider-block"></div>
            <div class="feed-back">
                <div class="container">
                    <div class="title">
                        <h1>CUSTOMER REVIEWS</h1>
                    </div>
                    <div class="header">
                        <div class="row">
                            <div class="col-6">
                                <span class="spr-badge" id="spr_badge_8556186881" data-rating="4.523809523809524">
                                    <span class="spr-starrating spr-badge-starrating">
                                        <c:forEach var="i" begin="1" end="${star}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                        <c:forEach var="i" begin="1" end="${5 - star}">
                                            <i class="far fa-star"></i>
                                        </c:forEach>
                                    </span>
                                    <span class="spr-badge-caption">Based on ${listReview.size()} reviews</span>
                                </span>
                            </div>
                            <div class="col-6">
                                <a class="open-write-review">Write a review</a>
                            </div>
                        </div>
                    </div>
                    <div class="form-review" id="form-review">
                        <h6>Write Review</h6>
                        <form method="post" action="${context}/Products/Rating">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <c:if test="${customer != null}">
                                            <input type="text" class="form-control" name="cusId" hidden value="${customer.customerId}">
                                        </c:if>
                                        <input type="text" class="form-control" name="productId" hidden value="${product.productId}">
                                        <label>Name</label>
                                        <c:if test="${customer != null}">
                                            <input type="text" class="form-control" name="name" placeholder="Enter full name" value="${customer.fullName}">
                                        </c:if>
                                        <c:if test="${customer == null}">
                                            <input type="text" class="form-control" placeholder="Enter You Name" name="name">
                                        </c:if>     
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <c:if test="${customer != null}">
                                            <input type="text" class="form-control" name="email" placeholder="Enter email" value="${customer.email}">
                                        </c:if>
                                        <c:if test="${customer == null}">
                                            <input type="text" class="form-control" name="email" placeholder="Enter email">
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Rating</label><br>
                                <div class="stars">
                                    <input class="star star-5" id="star-5" type="radio" name="star" value="5" />
                                    <label class="star star-5" for="star-5"></label>
                                    <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
                                    <label class="star star-4" for="star-4"></label>
                                    <input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
                                    <label class="star star-3" for="star-3"></label>
                                    <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
                                    <label class="star star-2" for="star-2"></label>
                                    <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
                                    <label class="star star-1" for="star-1"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Review Title</label>
                                <input type="text" class="form-control" placeholder="Give your a review title" name="title">
                            </div>

                            <div class="form-group">
                                <label>Body of Review (1500) characters remaining</label>
                                <textarea class="form-control" name="content" placeholder="Write your comments here" rows="7"></textarea>
                            </div>
                            <button type="submit" class="btn-form-review" name="send">Send Review</button>
                        </form>
                    </div>
                    <style>
                        .block-review {
                            padding: 30px;
                            box-shadow: 0px 0px 16px rgba(0, 0, 0, 0.1);
                            position: relative;
                            display: flex;
                            justify-content: space-between;
                            flex-direction: column;
                            
                        }
                        
                        .review-rating-1go {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                        }
                        
                        .star-ratings {
                            position: relative;
                            box-sizing: border-box;
                            display: inline-block;
                        }
                        
                        .star-ratings i {
                            color: #edc419;
                        }
                        
                        .review-title-20w {
                            margin-top: 25px;
                            margin-bottom: 10px;
                        }
                        
                        .typography-headline1-1o- {
                            font-family: 'Poppins';
                            font-style: normal;
                            font-weight: 600;
                            font-size: 20px;
                            line-height: 27px;
                            letter-spacing: 0.04em;
                        }
                        
                        .review-detail-Cg5 {
                            flex: 1;
                            margin-bottom: 8px;
                        }
                        
                        .typography-body-1BC {
                            font-family: 'Poppins';
                            font-style: normal;
                            font-weight: normal;
                            font-size: 14px;
                            line-height: 21px;
                            letter-spacing: 0.02em;
                        }
                        
                        .review-reviewer-2kG {
                            display: grid;
                            grid-template-columns: min-content 1fr;
                            column-gap: 10px;
                            grid-template-areas:
                                'avatar name'
                                'avatar verify';
                        }
                        
                        .review-avatar-Zwr {
                            grid-area: avatar;
                        }
                        
                        .avatar-root-3df {
                            width: 40px;
                            height: 40px;
                            border-radius: 50%;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            background-color: #c4c4c4;
                            text-transform: uppercase;
                            font-size: 20px;
                            font-weight: 500;
                            color: #fff;
                        }
                        
                        .review-name-15t {
                            grid-area: name;
                        }
                        
                        .typography-bodyBold-2Ua {
                            font-weight: 500;
                        }
                        
                        .typography-body-1BC {
                            font-family: 'Poppins';
                            font-style: normal;
                            font-size: 14px;
                            line-height: 21px;
                            letter-spacing: 0.02em;
                            overflow: hidden;
                        }
                        
                        .review-verifyStatus-1fR {
                            grid-area: verify;
                            color: rgba(0, 0, 0, 0.6);
                        }
                        
                        .typography-body-1BC {
                            font-family: 'Poppins';
                            font-style: normal;
                            font-weight: normal;
                            font-size: 14px;
                            line-height: 21px;
                            letter-spacing: 0.02em;
                        }
                        
                        .block-review p {
                            margin-bottom: 0;
                        }
                        
                        .reviewsList-reviewsListContent-U2y {
                            display: grid;
                            grid-template-columns: repeat(3, 1fr);
                            column-gap: 30px;
                            row-gap: 30px;
                            margin-top: 40px;
                            margin-bottom: 50px;
                            min-height: 140px;
                        }
                        
                        ul.pagination {
                            justify-content: center;
                        }
                        
                        ul.pagination .hidden {
                            display: none;
                        }
                        
                        ul.pagination .page-item {
                            width: 40px;
                            height: 40px;
                            margin-right: 15px;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                        }
                        
                        ul.pagination .page-item .page-link {
                            color: #446084;
                            border: 1px solid #446084;
                            font-size: 18px;
                            width: 100%;
                            text-align: center;
                            height: 100%;
                            line-height: 29px;
                        }
                        
                        ul.pagination .page-item.active .page-link {
                            color: #fff;
                            background-color: #446084;
                        }
                    </style>
                    <div class="cus-review">
                        <div class="reviewsList-reviewsListContent-U2y">
                            <c:forEach var="item" items="${listReview}">
                                <div class="block-review">
                                    <section class="review-rating-1go">
                                        <div class="star-ratings">
                                            <span class="spr-starrating spr-badge-starrating">
                                                <c:forEach var="i" begin="1" end="${item.rating}">
                                                    <i class="fas fa-star"></i>
                                                </c:forEach>
                                                <c:forEach var="i" begin="1" end="${5 - item.rating}">
                                                    <i class="far fa-star"></i>
                                                </c:forEach>
                                            </span>
                                        </div>
                                        <p style="margin: 0; font-family: 'Poppins'; font-size: 13px"><fmt:formatDate value='${item.createAt}' pattern='dd-MM-yyyy'/></p>
                                    </section>
                                    <section class="review-title-20w">
                                        <h3 class="review-titleText-2eG typography-headline1-1o-">${item.title}</h3>
                                    </section>
                                    <section class="review-detail-Cg5">
                                        <p class="review-detailText-2qQ typography-body-1BC">${item.review}</p>
                                    </section>
                                    <section class="review-reviewer-2kG">
                                        <c:set var="firstCha" value="${fn:substring(item.cusName, 0, 1)}" />
                                        <div class="review-avatar-Zwr avatar-root-3df">${firstCha}</div>
                                        <p class="review-name-15t typography-bodyBold-2Ua typography-body-1BC typography-body-1BC">${item.cusName}</p>
                                        <p class="review-verifyStatus-1fR typography-body-1BC">
                                            <c:if test="${item.customerId != null}">
                                                Member
                                            </c:if>
                                            <c:if test="${item.customerId == null}">
                                                Buyer
                                            </c:if>
                                        </p>
                                    </section>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="pagination" class="pagination-sm"></div>
                    </div>
                </div>
            </div>
            <!-- End feed-back -->
            <div class="divider-block"></div>
            <div class="recently-viewed-item">
                <div class="container">
                    <h1 class="title">RECENTLY VIEWED ITEMS</h1>
                    <div class="list-product">
                        <c:if test="${sessionScope.listViewed != null}">
                            <c:forEach var="item" items="${listViewed}">
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
                                            <a href="${context}/Cart/StoreItemInCart?id=${item.productId}" data-id="${item.productId}" class="btn-add-cart btn" >
                                                <i class="icon_cart_alt"></i>
                                            </a>
                                            <a href="${context}/Products/AddToListCompare?id=${item.productId}" data-id="${item.productId}" class="btn-compare btn">
                                                <i class="icon_tags_alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- End div.block-product -->
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>

        </div>
        <!-- End product-detail-page -->

        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/admin/vendors/jquery-migrate/jquery-migrate.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/vendors/slick/slick.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script src="http://josecebe.github.io/twbs-pagination/js/jquery.twbsPagination.js"></script>
        <script>
             $(document).ready(function(){
                $(".btn-wishlist").on("click", function(){
                    event.preventDefault();
                    var dataId  = $(this).attr("data-id");
                     $.ajax({
                        url : '../Customer/AddToWishlist',
                        data : {
                            idProduct : dataId
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
                                                                '<img src="'+url+'">'+
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
                                                '<p class="total">'+
                                                    '<strong>Total:</strong> '+
                                                    '<span class="amount">'+
                                                        '<span id="cart-total">'+price+'</span>'+
                                                        '<span>$</span>'+
                                                    '</span>'+ 
                                                '</p>'+
                                                '<p class="buttons">'+
                                                    '<a href="${context}/Cart/" class="button wc-forward">View cart</a>'+
                                                    '<a href="${context}/Cart/Checkout" class="button checkout wc-forward">Checkout</a>'+
                                                '</p>'+
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
                                                                '<img src="'+url+'">'+
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

                
                //Phần xử lý chuyển các tab
                $(".product-tabs .product-tabs-nav a").click(function() {
                    $('.product-tabs .product-tabs-nav a.product-tabs__nav--current').removeClass('product-tabs__nav--current');
                    $(this).addClass('product-tabs__nav--current');
                });
                $('.product-tabs .product-tabs-nav a.short-desc').click(function() {
                    $('.product-tabs .product-tabs__panel div.current').removeClass('current');
                    $('.product-tabs .product-tabs__panel #short-desc').addClass('current');
                });
                $('.product-tabs .product-tabs-nav a.guarantee').click(function() {
                    $('.product-tabs .product-tabs__panel div.current').removeClass('current');
                    $('.product-tabs .product-tabs__panel #guarantee').addClass('current');
                });
                $('.product-tabs .product-tabs-nav a.shipping').click(function() {
                    $('.product-tabs .product-tabs__panel div.current').removeClass('current');
                    $('.product-tabs .product-tabs__panel #shipping').addClass('current');
                });
                $(".block-1 ul li img").click(function() {
                    $('.block-1 ul li img.current').removeClass('current');
                    $(this).addClass('current');
                    var select = $(this).attr('data-id');
                    $('.block-2 div.current').removeClass('current');
                    $('.block-2 div#' + select).addClass('current');

                });

                //Phần xử lý để chuột vào xem từng hình bự lên
                $('.tile')
                        // tile mouse actions
                        .on('mouseover', function() {
                            $(this).children('.photo').css({'transform': 'scale(' + $(this).attr('data-scale') + ')'});
                        })
                        .on('mouseout', function() {
                            $(this).children('.photo').css({'transform': 'scale(1)'});
                        })
                        .on('mousemove', function(e) {
                            $(this).children('.photo').css({'transform-origin': ((e.pageX - $(this).offset().left) / $(this).width()) * 100 + '% ' + ((e.pageY - $(this).offset().top) / $(this).height()) * 100 + '%'});
                        })
                        // tiles set up
                        .each(function() {
                            $(this)
                                    // add a photo container
                                    .append('<div class="photo"></div>')
                                    // set up a background image for each tile based on data-image attribute
                                    .children('.photo').css({'background-image': 'url(' + $(this).attr('data-image') + ')'});
                        });

                $('div.feed-back div.container div.header div.row div.col-6 a.open-write-review').click(function() {
                    $('div.feed-back div.container div.form-review').slideToggle();
                });

                $('.list-product').slick({
                    dots: false,
                    infinite: true,
                    speed: 300,
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    responsive: [
                        {
                            breakpoint: 1024,
                            settings: {
                                slidesToShow: 3,
                                slidesToScroll: 3,
                                infinite: true,
                                dots: false
                            }
                        },
                        {
                            breakpoint: 600,
                            settings: {
                                slidesToShow: 2,
                                slidesToScroll: 2
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }
                        // You can unslick at a given breakpoint now by adding:
                        // settings: "unslick"
                        // instead of a settings object
                    ]
                });
                
                $(".btn-add-cart-2").on("click", function(){
                    event.preventDefault();

                    var dataId  = $(this).attr("data-id");
                    var name    = "${product.productName}";
                    var price   = "${product.price}";
                    var url     = "${context}/assets/images/products/${url[0]}";

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
                                                                '<img src="'+url+'">'+
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
                                                '<p class="total">'+
                                                    '<strong>Total:</strong> '+
                                                    '<span class="amount">'+
                                                        '<span id="cart-total">'+price+'</span>'+
                                                        '<span>$</span>'+
                                                    '</span>'+ 
                                                '</p>'+
                                                '<p class="buttons">'+
                                                    '<a href="${context}/Cart/" class="button wc-forward">View cart</a>'+
                                                    '<a href="${context}/Cart/Checkout" class="button checkout wc-forward">Checkout</a>'+
                                                '</p>'+
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
                                                                '<img src="'+url+'">'+
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
                    $(".notification").css({'right':'-100px', 'opacity':'0'});
                }, 5000);
                
                $(function() {
                    var pageSize = 6; // Hi?n th? 6 s?n ph?m trên 1 trang
                    showPage = function(page) {
                        $(".block-review").hide();
                        $(".block-review").each(function(n) {
                            if (n >= pageSize * (page - 1) && n < pageSize * page)
                                $(this).show();
                        });
                    };
                    showPage(1);
                    ///** C?n truy?n giá tr? vào ?ây **///
                    var totalRows = 10; // T?ng s? s?n ph?m hi?n th?
                    var btnPage = 5; // S? nút b?m hi?n th? di chuy?n trang
                    var iTotalPages = Math.ceil(${listReview.size()} / pageSize);
                    var obj = $('#pagination').twbsPagination({
                        totalPages: iTotalPages,
                        visiblePages: btnPage,
                        cssStyle: '',
                        prev: '<span aria-hidden="true">&laquo;</span>',
                        next: '<span aria-hidden="true">&raquo;</span>',
                        lastClass: 'hidden',
                        firstClass: 'hidden',
                        onPageClick: function(event, page) {
                            showPage(page);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
