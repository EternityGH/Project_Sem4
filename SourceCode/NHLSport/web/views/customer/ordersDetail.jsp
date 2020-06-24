<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Management</title>
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
            
            .table {
                margin-top: 80px;
            }
            
            .table tr td, .table tr th {
                vertical-align: middle;
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

        <div class="profile-user">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="side-bar">
                            <div class="account-info">
                                <div class="avatar">
                                    <img src="${context}/assets/images/user/avatar.png" alt="user-avatar">
                                </div>
                                <!-- End div.avatar -->
                                <div class="info">
                                    <c:set var="name" value="${fn:split(cus.fullName, ' ')}"/>
                                    <span>${name[fn:length(name)-2]} ${name[fn:length(name)-1]}</span>
                                </div>
                                <!-- End div.info -->
                            </div>

                            <!-- End div.account-info -->
                            <ul class="nav-profile">
                                <li class="item">
                                    <a href="${context}/Customer/Account">
                                        <div class="icon">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        <span>Account Information</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="${context}/Customer/OrderManagement">
                                        <div class="icon">
                                            <i class="fas fa-book-open"></i>
                                        </div>
                                        <span>Order Management</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="${context}/Customer/ContactHistory">
                                        <div class="icon">
                                            <i class="icon_mail_alt"></i>
                                        </div>
                                        <span>Contact History</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="">
                                        <div class="icon">
                                            <i class="fas fa-pencil-alt"></i>
                                        </div>
                                        <span>Review Products</span>
                                    </a>
                                </li>
                            </ul>
                            <!-- End ul.nav-profile -->
                        </div>
                        <!-- End div.side-bar -->
                    </div>
                    <!-- End div.col-2 -->
                    <div class="col-md-9">
                        <div class="order-management">
                            <div class="title">
                                <h3>My Orders Detail</h3>
                            </div>
                            <!-- End div.title -->
                            <div class="table-order">

                                <div class="container"> 
                                    <h5 style="color: #446084; font-weight: 600; font-family: 'Poppins'; margin-bottom: 30px; vertical-align: middle;">
                                        Order detail #${order.orderId} - ${order.status}
                                        <a class="mb-3 float-right" style="font-size: 14px; vertical-align: middle" href="${context}/Customer/OrdersBill?code=${order.orderId}">Export bill</a>
                                    </h5>
                                    <div class="clearfix"></div>
                                    <div class="row">
                                        <style>
                                            .card {
                                                height: 100%;
                                                box-shadow: 1px 1px 5px lightgrey;
                                                border: 1px solid lightgrey;
                                                border-radius: 1px;
                                                padding: 10px 0;
                                                font-size: 14px;
                                                font-family: 'Poppins';
                                            }
                                        </style>
                                        <div class="col-sm-4">
                                            <h6>RECEIVER'S ADDRESS</h6>
                                            <div class="card">
                                                <div class="container"> 
                                                    <h6>${order.cusName}</h6>
                                                    <p>Address: ${order.address}<br>
                                                        Phone: ${order.cusPhone}</p>
                                                </div>   
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <h6>DELIVERY METHOD</h6>
                                            <div class="card">
                                                <div class="container"> 

                                                    <p>Delivery before 21:00 on <fmt:formatDate value='${order.createAt}' pattern='dd-MM-yyyy'/>
                                                        Shipping fee: 1$</p>
                                                </div>    
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <h6>PAYMENT METHOD</h6>
                                            <div class="card">
                                                <div class="container"> 

                                                    <p>${order.paymentMethod}</p>
                                                </div> 
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                                <div class="clearfix"></div>
                                    <table class="table table-hover table-bordered results">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th class="col-md-5 col-xs-5">Product</th>
                                                <th class="col-md-4 col-xs-4">Price</th>
                                                <th class="col-md-3 col-xs-3">Quantity</th>
                                                <th class="col-md-3 col-xs-3">Discount</th>
                                                <th class="col-md-3 col-xs-3">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${order.ordersDetailCollection}">
                                                <tr>
                                                    <th scope="row">
                                                        <a href="#">
                                                            <c:set var="url" value="${fn:split(item.productId.imageUrl, ';')}"/>
                                                            <img  width="50" height="50" src="${context}/assets/images/products/${url[0]}">
                                                        </a>
                                                    </th>
                                                    <td>${item.productId.productName}</td>
                                                    <td>${item.productId.price}$</td>
                                                    <td>${item.quantity}</td>
                                                    <td>-5$</td>
                                                    <td>${order.total}</td>
                                                </tr>
                                            </c:forEach>
                                            <tr class="warning no-result">
                                                <td class="text-right" colspan="6"><i class="fa fa-warning"></i><p stlye="text-align: right;">
                                                    <div class="row">
                                                        <div class="col-sm-3"></div>              
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-3">Total temporarily</div>
                                                        <div class="col-sm-3">${order.total}$</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-3"></div>             
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-3">Shipping fee</div>
                                                        <div class="col-sm-3">1$</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-3"></div>              
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-3">Total</div>
                                                        <div class="col-sm-3" ><h6 style="color: red;"><fmt:formatNumber value="${order.total + 1}" maxFractionDigits="2"/>$</h6></div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- End div.table-order -->
                        </div>
                        <!-- End div.account-information -->
                    </div>
                    <!-- End div.col-9 -->
                </div>
                <!-- End div.row -->
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.profile-user -->
        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
    </body>
</html>
