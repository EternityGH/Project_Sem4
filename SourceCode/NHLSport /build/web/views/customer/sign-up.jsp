<%-- 
    Document   : sign-up
    Created on : May 12, 2020, 2:12:17 PM
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
        <title>Sign Up Page</title>
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
                    <a href="${context}/Customer/Sign-Up">Sign Up</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="register-page">
            <div class="container">
                <div class="form-register">
                    <h6>Sign Up</h6>
                    <c:if test="${errors != null}">
                        <div class="alert alert-danger error-list">
                            <ul>
                                <c:forEach var="err" items="${errors}">
                                    <li>
                                        <c:out value="${err}" />
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                    
                    <form action="${context}/Customer/Sign-Up" method="POST">
                        <div class="form-group">
                            <label for="">Full Name<span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter full name" name="fullName">
                        </div>
                        <div class="form-group">
                            <label for="">Email<span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="">Password<span>*</span></label>
                            <input type="password" class="form-control" placeholder="Enter password" name="password">
                        </div>
                        <div class="form-group">
                            <label for="">Confirm Password<span>*</span></label>
                            <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm password">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-login">Sign Up</button>
                        </div>
                        <div class="form-group">
                            <a href="${context}/Customer/Login" class="btn-sign-up">Log In</a>
                        </div>
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
