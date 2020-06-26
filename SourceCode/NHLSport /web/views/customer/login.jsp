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
        <title>Login Page</title>
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
                    <a href="${context}/Customer/Login">LogIn</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->
        
        <div class="login-page">
            <div class="container">
                <div class="form-login">
                    <h6>Login</h6>
                    <c:if test="${errors != null}">
                        <div class="alert alert-danger error-list">
                            <ul>
                                <li>
                                    <c:out value="${errors}" />
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <form action="${context}/Customer/Login" method="post">
                        <div class="form-group">
                            <label for="">Email<span>*</span></label>
                            <input type="text" name="email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="">Password<span>*</span></label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password">
                        </div>
                        <div class="form-group">
                            <input type="checkbox" id="remember-pass" name="remember">
                            <label for="remember-pass" class="no-uppercase">Remember password</label>
                            <div class="forgot-pass">
                                <a href="${context}/Customer/ForgotPassword">Forgot password?</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-login">Log In</button>
                        </div>
                        <div class="form-group">
                            <a href="${context}/Customer/Sign-Up" class="btn-sign-up">Sign Up</a>
                            
                        </div>
                        <div class="form-group">
                            <center>
                                
                          <a class="btn btn-outline-dark" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/NHLSport/login-google&response_type=code
    &client_id=4579365203-ck2v2lmrmc136o4ka9tfm3lnfivb1jes.apps.googleusercontent.com&approval_prompt=force"" role="button" style="text-transform:none">
                            <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                            Login with Google
                          </a>
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
