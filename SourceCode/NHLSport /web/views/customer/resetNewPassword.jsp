<%-- 
    Document   : login
    Created on : May 9, 2020, 10:24:29 AM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.customer != null}">
    <c:redirect url="http://localhost:8080${context}/Customer/Account"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
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
                    <a href="${context}">Home</a>
                </div>
                <div class="item">
                    <span><i class="arrow_carrot-right"></i></span>
                </div>
                <div class="item active">
                    <a href="${context}/Customer/ForgotPassword">Forgot Password</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="login-page">
            <div class="container">
                <div class="form-login">
                    <h6>FORGOT PASSWORD?</h6>
                    <c:if test="${errors != null}">
                        <div class="alert alert-danger error-list">
                            <ul>
                                <li>
                                    <c:out value="${errors}" />
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <form action="${context}/Customer/ChangeNewPassword" method="post">
                        <div class="form-group">
                            <label for="">New Password<span>*</span></label>
                            <input type="password" name="pass" class="form-control" placeholder="Please enter new password">
                        </div>
                        <div class="form-group">
                            <label for="">Confirm New Password<span>*</span></label>
                            <input type="password" name="repass" class="form-control" placeholder="Please confirm your new password">
                            <input hidden name="yourmail" value="${yourmail}" type="text">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-login">Reset your password</button>
                        </div>
                        <div class="form-group">
                            <label for="remember-pass" class="no-uppercase"></label>
                            <div class="forgot-pass">
                                <a href="${context}/Customer/Login"><< Back to login</a>
                            </div>
                        </div>
                        </center>
                </div>
                <div class="row">
                    </form>
                </div>
                <!-- End div.form-login -->
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.login-page -->

        <jsp:include page="../layout/footer.jsp" />


        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
    </body>
</html>
