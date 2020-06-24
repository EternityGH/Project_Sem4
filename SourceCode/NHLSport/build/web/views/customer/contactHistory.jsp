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
        <title>Contact History</title>
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
                                <h3>My Contact</h3>
                            </div>
                            <!-- End div.title -->
                            <div class="table-order" style="padding: 20px;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Date</th>
                                            <th>Messages</th>
                                            <th>Answer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${list}">
                                            <tr>
                                                <td>
                                                    <a href="${context}/Customer/ContactDetail?id=${item.id}">
                                                        ${item.id}
                                                    </a>
                                                </td>
                                                <td><fmt:formatDate value='${item.createAt}' pattern='dd-MM-yyyy'/></td>
                                                <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 200px;">
                                                    ${item.description}
                                                </td>
                                                <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 200px;">
                                                    ${item.reply}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
