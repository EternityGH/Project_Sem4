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
        <title>Contact Us</title>
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

        <div class="contact-page">
            <div class="container">
                <div class="title">
                    <h3>HAVE SOME QUESTIONS?</h3>
                </div>
                <!-- End div.title -->
                <div class="form-contact">
                    <form action="${context}/Contact/Send">
                        <div class="form-group">
                            <label for="">Full Name<span>*</span></label>
                            <c:if test="${customer != null}">
                                <input type="text" class="form-control" name="name" placeholder="Enter full name" value="${customer.fullName}">
                            </c:if>
                            <c:if test="${customer == null}">
                                <input type="text" class="form-control" name="name" placeholder="Enter full name">
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="">Email<span>*</span></label>
                            <c:if test="${customer != null}">
                                <input type="text" class="form-control" name="email" placeholder="Enter email" value="${customer.email}">
                            </c:if>
                            <c:if test="${customer == null}">
                                <input type="text" class="form-control" name="email" placeholder="Enter email">
                            </c:if>
                            
                        </div>
                        <div class="form-group">
                            <label for="">Description<span>*</span></label>
                            <textarea class="form-control" name="description" placeholder="Your question..."></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-login">Send Us</button>
                        </div>
                    </form>
                </div>
                <!-- End div.form-contact -->
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
