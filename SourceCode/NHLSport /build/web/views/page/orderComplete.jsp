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
            padding-bottom: 80px;
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
        
        .cart-page .entry-content {
            padding: 30px;
            background-color: rgba(0,0,0,0.02);
            box-shadow: 1px 1px 3px 0px rgba(0,0,0,0.2), 0 1px 0 rgba(0,0,0,0.07), inset 0 0 0 1px rgba(0,0,0,0.05);
            padding-top: 1.5em;
            padding-bottom: 1.5em;
        }
        .cart-page .success-color {
            font-family: 'Poppins';
            color: #7a9c59;
            margin-bottom: 1.3em;
            font-weight: 400;
        }
        .cart-page ul li {
            margin-left: 1.3em;
            margin-bottom: .6em;
            font-weight: 400;
            font-family: 'Poppins';
            line-height: 1.6;
            color: #777;
        }
        .cart-page .mc-loinhan {
            font-family: 'Poppins';
            color: #9F6000;
            background-color: #FEEFB3;
            padding: 10px 10px;
            margin-top: 3px;
            margin-bottom: 20px;
        }
        .amount {
            font-weight: 400;
        }
        .cart-page .mc-loinhan strong {
            font-weight: 600;
        }
        .cart-page .col-md-7 h3 {
            display: block;
            font-family: 'Poppins';
            font-size: 1.25em;
            color: #555;
            width: 100%;
            margin-top: 0;
            margin-bottom: 1.5em;
            font-weight: 600;
            text-rendering: optimizeSpeed;
        }
        .cart-page .col-md-7 h2 {
            font-family: 'Poppins';
            font-weight: 600;
            color: #555;
            width: 100%;
            margin-top: 0;
            margin-bottom: .5em;
            text-rendering: optimizeSpeed;
            font-size: 1.6em;
            line-height: 1.3;
        }
        .cart-page .col-md-7 .name {
            margin: 1.5em 0 .5em 0;
        }
        
        .cart-page .col-md-7 .bacs_details strong {
            font-weight: 600;
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
                    <a href="#">Cart</a>
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
                            <a href="#" class="hide-for-small">Checkout details</a>
                            <span class="divider hide-for-small"><i class="arrow_carrot-right"></i></span>
                            <a href="#" class="no-click current">Order Complete</a>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <c:if test="${order.paymentMethod == 'momo'}">
                            <hr>
                            <h3 class="text-center">Scan code for payment</h3>
                            <div class="mc-loinhan text-center">
                                Recipients: <strong>Vu Phi Long</strong> - <strong>0938436247</strong><br>
                                Total: <strong><span class="amount"><fmt:formatNumber value="${order.total}" maxFractionDigits="2"/> $</span></strong> <br>
                                The transfer notes you write the Order code: <strong>#${order.orderId}</strong>  
                            </div>
                            <div class="text-center mt-3">
                                <img src="${context}/assets/images/qr-code.png" class="img-fluid" >
                            </div>
                        </c:if>
                        <c:if test="${order.paymentMethod == 'transfer'}">
                            <h2>Bank Transfer Information</h2>
                            <h3 class="name">Vu Phi Long</h3>
                            <ul class="wc-bacs-bank-details order_details bacs_details">
                                <li class="bank_name">Bank: <strong>VCB – Branch HCM</strong></li>
                                <li class="account_number">Account number: <strong>0071001125122</strong></li>
                            </ul>
                            <h3 class="name">Vu Phi Long</h3>
                            <ul class="wc-bacs-bank-details order_details bacs_details">
                                <li class="bank_name">Bank:: <strong>BIDV – Branch Quang Trung</strong></li>
                                <li class="account_number">Account number: <strong>12310000014185</strong></li>
                            </ul>
                        </c:if>
                    </div>
                    <div class="col-md-5">
                        <div class="entry-content">
                            <p class="success-color"><strong>Thank you. Your order has been received.</strong></p>
                            <ul>
                                <li>Order Code: <strong>${order.orderId}</strong></li>
                                <li>Date: <strong><fmt:formatDate value='${order.createAt}' pattern='dd-MM-yyyy'/></strong></li>
                                <li>Total: <strong><fmt:formatNumber value="${order.total}" maxFractionDigits="2"/> $</strong></li>
                                <li>Payment Method: <strong>${order.paymentMethod}</strong></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <jsp:include page="../layout/footer.jsp" />
        
        
        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
    </body>
</html>
