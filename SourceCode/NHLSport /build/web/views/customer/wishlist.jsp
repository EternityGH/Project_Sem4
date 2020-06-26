<%-- 
    Document   : profile
    Created on : May 25, 2020, 3:46:34 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${customer == null}">
    <c:redirect url="http://localhost:8080${context}/Customer/Login"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/css/styles.css">
        <!-- Normalize -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/normalize/normalize.css">
        <!-- Bootstrap 4.0.0 -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-4.0.0-dist/css/bootstrap.min.css">
        <!-- Animate -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/animate/animate.css">
        <!-- Elegant Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Elegants/style.css">
        <!-- Datepicker -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" >
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
                    <a href="${context}">Home</a>
                </div>
                <div class="item">
                    <span><i class="arrow_carrot-right"></i></span>
                </div>
                <div class="item active">
                    <a href="${context}/Customer/Wishlist">My Wishlist</a>
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
                                    <c:set var="name" value="${fn:split(customer.fullName, ' ')}"/>
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
                        <div class="account-information">
                            <div class="title">
                                <h3 style="text-align: center">My Wishlist</h3>
                            </div>

                            <!-- End div.title -->
                            <c:if test="${listWL == null}">
                                <h2>Nothing in here</h2>
                            </c:if>
                            <c:if test="${listWL != null}">
                                <div class="container">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Remove</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                            %>
                                            <c:forEach items="${listWL}" var="item">

                                                <tr>
                                                    <th scope="row">
                                                        <% out.print(count); %>
                                                    </th>
                                                    <c:set var="url" value="${fn:split(item.productID.imageUrl, ';')}"/>
                                                    <td>
                                                        <div class="col-md-3">
                                                            <a href="${context}/Products/Detail?id=${item.productID.productId}" class="view col-md-2"><img src="${context}/assets/images/products/${url[0]}" class="img-fluid" /></a>
                                                        </div>
                                                    </td>
                                                    <td><b>${item.productID.productName}</b></td>
                                                    <td><b>${item.productID.price}</b></td>
                                                    <td><div style="text-align: center; font-size: 200%"><a href="${context}/Customer/Remove?idPro=${item.productID.productId}"><i class="fa fa-times" aria-hidden="true"></i></a></div></td>
                                                </tr>
                                                <%
                                                    count++;
                                                %>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </c:if>


                            <!-- End .form-profile -->
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
        <script src="${context}/vendors/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
        <script>
            $(document).ready(function() {
                $('#input-dob').datepicker({
                    format: "dd/mm/yyyy",
                    autoclose: true,
                });
                // Change Pass
                $('.js--change-pass').click(function() {

                    if ($('#change-pass:checked').length === 0) {
                        $('.js--appear').slideDown();
                        $('.js--change-pass i').removeClass('icon_box-empty');
                        $('.js--change-pass i').addClass('icon_box-checked');
                        $('.js--change-pass i').css('color', '#446084');
                    } else {
                        $('.js--appear').slideUp();
                        $('.js--change-pass i').removeClass('icon_box-checked');
                        $('.js--change-pass i').addClass('icon_box-empty');
                        $('.js--change-pass i').css('color', 'rgba(34, 34, 34, 0.7)');
                    }

                });
            })
        </script>
    </body>
</html>
