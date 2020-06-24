<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<style>
    .cart-item {
        position: relative;
    }
    .nav-dropdown {
        position: absolute;
        min-width: 260px;
        max-height: 0;
        z-index: 9;
        padding: 20px 0 20px;
        opacity: 0;
        margin: 0;
        transition: opacity .25s;
        box-shadow: 1px 1px 15px rgba(0,0,0,0.15);
        border: 2px solid #ddd;
        color: #777;
        background-color: #fff;
        text-align: left;
        display: table;
        left: -99999px;
        top: 70px;
    }
    .nav-dropdown li {
        list-style-type: none;
    }
    li.has-dropdown:after, li.has-dropdown:before {
        top: 50px;
        z-index: 10;
        opacity: 0;
        left: 50%;
        border: solid transparent;
        content: '';
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    li.has-dropdown:after {
        border-color: rgba(221,221,221,0);
        border-bottom-color: #fff;
        border-width: 8px;
        margin-top: 7px;
        margin-left: -8px;
    }
    li.has-dropdown:before {
        z-index: -999;
        border-bottom-color: #ddd;
        border-width: 11px;
        margin-left: -11px;
    }
    .nav-dropdown-default {
        padding: 20px;
    }
    li.has-dropdown:hover>.nav-dropdown {
        opacity: 1;
        max-height: none;
        left: -160px;
    }
    li.has-dropdown:hover:before, li.has-dropdown:hover:after {
        transition: opacity .25s;
        opacity: 1;
    }
    .nav-dropdown:after {
        visibility: hidden;
        display: block;
        content: "";
        clear: both;
        height: 0;
    }
    .nav-dropdown p {
        margin: 0;
        line-height: normal;
    }

    .nav-dropdown>li.html {
        min-width: 260px;
        display: block;
        margin: 0;
        vertical-align: top;
    }

    .nav-dropdown .product-list {
        overflow-y: auto;
        margin: 0;
        padding: 0;
        -webkit-overflow-scrolling: touch;
        max-height: 50vh;
    }

    .nav-dropdown .product-list li {
        display: block;
        padding-right: 30px;
        list-style: none;
        padding: 10px 30px 5px 75px;
        min-height: 80px;
        position: relative;
        overflow: hidden;
        vertical-align: top;
        line-height: 1.33;
    }

    .nav-dropdown .product-list li+li {
        border-top: 1px solid #ececec;
    }

    .nav-dropdown .product-list li a.remove {
        position: absolute;
        right: 0px;
        z-index: 9;
        display: block;
        width: 26px!important;
        height: 26px!important;
        font-size: 10px !important;
        line-height: 23px !important;
        border-radius: 100%;
        color: #ccc!important;
        font-weight: 400!important;
        text-align: center;
        border: 2px solid currentColor;
    }

    .nav-dropdown .product-list li a.remove:hover {
        color: #334862!important;
    }

    .nav-dropdown .product-list li a:not(.remove) {
        display: block;
        margin-bottom: 5px;
        padding: 0;
        overflow: hidden;
        text-overflow: ellipsis;
        line-height: 1.3;
        color: #334862!important;
        text-decoration: none;
        font-weight: 400!important;
        letter-spacing: 1px;
    }

    .nav-dropdown .product-list li a:not(.remove) img {
        top: 10px;
        position: absolute;
        left: 0;
        width: 60px;
        height: 60px;
        margin-bottom: 5px;
        object-fit: cover;
        object-position: 50% 50%;
    }

    .nav-dropdown .product-list li .quantity {
        display: block;
        margin-top: 3px;
        font-size: .85em;
        opacity: 0.6;
        margin-right: 1em;
        white-space: nowrap;
        vertical-align: top;
    }

    span.amount {
        white-space: nowrap;
        color: #111;
        font-weight: bold;
    }

    .nav-dropdown p.total {
        text-align: center;
        padding: 10px 0;
        border-top: 1px solid #ececec;
        border-bottom: 2px solid #ececec;
        margin-bottom: .5em;
    }

    .nav-dropdown .button {
        width: 100%;
        margin: .5em 0 0;
        color: #fff!important;
        background-color: #446084;
        border-color: rgba(0,0,0,0.05);
        position: relative;
        display: inline-block!important;
        font-size: .97em!important;
        cursor: pointer;
        letter-spacing: 0.8px;
        text-align: center;
        text-decoration: none;
        border: 1px solid transparent;
        vertical-align: middle;
        border-radius: 0;
        text-shadow: none;
        line-height: 2.4em;
        min-height: 2.5em;
        padding: 0 1.2em;
        max-width: 100%;
        transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s!important;
        text-rendering: optimizeLegibility;
        box-sizing: border-box;
    }

    .nav-dropdown .button.checkout {
        background-color: #d26e4b;
    }

    .nav-dropdown .button:hover {
        outline: none;
        opacity: 1;
        color: #fff;
        box-shadow: inset 0 0 0 100px rgba(0,0,0,0.2);
    }
    .notification {
        border-radius: 4px;
        position: absolute;
        min-width: 320px;
        max-height: 0;
        z-index: 9;
        padding: 20px 0 20px;
        margin: 0;
        box-shadow: 1px 1px 15px rgba(0,0,0,0.15);
        color: #777;
        background-color: #fff;
        text-align: left;
        display: table;
        top: 100px;
        right: -100px;
        opacity: 0;
        transition: all .2s;
    }
</style>


<div class="navigation">
    <div class="notification" style="position: absolute; z-index: 9999999">
        <p class="messages" style="margin: 0; padding: 0 20px; font-family: 'Poppins'">
            <i class="icon_check" style="color: #7a9c59; border-radius: 50%; border: 1px solid #7a9c59; padding: 7px; margin-right: 10px;" ></i>Add product success
        </p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="logo-site">
                    <a href="${context}">Thunder</a>
                </div>
                <!-- End div.logo-site -->
            </div>
            <!-- End div.col -->
            <div class="col-lg-7">
                <div class="menu-bar">
                    <ul class="menu-list">
                        <li class="item">
                            <a href="${context}/Home/">Home</a>
                        </li>
                        <li class="item">
                            <a href="${context}/Products/"></a>
                            <div class="dropdown show">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Products
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
                                    <a class="dropdown-item" href="${context}/Products/">All Products</a>
                                    <a class="dropdown-item" href="${context}/Products/Compare">Compare</a>
                                </div>
                            </div>
                        </li>
                        <li class="item">
                            <a href="${context}/Home/About">About</a>
                        </li>
                        <li class="item">
                            <a href="${context}/Contact/">Contact</a>
                        </li>
                    </ul>
                    <!-- End ul.menu-bar -->
                </div>
                <!-- End div.menu-bar -->
            </div>
            <!-- End div.col -->
            <div class="col-lg-3">
                <div class="menu-bar">
                    <ul class="menu-list">
                        <li class="item">
                            <c:if test="${sessionScope.customer != null}">
                                <c:set var="name" value="${fn:split(sessionScope.customer.fullName, ' ')}"/>
                                <div class="dropdown show">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <c:out value="${name[fn:length(name)-1]}"/>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="${context}/Customer/Account"> My Account</a>
                                        <a class="dropdown-item" href="${context}/Customer/OrderManagement">Order History</a>
                                        <div class="dropdown-divider"></div>
                                        <form action="${context}/Customer/Logout" method="post">
                                            <input class="dropdown-item" type="submit" value="Logout" />
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.customer == null}">
                                <a href="${context}/Customer/Login">Login</a>
                            </c:if>
                        </li>
                        <li class="item divider"></li>
                        <li class="item cart-item has-dropdown">
                            <a href="${context}/Cart/">
                                <span>Cart</span>
                                <c:if test="${sessionScope.order == null}">
                                    <span class="cart-total">0</span>
                                </c:if>
                                <c:if test="${sessionScope.order != null}">
                                    <span class="cart-total">${fn:length(order.ordersDetailCollection)}</span>
                                </c:if>
                            </a>
                            <ul class="nav-dropdown nav-dropdown-default dropdown-cart">
                                <c:if test="${sessionScope.order == null}">
                                    <li class="null-product">
                                        <div>
                                            <p class="woocommerce-mini-cart__empty-message">No products in cart.</p>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.order != null}">
                                    <li class="html"> 
                                        <div>
                                            <ul class="product-list">
                                                <c:forEach var="item" items="${order.ordersDetailCollection}">
                                                    <li id="${item.productId.productId}">
                                                        <a class="remove" href="${context}/Cart/Delete?id=${item.productId.productId}">x</a>
                                                        <a href="#">
                                                            <c:set var="url" value="${fn:split(item.productId.imageUrl, ';')}"/>
                                                            <img src="${context}/assets/images/products/${url[0]}" />
                                                            <span>${item.productId.productName}</span>
                                                        </a>
                                                        <span class="quantity">
                                                            <span class="cart-quan-${item.productId.productId}">${item.quantity}</span> × 
                                                            <span class="amount">
                                                                ${item.productId.price}
                                                                <span>$</span>
                                                            </span>
                                                        </span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <!-- End product-list -->
                                            <p class="total">
                                                <strong>Total:</strong> 
                                                <span class="amount">
                                                    <span id="cart-total">${order.total}</span>
                                                    <span>$</span>
                                                </span>	
                                            </p>
                                            <!-- End total -->
                                            <p class="buttons">
                                                <a href="${context}/Cart/" class="button wc-forward">View cart</a>
                                                <a href="${context}/Cart/Checkout" class="button checkout wc-forward">Checkout</a>
                                            </p>
                                            <!-- End button -->
                                        </div>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End div.col -->
        </div>
        <!-- End div.row -->
    </div>
    <!-- End div.container -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-2">
                <a href="#" class="icon-menu js--icon-menu">
                    <i class="icon_menu"></i>
                </a>
            </div>
            <!-- End div.col -->
            <div class="col-8">
                <div class="logo-site">
                    <a href="#">Thunder</a>
                </div>
            </div>
            <!-- End div.col -->
            <div class="col-2">
                <div class="menu-bar">
                    <ul class="menu-list">
                        <li class="item cart-item">
                            <a href="#">
                                <span class="cart-total">0</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End div.col -->
        </div>
        <!-- End div.row -->
    </div>
    <!-- End div.container-fluid -->
</div>
<!-- End div.navigation -->

<div class="mobile-nav js--mobile-nav hidden">
    <div class="sidebar-menu">
        <a href="#" class="icon-close js--close-sidebar"><i class="icon_close"></i></a>
        <ul class="menu-list">
            <li class="item">
                <div class="search-form">
                    <form action="#">
                        <div class="input-group">
                            <input type="text" placeholder="Search..." >
                            <span class="input-group-btn">
                                <button class="btn-search" type="submit"><i class="icon_search"></i></button>
                            </span>
                        </div>
                    </form>
                </div>
            </li>
            <li class="item">
                <a href="#">Home</a>
            </li>
            <li class="item">
                <a href="#">About</a>
            </li>
            <li class="item">
                <a href="#">Contact</a>
            </li>
            <li class="item">
                <a href="#">Login</a>
            </li>
        </ul>
        <!-- End ul.menu-list -->
    </div>
    <!-- End div.sidebar-menu -->
    <div class="part js--close-sidebar"></div>
</div>
<!-- End div.mobile-nav -->