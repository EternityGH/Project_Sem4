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
                <div class="item active">
                    <a href="${context}/Customer/Review">Review</a>
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
                                    <a href="${context}/Customer/Review">
                                        <div class="icon">
                                            <i class="fas fa-pencil-alt"></i>
                                        </div>
                                        <span>Review Products</span>
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="${context}/Customer/Wishlist">
                                        <div class="icon">
                                            <i class="fas fa-heart"></i>
                                        </div>
                                        <span>My Wishlist</span>
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
                                <h3>My Review</h3>
                            </div>
                            <!-- End div.title -->
                            <div class="table-order" style="padding: 20px;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Code</th>
                                            <th>Title</th>
                                            <th>Review</th>
                                            <th>Rating</th>
                                            <th>Create At</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${list}">
                                            <tr>
                                                <td>
                                                    <a href="${context}/Customer/OrdersDetail?code=${item.id}">
                                                        ${item.id}
                                                    </a>
                                                </td>
                                                <td>${item.title}</td>
                                                <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 200px;">
                                                    ${item.review}
                                                </td>
                                                <td>${item.rating}</td>
                                                <td><fmt:formatDate value='${item.createAt}' pattern='dd-MM-yyyy'/></td>
                                                <td>
                                                    <a data-id="${item.id}" data-toggle="modal" data-target="#modal-delete" href="#" style="color: red">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
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
        
        <!-- The Modal -->
        <div class="modal fade" id="modal-delete">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Delete</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Are you sure you want to delete it?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <a class="btn-delete btn btn-danger">Delete</a>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script>
            $('a[data-target]').on("click", function(){
                var dataId = $(this).attr("data-id");
                $('a.btn-delete').attr("data-id", dataId);
                $('a.btn-delete').attr("href", "${context}/Admin/Reviews/Delete?id="+dataId);
            });
        </script>
    </body>
</html>
