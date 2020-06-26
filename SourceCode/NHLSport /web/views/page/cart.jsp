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
        <title>Contact Us</title>
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
            .cart-page {
                padding: 80px 0;
            }

            .cart-page .page-title-inner {
                position: relative;
                padding: 20px 0;
                min-height: 60px;
            }

            .cart-page .page-title-inner .checkout-breadcrumbs {
                padding: 15px 0;
            }

            .cart-page .page-title-inner .uppercase {
                line-height: 1.2;
                text-transform: uppercase;
            }

            .cart-page .page-title-inner .breadcrumbs a:first-of-type {
                margin-left: 0;
            }

            .cart-page .page-title-inner .checkout-breadcrumbs a {
                color: #ccc;
                display: -ms-inline-flexbox;
                display: inline-flex;
                -ms-flex-align: center;
                align-items: center;
                text-decoration: none;
                font-family: "Poppins";
                letter-spacing: 0.6px;
                font-size: 26px;
                transition: 0.3s all;
                font-weight: 400;
            }

            .cart-page .page-title-inner .breadcrumbs .divider {
                margin: 0 .2em;
                opacity: .35;
                font-weight: 300;
            }

            .cart-page .page-title-inner .breadcrumbs .divider i {
                vertical-align: bottom;
            }

            .cart-page .page-title-inner .breadcrumbs a.current, .cart-page .page-title-inner .breadcrumbs a:hover {
                color: #446084;
            }

            .cart-page .page-title-inner .no-click {
                pointer-events: none;
            }

            .cart-page table {
                width: 100%;
                margin-bottom: 1em;
                border-color: #ececec;
                border-spacing: 0;
            }

            .cart-page th {
                line-height: 1.05;
                color: #777;
                letter-spacing: .05em;
                text-transform: uppercase;
                padding: 1em .5em;
                text-align: left;
                border-bottom: 1px solid #ececec;
                border-width: 3px;
                font-size: .9em;
                font-family: "Poppins";
                font-weight: 600;
            }

            .cart-page td {
                padding: 15px .5em;
                text-align: left;
                border-bottom: 1px solid #ececec;
                line-height: 1.3;
                font-size: .9em;
            }

            .cart-table .cart-item td.product-remove {
                width: 20px;
                padding: 0;
            }

            .cart-table .cart-item td.product-remove a.remove {
                display: block;
                width: 24px;
                height: 24px;
                font-size: 15px !important;
                line-height: 19px !important;
                border-radius: 100%;
                color: #ccc;
                font-weight: bold;
                text-align: center;
                border: 2px solid currentColor;
            }

            .cart-table .cart-item td.product-thumbnail {
                min-width: 60px;
                max-width: 90px;
                width: 90px;
            }

            .cart-table .cart-item td.product-thumbnail img {
                max-width: 100%;
                height: auto;
                display: inline-block;
                vertical-align: middle;
            }

            .cart-page td.product-name {
                word-break: break-word;
                text-overflow: ellipsis;
            }

            .cart-table .cart-item td.product-name a {
                color: #334862;
                text-decoration: none;
            }

            .cart-table .cart-item span.amount {
                white-space: nowrap;
                color: #111;
                font-weight: bold;
            }

            .cart-table .actions {
                border: 0;
                padding: 15px 0 10px;
            }

            .cart-table .button.is-outline {
                display: inline-block;
                margin-bottom: 1em;
                line-height: 2.19em;
                color: #446084;
                border: 2px solid currentColor;
                background-color: transparent;
                min-height: 2.5em;
                padding: 0 1.2em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
                vertical-align: middle;
                border-radius: 0;
                margin-top: 0;
                margin-right: 1em;
                text-shadow: none;
                text-transform: uppercase;
                font-size: .97em;
                letter-spacing: .03em;
                cursor: pointer;
                font-weight: 600;
                text-align: center;
                text-decoration: none;
                font-family: "Poppins";
                border-radius: 2px;
            }

            .cart-table a.button-continue-shopping:hover {
                color: #fff;
                background-color: #446084;
                border-color: #446084;
            }

            .primary {
                background-color: #446084;
            }

            .cart-table button.button {
                position: relative;
                display: inline-block;
                text-transform: uppercase;
                font-size: .97em;
                letter-spacing: .03em;
                cursor: pointer;
                font-weight: 600;
                text-align: center;
                text-decoration: none;
                border: 1px solid transparent;
                vertical-align: middle;
                border-radius: 0;
                margin-right: 1em;
                text-shadow: none;
                line-height: 2.4em;
                min-height: 2.5em;
                padding: 0 1.2em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
                color: #fff;
                border-color: rgba(0,0,0,0.05);
                font-family: "Poppins";
                border-radius: 2px;
            }

            .cart-table button.button:hover {
                outline: none;
                opacity: 1;
                color: #fff;
                box-shadow: inset 0 0 0 100px rgba(0,0,0,0.2);
            }


            .cart-table button.button[disabled] {
                opacity: .6;
            }

            .cart-table .cart-item td.product-quantity .quantity {
                opacity: 1;
                display: -ms-inline-flexbox;
                display: inline-flex;
                margin: 0;
                white-space: nowrap;
                vertical-align: top;
            }

            .cart-table .cart-item td.product-quantity .quantity input {
                padding-left: 0;
                padding-right: 0;
                display: inline-block;
                vertical-align: top;
                margin: 0;
            }

            .cart-table .cart-item td.product-quantity .quantity input[type='button'].is-form {
                overflow: hidden;
                position: relative;
                background-color: #f9f9f9;
                text-shadow: 1px 1px 1px #fff;
                color: #666;
                border: 1px solid #ddd;
                text-transform: none;
                font-weight: normal;
            }

            .cart-table .cart-item td.product-quantity .quantity input[type='button'].is-form:focus {
                outline: none;
            }

            .cart-table .cart-item td.product-quantity .quantity .button {
                line-height: 2.4em;
                min-height: 2.5em;
                padding: 0 1.2em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
                font-size: .97em;
                letter-spacing: .03em;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }

            .cart-table .cart-item td.product-quantity .quantity .minus, .cart-table .cart-item td.product-quantity .quantity .plus {
                padding-left: 0.5em;
                padding-right: 0.5em;
            }

            .cart-table .cart-item td.product-quantity .quantity .minus {
                border-right: 0 !important;
                border-top-right-radius: 0 !important;
                border-bottom-right-radius: 0 !important;
            }

            .cart-table .cart-item td.product-quantity .quantity .plus {
                border-left: 0 !important;
                border-top-left-radius: 0 !important;
                border-bottom-left-radius: 0 !important;
            }

            .cart-table .cart-item td.product-quantity .quantity input[type="number"] {
                max-width: 2.5em;
                width: 2.5em;
                text-align: center;
                border-radius: 0 !important;
                -webkit-appearance: textfield;
                -moz-appearance: textfield;
                appearance: textfield;
                font-size: 1em;
                box-sizing: border-box;
                border: 1px solid #ddd;
                padding: 0 .75em;
                height: 2.507em;
                box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                background-color: #fff;
                color: #333;
                transition: all .3s;
            }

            .cart-table .cart-item td.product-quantity .quantity input[type="number"]:hover{
                box-shadow: inset 0 -1.8em 1em 0 rgba(0,0,0,0);
            }

            .cart-table .cart-item td.product-quantity .quantity input[type="number"]:focus {
                outline: none;
            }

            .cart-table .cart-item td.product-quantity .quantity input[type='number']::-webkit-outer-spin-button,
            .cart-table .cart-item td.product-quantity .quantity input[type='number']::-webkit-inner-spin-button {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }

            .cart-table .cart-item td.product-quantity .quantity .button.is-form:hover {
                color: #000;
                background-color: #f1f1f1;
            }

            .cart-totals tbody th {
                font-family: 'Poppins';
                font-size: .9em;
                text-transform: inherit;
                letter-spacing: 0;
                font-weight: normal;
            }

            .cart-totals tbody tr td, .cart-table .cart-item tr td:last-of-type {
                text-align: right;
                padding-right: 0;
                border-width: 3px;
            }

            .cart-page .cart-totals .button {
                min-width: 100%;
                margin-right: 0;
                display: block;
            }

            .cart-page .button.alt {
                background-color: #d26e4b;
            }

            .cart-page .cart-totals .button {
                position: relative;
                text-transform: uppercase;
                font-size: .97em;
                letter-spacing: .03em;
                cursor: pointer;
                font-weight: 600;
                text-align: center;
                color: #fff;
                text-decoration: none;
                border: 1px solid transparent;
                vertical-align: middle;
                border-radius: 3px;
                margin-top: 0;
                text-shadow: none;
                line-height: 2.4em;
                min-height: 2.5em;
                padding: 0 1.2em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box
            }

            .cart-page .cart-totals .button:hover {
                outline: none;
                opacity: 1;
                color: #fff;
                box-shadow: inset 0 0 0 100px rgba(0,0,0,0.2);
            }

            .cart-page .widget-title {
                border-bottom: 3px solid #ececec;
                font-size: .95em;
                padding-bottom: 10px;
                margin-bottom: 15px;
                font-family: "Poppins";
                font-weight: 600;
            }

            .widget-title i {
                opacity: .35;
                margin-right: 4px;
            }

            .cart-page input {
                box-sizing: border-box;
                border: 1px solid #ddd;
                padding: 0 .75em;
                height: 2.507em;
                font-size: .97em;
                border-radius: 3px;
                max-width: 100%;
                width: 100%;
                vertical-align: middle;
                background-color: #fff;
                color: #333;
                box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                transition: color .3s, border .3s, background .3s, opacity .3s;
                margin-bottom: 1em;
                border-radius: 3px;
            }

            .cart-page input:focus {
                outline: none;
            }

            .cart-page input[type="submit"] {
                overflow: hidden;
                position: relative;
                background-color: #f9f9f9;
                text-shadow: 1px 1px 1px #fff;
                color: #666;
                border: 1px solid #ddd;
                text-transform: none;
                font-weight: normal;
                cursor: pointer;
                border-radius: 3px;
                transition: 0.3s a;;;
            }

            .cart-page input[type="submit"]:hover {
                box-shadow: inset 0 0 0 100px rgba(0,0,0,0.2);
            }

            .no-item {
                text-align: center;
            }

            .no-item p {
                margin-bottom: 1.3em;
                font-family: "Poppins";
                font-size: 16px;
                letter-spacing: 1px;
            }

            .no-item p .button {
                position: relative;
                display: inline-block;
                text-transform: uppercase;
                color: #fff;
                font-size: .97em!important;
                border-radius: 3px;
                letter-spacing: .03em;
                cursor: pointer;
                font-weight: 600;
                text-align: center;
                text-decoration: none;
                border: 1px solid transparent;
                vertical-align: middle;
                margin-top: 0;
                text-shadow: none;
                line-height: 2.4em;
                min-height: 2.5em;
                padding: 0.3em 1.5em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
            }

            .no-item p .button:hover {
                outline: none;
                opacity: 1;
                color: #fff;
                box-shadow: inset 0 0 0 100px rgba(0,0,0,0.2);
            }

            .voucher-used tr th, .voucher-used tr td {
                font-family: 'Poppins';
                font-size: .9em;
                text-transform: inherit;
                letter-spacing: 0;
                font-weight: normal;
                border-width: 3px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../layout/navigation.jsp" />



        <div class="cart-page">
            <div class="checkout-page-title page-title">
                <div class="page-title-inner flex-row medium-flex-wrap container">
                    <div class="flex-col flex-grow medium-text-center">
                        <nav class="breadcrumbs flex-row flex-row-center heading-font checkout-breadcrumbs text-center strong h2 uppercase">
                            <a href="#" class="current">Shopping Cart</a>
                            <span class="divider hide-for-small"><i class="arrow_carrot-right"></i></span>
                            <a href="#" class="hide-for-small">Checkout details</a>
                            <span class="divider hide-for-small"><i class="arrow_carrot-right"></i></span>
                            <a href="#" class="no-click hide-for-small">Order Complete</a>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="cart-container">
                <div class="container">
                    <div class="row">
                        <c:if test="${sessionScope.order == null}">
                            <div class="col-md-12">
                                <div class="no-item">
                                    <p>Your cart is currently empty.</p>
                                    <p class="return-to-shop">
                                        <a class="button primary wc-backward" href="${context}">
                                            RETURN TO SHOP			
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.order != null}">
                            <div class="col-md-7">
                                <form method="post" action="${context}/Cart/UpdateQuantity">
                                    <table class="cart-table">
                                        <thead>
                                            <tr>
                                                <th class="product-name" colspan="3">Product Name</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${order.ordersDetailCollection}">
                                                <tr class="cart-item">
                                                    <td class="product-remove">
                                                        <a href="${context}/Cart/Delete?id=${item.productId.productId}" class="remove">×</a>
                                                    </td>
                                                    <td class="product-thumbnail">
                                                        <a href="#">
                                                            <c:set var="url" value="${fn:split(item.productId.imageUrl, ';')}"/>
                                                            <img src="${context}/assets/images/products/${url[0]}">
                                                        </a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="#">
                                                            ${item.productId.productName}
                                                        </a>
                                                    </td>   
                                                    <td class="product-price">
                                                        <span class="amount"><fmt:formatNumber value="${item.productId.price}" maxFractionDigits="2"/><span>$</span></span>						
                                                    </td>
                                                    <td class="product-quantity">
                                                        <div class="quantity">
                                                            <input type="text" class="input-hidden-price" value="<fmt:formatNumber value="${item.productId.price}" maxFractionDigits="2"/>" hidden>
                                                            <input type="button" value="-" class="minus button is-form">
                                                            <input type="number" data-id="${item.productId.productId}" class="input-text qty text" step="1" min="0" max="" name="quantity" value="${item.quantity}" size="4">
                                                            <input type="button" value="+" class="plus button is-form">
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <span class="amount subtotal ${item.productId.productId}"><fmt:formatNumber value="${item.productId.price * item.quantity}" maxFractionDigits="2"/><span>$</span></span>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td colspan="6" class="actions clear">
                                                    <div class="continue-shopping float-left text-left">
                                                        <a class="button-continue-shopping button primary is-outline" href="${context}">
                                                            ←&nbsp;Continue shopping	
                                                        </a>
                                                    </div>
                                                    <button type="submit" class="button primary mt-0 float-left small update-cart" disabled>
                                                        Update cart
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <!-- End div.col -->
                            <div class="col-md-5" style="border-left: 1px solid #ececec;">
                                <div class="cart-sidebar">
                                    <div class="cart-totals">
                                        <table cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th class="product-name" colspan="2" style="border-width:3px;">Total Cart</th>
                                                </tr>
                                            </thead>
                                        </table>
                                        <table cellspacing="0" class="shop_table shop_table_responsive">

                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Subtotal</th>
                                                    <td>
                                                        <strong>
                                                            <span class="amount">
                                                                <fmt:formatNumber value="${order.total}" maxFractionDigits="2"/><span>$</span>
                                                            </span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr class="cart-subtotal">
                                                    <th>Discount</th>
                                                    <td>
                                                        <strong>
                                                            <span class="amount">
                                                                <c:if test="${order.voucherId != null}">
                                                                    - <fmt:formatNumber value="${order.voucherId.discount}" maxFractionDigits="2"/><span>$</span>
                                                                </c:if>
                                                                <c:if test="${order.voucherId == null}">
                                                                    - 0 <span>$</span>
                                                                </c:if>
                                                            </span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Total</th>
                                                    <td>
                                                        <strong>
                                                            <span class="amount">
                                                                <c:if test="${order.voucherId != null}">
                                                                    <c:if test="${order.total - order.voucherId.discount < 0}">
                                                                        <fmt:formatNumber value="0" maxFractionDigits="2"/><span>$</span>
                                                                    </c:if>
                                                                    <c:if test="${order.total - order.voucherId.discount > 0}">
                                                                        <fmt:formatNumber value="${order.total - order.voucherId.discount}" maxFractionDigits="2"/><span>$</span>
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${order.voucherId == null}">
                                                                    <fmt:formatNumber value="${order.total}" maxFractionDigits="2"/><span>$</span>
                                                                </c:if>
                                                            </span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="wc-proceed-to-checkout" style="margin: 1.5em 0;">
                                            <a href="${context}/Cart/Checkout" class="checkout-button button alt wc-forward">
                                                Checkout
                                            </a>
                                        </div>
                                    </div>
                                    <form class="checkout_coupon mb-0" action="${context}/Cart/CheckVoucher" method="post">
                                        <div class="coupon">
                                            <h3 class="widget-title">
                                                <i class="icon_tag_alt"></i> Voucher
                                            </h3>
                                            <c:if test="${order.voucherId == null}">
                                                <input type="text" name="coupon-code" class="input-text" placeholder="Voucher"> 
                                                <input type="submit" class="is-form expand" name="apply-coupon" value="Use it">
                                            </c:if>
                                            <c:if test="${order.voucherId != null}">
                                                <table class="voucher-used">
                                                    <tbody>
                                                        <tr>
                                                            <th>Voucher Code</th>
                                                            <td class="text-right">
                                                                <strong>${order.voucherId.code}</strong>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- End div.col -->
                        </c:if>
                    </div>
                    <!-- End div.row -->
                </div>
                <!-- End div.container -->
            </div>
            <!-- End div.cart-container -->
        </div>
        <!-- End div.cart-page -->


        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script>
            $(document).ready(function() {
                $('.plus').click(function() {
                    var input = $(this).prev();
                    var classAttr = input.attr('data-id');
                    var a = parseInt(input.val()) + 1;
                    input.val(a);
                    var subtotal = a * parseInt($('.input-hidden-price').val());
                    $('.amount.subtotal.' + classAttr).text(subtotal + '$');
                    $('.update-cart').prop("disabled", false);
                });
                $('.minus').click(function() {
                    var input = $(this).next();
                    if (parseInt(input.val()) == 1) {
                        alert("Minimun quantity is 1");
                    }
                    else {
                        var a = parseInt(input.val()) - 1;
                        var classAttr = input.attr('data-id');
                        input.val(a);
                        var subtotal = a * parseInt($('.input-hidden-price').val());
                        $('.amount.subtotal.' + classAttr).text(subtotal + '$');
                        $('.update-cart').prop("disabled", false);
                    }

                });
            });
        </script>
    </body>
</html>
