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
        <title>Checkout Page</title>
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

            .cart-page h3 {
                font-size: 1.1em;
                overflow: hidden;
                padding-top: 10px;
                font-weight: 600;
                color: #555;
                text-transform: uppercase;
                font-family: 'Poppins';
                display: inline-block;
                border-bottom: 3px solid #ececec;
                padding-bottom: 10px;
                margin-bottom: 20px;
                width: auto;
            }

            .cart-page .container .col-md-7 label {
                font-size: .9em;
                margin-bottom: 0.4em;
                color: #555;
                font-weight: 600;
                font-family: 'Poppins';
            }
            .cart-page .container .col-md-7 input, .cart-page .container .col-md-7 textarea  {
                display: block;
                box-sizing: border-box;
                border: 1px solid #ddd;
                padding: 0 .75em;
                height: 2.507em;
                font-size: .97em;
                border-radius: 0;
                max-width: 100%;
                width: 100%;
                vertical-align: middle;
                background-color: #fff;
                color: #333;
                box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
                transition: color .3s, border .3s, background .3s, opacity;
                font-family: 'Poppins';
            }

            .cart-page .container .col-md-7 textarea {
                padding-top: 0.7em;
                min-height: 120px;
            }

            .cart-page .container .col-md-7 input:hover, .cart-page .container .col-md-7 textarea:hover, select:hover {
                box-shadow: inset 0 -1.8em 1em 0 rgba(0,0,0,0);
            }

            .cart-page .container .col-md-7 input:focus, .cart-page .container .col-md-7 textarea:focus {
                box-shadow: 0 0 5px #ccc;
                opacity: 1 !important;
                outline: 0;
                color: #333;
                background-color: #fff;
            }

            .cart-page .container .col-md-5 .order-review {
                border: 2px solid #446084;
                padding: 15px 30px 30px;
            }

            .cart-page .container .col-md-5 .order-review table th {
                padding: .5em 0;
                border-bottom: 3px solid #ececec;
                line-height: 1.05;
                letter-spacing: .05em;
                text-transform: uppercase;
                color: #777;
                font-size: .9em;
                font-family: 'Poppins';
            }

            .cart-page .container .col-md-5 .order-review table td {
                padding: 1em 0;
                border-bottom: 3px solid #ececec;
                line-height: 1.05;
                letter-spacing: .05em;
                color: #777;
                font-size: .9em;
                font-family: 'Poppins';
            }

            .amount {
                white-space: nowrap;
                color: #111;
                font-weight: 600;
            }

            .button {
                position: relative;
                display: inline-block;
                background-color: transparent;
                text-transform: uppercase;
                font-size: .97em;
                letter-spacing: .03em;
                cursor: pointer;
                font-weight: bolder;
                text-align: center;
                color: currentColor;
                text-decoration: none;
                border: 1px solid transparent;
                vertical-align: middle;
                border-radius: 0;
                margin-top: 0;
                margin-right: 1em;
                text-shadow: none;
                line-height: 2.4em;
                min-height: 2.5em;
                padding: 0 1.2em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
                font-family: "Poppins";
            }

            .button.alt {
                color: #fff;
                background-color: #446084;
                border-color: rgba(0,0,0,0.05);
            }

            .payment p {
                color: #777;
                font-family: "Poppins";
                font-size: .9em;
                margin-bottom: .2em;
            }

            .payment label {
                color: #222;
                font-weight: bold;
                font-size: .9em;
                padding: 0 0.5em;
                margin-bottom: 0.5em;
            }

            .cart-page .container ul li {
                padding: 0.8em 0;
                list-style: none;
                margin: 0;
                border-bottom: 1px solid #ececec;
            }

            .cart-page .container .payment_box {
                display: none;
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

            .primary {
                background-color: #446084;
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
                    <a href="#">Contact Us</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="cart-page">
            <div class="checkout-page-title page-title">
                <div class="page-title-inner flex-row medium-flex-wrap container">
                    <div class="flex-col flex-grow medium-text-center">
                        <nav class="breadcrumbs flex-row flex-row-center heading-font checkout-breadcrumbs text-center strong h2 uppercase">
                            <a href="#" class="hide-for-small">Shopping Cart</a>
                            <span class="divider hide-for-small"><i class="arrow_carrot-right"></i></span>
                            <a href="#" class="current">Checkout details</a>
                            <span class="divider hide-for-small"><i class="arrow_carrot-right"></i></span>
                            <a href="#" class="no-click hide-for-small">Order Complete</a>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <c:if test="${sessionScope.order == null}">
                    <div class="row">
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
                    </div>
                </c:if>
                <c:if test="${sessionScope.order != null}">
                    <form action="${context}/Cart/Save" method="post">
                        <div class="row">
                            <div class="col-md-7">
                                <h3 style="margin-top: 17px;">PAYMENT INFORMATION</h3>
                                <c:if test="${customer != null}">
                                    <input name="cusId" value="${customer.customerId}" hidden readonly />
                                </c:if>
                                <div class="form-group">
                                    <label>Full Name <span style="color: red">*</span></label>

                                    <input name="username" placeholder="Enter your name" <c:if test="${customer != null}">value="${customer.fullName}"</c:if> />
                                    </div>
                                    <div class="form-group">
                                        <label>Phone <span style="color: red">*</span></label>
                                        <input name="telephone" placeholder="Enter your phone" <c:if test="${customer != null && customer.phone != null}">value="${customer.phone}"</c:if> />
                                    </div>
                                    <div class="form-group mb-5">
                                        <label>Address <span style="color: red">*</span></label>
                                        <input name="address" placeholder="Enter your address"/>
                                    </div>
                                    <h3>ADDITIONAL INFORMATION</h3>
                                    <div class="form-group">
                                        <label>Order notes (optional)</label>
                                        <textarea name="note" class="input-text " placeholder="Notes on orders, for example, time or indications for more detailed delivery locations."></textarea>
                                    </div>
                                </div>
                                <!-- End div.col-md-7 -->
                                <div class="col-md-5">
                                    <div class="order-review">
                                        <h3>YOUR ORDER</h3>
                                        <table class="w-100">
                                            <thead>
                                                <tr>
                                                    <th class="product-name">Products</th>
                                                    <th class="product-total text-right">Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${order.ordersDetailCollection}">
                                                <tr class="cart-item">
                                                    <td class="product-info">
                                                        <div class="float-left" style="display: inline-block; width: 20%">
                                                            <c:set var="url" value="${fn:split(item.productId.imageUrl, ';')}"/>
                                                            <img src="${context}/assets/images/products/${url[0]}" width='50' height="50" >
                                                        </div>
                                                        <span class="float-right" style="display: inline-block; width: 80%; vertical-align: middle; padding: 10px;">
                                                            ${item.productId.productName}
                                                            <strong class="product-quantity">×&nbsp;${item.quantity}</strong>
                                                        </span>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                    <td class="product-total text-right">
                                                        <span class="amount"><fmt:formatNumber value="${item.productId.price}" maxFractionDigits="2"/>$</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="cart-subtotal">
                                                <th>Subtotal</th>
                                                <td class="text-right"><span class="amount"><fmt:formatNumber value="${order.total}" maxFractionDigits="2"/>$</span></td>
                                            </tr>
                                            <tr class="cart-subtotal">
                                                <th>Discount</th>
                                                <td class="text-right">
                                                    <span class="amount">
                                                        <c:if test="${order.voucherId != null}">
                                                            - <fmt:formatNumber value="${order.voucherId.discount}" maxFractionDigits="2"/><span>$</span>
                                                        </c:if>
                                                        <c:if test="${order.voucherId == null}">
                                                            - 0 <span>$</span>
                                                        </c:if>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr class="cart-subtotal">
                                                <th>Total</th>
                                                <td class="text-right">
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
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div class="mt-3 payment">
                                        <ul>
                                            <li>
                                                <input style="vertical-align: middle" id="payment_method_bacs" type="radio" class="input-radio" name="payment" value="transfer" checked="checked" data-order_button_text="">
                                                <label class="lb-payment" for="payment_method_bacs">Transfer</label>
                                                <div class="payment_box payment_method_bacs" style="display: block;">
                                                    <p>
                                                        Pay directly to our bank account. Please use your order ID in the Notes section. When we make the money to the account, we do the work. 10 days after successful payment the product will be sent to your address.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <input style="vertical-align: middle" id="payment_method_momo_qr_scan" type="radio" class="input-radio" name="payment" value="momo" data-order_button_text="">
                                                <label class="lb-payment" for="payment_method_momo_qr_scan">Code scanning momo</label>
                                                <div class="payment_box payment_method_momo_qr_scan">
                                                    <p>
                                                        Open up the App Momo and tap order to scan the payment code
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="button alt">Order</button>
                                    </div>
                                </div>
                            </div>
                            <!-- End div.col-md-5 -->
                        </div>
                    </form>
                </c:if>
            </div>
        </div>


        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script>
            $(document).ready(function() {
                $('input[type="radio"]').click(function() {
                    var id = $(this).attr('id');
                    $('.payment_box').slideUp();
                    $('.' + id).slideDown();
                });
            });
        </script>
    </body>
</html>
