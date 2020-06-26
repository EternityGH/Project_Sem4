<%-- 
    Document   : login
    Created on : May 25, 2020, 9:06:07 AM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.admin != null}">
    <c:redirect url="http://localhost:8080${context}/Admin/"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login Page</title>
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/admin/assets/css/styles.css">
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/admin/assets/css/util.css">
        <!-- Normalize -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/normalize/normalize.css">
        <!-- Bootstrap 4.0.0 -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-4.0.0-dist/css/bootstrap.min.css" >
        <!-- Animate -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/animate/animate.css">
        <!-- Elegant Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Elegants/style.css">
        <!-- FontAwesome -->
        <script src="https://kit.fontawesome.com/0644aaed0c.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
                    <form method="post" action="${context}/Admin/Login-Post" class="login100-form flex-sb flex-w">
                        <span class="login100-form-title p-b-32">
                            Admin Login
                        </span>
                        
                        <c:if test="${errors != null}">
                            <div class="alert alert-danger error-list" style="width: 100%">
                                <ul>
                                    <li>
                                        <c:out value="${errors}" />
                                    </li>
                                </ul>
                            </div>
                        </c:if>

                        <span class="txt1 p-b-11">
                            Email
                        </span>
                        <div class="wrap-input100 m-b-36">
                            <input class="input100" type="text" name="email" >
                            <span class="focus-input100"></span>
                        </div>

                        <span class="txt1 p-b-11">
                            Password
                        </span>
                        <div class="wrap-input100 m-b-12">
                            <span class="btn-show-pass">
                                <i class="fa fa-eye"></i>
                            </span>
                            <input class="input100" type="password" name="password" >
                            <span class="focus-input100"></span>
                        </div>

                        <div class="flex-sb-m w-full p-b-48">
                            <div class="contact100-form-checkbox">
                                <input class="input-checkbox100" id="ckb1" type="checkbox" hidden name="remember-me">
                                <label class="label-checkbox100 js--remmeber" for="ckb1">
                                    <i class="icon_box-empty"></i>
                                    Remember me
                                </label>
                            </div>

                            <div>
                                <a href="#" class="txt3">
                                    Forgot Password?
                                </a>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>



        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/admin/assets/js/script.js"></script>
        <script>
            $('.js--remmeber').click(function() {
                if ($('#ckb1:checked').length === 0) {
                    $('.js--remmeber i').removeClass('icon_box-empty');
                    $('.js--remmeber i').addClass('icon_box-checked');
                    $('.js--remmeber i').css('color', '#57b846');
                }
                else {
                    $('.js--remmeber i').removeClass('icon_box-checked');
                    $('.js--remmeber i').addClass('icon_box-empty');
                    $('.js--remmeber i').css('color', '#999999');
                }
            });
        </script>
    </body>
</html>
