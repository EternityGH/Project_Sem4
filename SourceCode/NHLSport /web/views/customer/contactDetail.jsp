<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${cus == null}">
    <c:redirect url="http://localhost:8080${context}/Customer/Login"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Detail</title>
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
            .button {
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
                padding: 0.1em 1.5em;
                max-width: 100%;
                transition: transform .3s, border .3s, background .3s, box-shadow .3s, opacity .3s, color .3s;
                text-rendering: optimizeLegibility;
                box-sizing: border-box;
            }
            
            .button:hover {
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

        <div class="profile-user">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="side-bar">
                            <div class="account-info">
                                <div class="avatar">
                                    <img src="http://www.accountingweb.co.uk/sites/all/modules/custom/sm_pp_user_profile/img/default-user.png" alt="user-avatar">
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
                                <h3>Contact Detail</h3>
                            </div>
                            <!-- End div.title -->
                            <div class="inline-block float-right" style="margin-right: 20px; font-size: 13px; font-family: 'Poppins'">Date: <fmt:formatDate value='${contact.createAt}' pattern='dd-MM-yyyy'/></div>
                            <div class="clearfix"></div>
                            <div class="table-order" style="padding: 20px;">
                                <div class="inline-block float-left" style="background: #e4e6eb; 
                                     position: relative;
                                     font-family: 'Poppins'; 
                                     font-size: 14px; color: #1c1e21; padding: 7px 12px;
                                     border-radius: 18px;
                                     border-bottom-left-radius: 4px;
                                     margin-left: 10px;
                                     max-width: 300px;
                                     left: 60px;
                                ">
                                    <img width="50" height="50" style="border-radius: 50%; 
                                         margin-top: 15px; position: absolute; left: -60px; bottom: -30px" 
                                         src="http://www.accountingweb.co.uk/sites/all/modules/custom/sm_pp_user_profile/img/default-user.png" 
                                    >
                                    ${contact.description}
                                </div>
                                <div class="clearfix mb-3"></div>
                                <c:if test="${contact.reply != null}">
                                    <div class="inline-block float-right" style="background: #e4e6eb; 
                                        position: relative;
                                        font-family: 'Poppins'; 
                                        font-size: 14px; color: #1c1e21; padding: 7px 12px;
                                        border-radius: 18px;
                                        border-bottom-right-radius: 4px;
                                        margin-left: 10px;
                                        max-width: 300px;
                                        right: 60px;
                                   ">
                                       <img width="50" height="50" style="border-radius: 50%; 
                                            margin-top: 15px; position: absolute; right: -60px; bottom: -30px" 
                                            src="http://www.accountingweb.co.uk/sites/all/modules/custom/sm_pp_user_profile/img/default-user.png" 
                                       >
                                       ${contact.reply}

                                   </div>
                                   <div class="clearfix mb-3"></div>
                                </c:if>
                                <div class="form-contact mt-5">
                                    <form method="post" action="${context}/Contact/Send" >
                                        <input type="text" class="form-control" name="name" placeholder="Enter full name" hidden value="${customer.fullName}">
                                        <input type="text" class="form-control" name="email" placeholder="Enter email" hidden value="${customer.email}">
                                        <textarea class="w-100" name="description" rows="5" style="padding: 20px;" placeholder="Enter your messages"></textarea>
                                        <button type="submit" class="float-right mt-2 button primary">Send</button>
                                    </form>
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
