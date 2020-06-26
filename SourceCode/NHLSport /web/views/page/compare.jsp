<%-- 
    Document   : contact
    Created on : May 25, 2020, 4:20:05 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Compare</title>
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
    <style>
        table tr th, table tr td {
            text-align: center;
            padding: 20px;
        }
        
        a.button{
            text-align: center;
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
                        <a href="#">Compare</a>
                    </div>
                </div>
                <!-- End div.container -->
            </div>
            <!-- End div.bread-crumb -->
            <p style="margin-top: 50px; margin-bottom: 0px; font-size: 2em; font-weight: 600; text-align: center; font-family: 'Poppins'; color: #446084;" >COMPARE PRODUCTS </p>
            <div style="width: 100px; height: 3px; margin: 10px auto; background: #446084;"></div>
            <div class="container">
                <p style="color: red;font-weight: bold; font-size: 150%; " >${errorCompare}</p>
                <c:if test="${listCompare == null}">
                    <p style="font-size: 1em; font-weight: 600; text-align: center; font-family: 'Poppins'; color: #555; margin-top: 30px;" >NOTHING TO COMPARE </p>
                    <hr>
                    <p class="lead" style="text-align: center">
                        <a class="button primary wc-backward" href="${context}/Home/" role="button">Continue to shopping</a>
                    </p>
                </c:if>
                <c:if test="${listCompare != null}">
                    <div>
                        <p class="lead" style="margin: 50px 0 20px 0;">
                            <a class="button primary wc-backward" href="${context}/Products/ResetList" role="button">Reset Compare</a>
                        </p>
                    </div>

                    <table class="table-bordered w-100"> 
                        <tr>
                            <th>Image:</th>
                            <c:forEach var="item" items="${listCompare}">
                                <c:set var="url" value="${fn:split(item.imageUrl, ';')}"/>
                                <td>
                                    <a href="${context}/Products/Detail?id=${item.productId}" class="view"><img src="${context}/assets/images/products/${url[0]}" class="img-fluid" /></a>
                                    
                                </td>
                            </c:forEach>
                        </tr>
                        <tr>
                          <th>Name:</th>
                          <c:forEach var="item" items="${listCompare}">
                            <td>${item.productName}</td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <th>Brand:</th>
                          <c:forEach var="item" items="${listCompare}">
                            <td>${item.brandId.name}</td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <th>Price:</th>
                          <c:forEach var="item" items="${listCompare}">
                            <td>${item.price} $</td>
                          </c:forEach>
                        </tr>
                        <tr>
                          <th>Description</th>
                          <c:forEach var="item" items="${listCompare}">
                            <td>${item.description}</td>
                          </c:forEach>
                        </tr>
                    </table>

                </c:if>


            </div>
                <br/>
                <br/>
            <jsp:include page="../layout/footer.jsp" />


            <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
            <script src="${context}/vendors/popper/popper.min.js"></script>
            <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
            <script src="${context}/assets/js/script.js"></script>
        </body>
    </html>
