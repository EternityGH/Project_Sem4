<%-- 
    Document   : registerSuccess
    Created on : Jun 25, 2020, 10:36:46 AM
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
        <script type="text/javascript">
            var count = 10;
            var redirect = "${context}/Customer/Login";
            function countDown(){
                var timer = document.getElementById("timer");
                if(count > 0){
                        count--;
                        timer.innerHTML = "The website you want to go will automatically move in <b>"+count+"</b> seconds.";
                        setTimeout("countDown()", 1000);
                }else{
                        window.location.href = redirect;
                }
            }
        </script>
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
                    <a href="#">Success</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->
        
        <div class="success m-5">	
            <div class="container">
                <h1 class="text-center m-5"><?=$action?> Success</h1>
                <div class="alert alert-success text-center" role="alert">
                        <p id="timer" class="text-center"><script type="text/javascript">countDown()</script></p>
                        <a href="${context}/Customer/Login" class="alert-link">Click here to continue</a>
                </div>
            </div>
    </div>

    <style type="text/css">
            div.success h1 {
                    text-transform: uppercase;
                    font-family: 'Open Sans', sans-serif;
                    font-size: 32px;
                    color: #155724;
            }

            div.success a {
                    display: block;
                    margin: 20px 0;
            }

            div.success p {
                    margin: 20px 0;
            }
    </style>
    
    
    <jsp:include page="../layout/footer.jsp" />


    <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
    <script src="${context}/vendors/popper/popper.min.js"></script>
    <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="${context}/assets/js/script.js"></script>
    
    </body>
</html>
