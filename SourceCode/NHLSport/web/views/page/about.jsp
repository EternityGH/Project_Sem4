<%-- 
    Document   : about
    Created on : Jun 22, 2020, 12:05:31 AM
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
        <title>About Us</title>
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
            .about-us-page {
                margin: 80px 0;
            }
            
            .about-us-page h4 {
                color: #555;
                width: 100%;
                margin-top: 0;
                margin-bottom: .5em;
                text-rendering: optimizeSpeed;
                font-family: 'Poppins';
                font-size: 1.7em;
                line-height: 1.3;
            }
            
            .about-us-page p {
                color: #777;
                margin-bottom: 0;
            }
            
            .about-us-page .row .col-12:not(:first-child) {
                margin-top: 50px;
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
                    <a href="#">About Us</a>
                </div>
            </div>
            <!-- End div.container -->
        </div>
        <!-- End div.bread-crumb -->
        
        <div class="about-us-page">
            <div class="container">
                <div class="row">
                    <div class="col-12 row">
                        <div class="col-md-4">
                            <h4>Introduced</h4>
                        </div>
                        <div class="col-md-8">
                            <p>
                                Welcome to Crown ha noi, we are Crown ha noi Joint Stock Company which has been officially
                                registered with Department of Planning and Investment of Hanoi City (you can call us
                                “Crown” or “Our”). When you access our website means you agree with theses term. Crown
                                has the right to change, modify, add or remove every single part of these Terms at any time.
                                Changes take effect immediately upon posting on the website without notice. And as you
                                continue to use the site, after the changes to these Terms are posted that mean you accept those changes. 
                                Please check our website often to update new changes.
                            </p>
                        </div>
                    </div>
                    <div class="col-12 row">
                        <div class="col-md-4">
                            <h4>Website User Guide</h4>
                        </div>
                        <div class="col-md-8">
                            <p>
                                When you enter our website, ensure that you will have full civil act capacity to conduct purchase and sale transactions according to the current provisions of Vietnamese law.
                                <br><br>
                                Crown will provide a user account for you to shop on Crownhanoi.com within the terms and conditions of use. You will have to register for an account with information about yourself and must update if there is any change. Each visitor is responsible for the password, account and activity on the web. Crownhanoi Company is not responsible for any damage or loss about your profile that has been used in an unauthorized manner.
                                <br><br>
                                Any part of this website is strictly prohibited for commercial use or on behalf of any third party without our written permission. If you violate any of these, we will cancel your account without notice.
                                <br><br>
                                During the registration process, you agree to receive promotional emails from our website. If you do not want to continue receiving mail, you can refuse by re-email us at: cskh.crownhanoi@gmail.com
                            </p>
                        </div>
                    </div>
                    <div class="col-12 row">
                        <div class="col-md-4">
                            <h4>Customer Comments</h4>
                        </div>
                        <div class="col-md-8">
                            <p>
                                All content displayed and posted on the Website, including but not limited to customer’s comments and suggestions are the property of Crown. If we detect any fake, slanderous information, we have the right to immediately block a customer’s account and/or to apply other measures according to the provisions of Vietnamese law.
                            </p>
                        </div>
                    </div>
                    <div class="col-12 row">
                        <div class="col-md-4">
                            <h4>Order and Confirm orders</h4>
                        </div>
                        <div class="col-md-8">
                            <p>
                                Crown has the right to refuse or cancel your order for any reason related to technical or system errors objectively. In this case, we will refund the amount which you paid.
                                <br><br>
                                We are committed to providing the most accurate price information to yours (consumers). However, sometimes error still occur, such as the product price does not display correctly on the website or the wrong price, depending on each case, we will contact with instruction or notice of canceling your order.
                            </p>
                        </div>
                    </div>
                    <div class="col-12 row">
                        <div class="col-md-4">
                            <h4>Trademarks and copyright</h4>
                        </div>
                        <div class="col-md-8">
                            <p>
                                All intellectual property rights (registered or unregistered), information content and all designs, texts, graphics, software, images, videos, music, audio, translation software, source code and basic software are the property of Crown. The entire content of the website is protected by copyright laws of Vietnam and international conventions. Copyright has been reserved.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <jsp:include page="../layout/footer.jsp" />

        <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
        <script src="${context}/vendors/popper/popper.min.js"></script>
        <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script src="${context}/assets/js/script.js"></script>
    
    </body>
</html>
