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
<c:if test="${cus == null}">
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
                    <a href="${context}/Customer/Account">Account Information</a>
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
                        <div class="account-information">
                            <div class="title">
                                <h3>Account Information</h3>
                            </div>
                            
                            <!-- End div.title -->
                            <form action="${context}/Customer/UpdateAccount" method="post" class="form-profile">
                                <div class="form-group">
                                    <c:if test="${errors != null}">
                                        <div class="alert alert-danger error-list mb-4">
                                            <ul style="margin-bottom: 0px; margin-left: 20px">
                                                <c:forEach var="err" items="${errors}">
                                                    <li>
                                                        <c:out value="${err}" />
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                                    <c:if test="${messages != null}">
                                        <div class="alert alert-success success-update">
                                            <c:out value="${messages}" />
                                            <c:remove var="messages"/>
                                        </div>
                                    </c:if>
                                </div>
                                <input type="text" name="id" value="${cus.customerId}" hidden>
                                <div class="form-group">
                                    <label for="">Full name</label>
                                    <input type="text" class="form-control" value="${cus.fullName}" name="fullName">
                                </div>                            
                                <!-- End div.form-group -->
                                <div class="form-group">
                                    <label for="">Email</label>
                                    <input type="text" readonly name="email" class="form-control" value="${cus.email}">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group">
                                    <label for="">Phone</label> 
                                    <input type="text" class="form-control" value="${cus.phone}" name="phone">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group">
                                    <label for="">DOB<small> (optional)</small></label>
                                    <input style="background-color: #fff;" name="dob" type="text" value="<fmt:formatDate value='${cus.dob}' pattern='dd/MM/yyyy'/>" data-date-end-date="0d" readonly id="input-dob" class="form-control">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group">
                                    <label>Gender</label>
                                    <div class="radio">
                                        <input type="radio" ${cus.gender == true ? "checked" : ""} value="true" id="g-female" name="gender" hidden>
                                        <label class="customize-radio" for="g-female"></label>
                                        <label for="g-female">Female</label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" ${cus.gender == false ? "checked" : ""} value="false" id="g-male" name="gender" hidden>
                                        <label class="customize-radio" for="g-male"></label>
                                        <label for="g-male">Male</label>
                                    </div>
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group">
                                    <label for="">&nbsp;</label>
                                    <label for="change-pass" class="no-uppercase js--change-pass">
                                        <i class="icon_box-empty" ></i>
                                    </label>
                                    <input type="checkbox" id="change-pass" name="change-pass" hidden>
                                    <label for="change-pass" class="no-uppercase js--change-pass">Change password</label>
                                </div>
                                <div class="form-group js--appear" style="display: none;">
                                    <label for=="">Current Password</label>
                                    <input name="currentPass" type="password" class="form-control" placeholder="Current password">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group js--appear" style="display: none;">
                                    <label for="">New Password</label>
                                    <input name="newPass" type="password" class="form-control" placeholder="New password">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-group js--appear" style="display: none;">
                                    <label for="">Re-type New Password</label>
                                    <input name="reNewPass" type="password" class="form-control" placeholder="Re-type new password">
                                </div>
                                <!-- End div.form-group -->
                                <div class="form-btn">
                                    <button type="submit" class="btn-update">Update</button>
                                </div>
                            </form>
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
                
                setInterval(function(){
                    $(".success-update").slideUp();
                }, 5000);
            })
        </script>
    </body>
</html>
