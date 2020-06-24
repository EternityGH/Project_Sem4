<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Success Page</title>
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
            a.button{
                text-decoration: none;
                font-family: 'Poppins';
            }
            
            .button {
                position: relative;
                display: inline-block;
                text-transform: uppercase;
                color: #fff;
                font-size: .7em!important;
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
                padding: 0.3em 1.5em;
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
                    <a href="#">Success</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->

        <div class="success-page">
            <div class="container">
                <div class="jumbotron text-center" style="margin: 50px 0; background: transparent; font-family: 'Poppins'">
                    <h1 class="display-3" style="color: #446084; font-weight: 600; font-family: 'Poppins'">Thank You!</h1>
                    <p class="lead" style="color: #555;  font-family: 'Poppins'"><strong style="font-weight: 600">Please check your email</strong> for further instructions.</p>
                    <hr>
                    <p class="lead">
                        <a class="button primary wc-backward" href="${context}/Home/" role="button">Continue to shopping</a>
                    </p>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.contact-us -->
        <jsp:include page="../layout/footer.jsp" />
        
        
        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
    </body>
</html>
