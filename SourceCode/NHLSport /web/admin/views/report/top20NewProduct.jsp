<%-- 
    Document   : printBill
    Created on : Jun 17, 2020, 4:03:09 PM
    Author     : HUY
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Sales</title>
        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:100,300,400,700);


            html {
                height: 100%;
                font-family: RobotoDraft, Roboto, 'Helvetica Neue', sans-serif;
            }

            body {
                height: 100%;
                margin: 0;
                background: rgba(0,0,0,.1);
            }

            * {
                box-sizing: border-box;
            }

            #container {
                display: table;
                width: 1200px;
                background: #fff;
                margin: 60px auto;
                border-radius: 4px;
            }
            /* Side Bar */

            #sideMenu {
                width: 240px;
                height: 100%;
                padding: 30px;
                border-right: 1px solid #111;
                display: table-cell;
                vertical-align: top;
                color: rgb(102, 102, 102);
            }

            .menu {
                list-style: none;
                margin: 24px 0;
                padding: 0;
            }

            .menu li {
                display: block;
                height: 30px;
                width: 100%;
                line-height: 30px;
                font-size: 14px;
                font-weight: 300;
                color: rgb(102, 102, 102);
                position: relative;
            }

            .menu li:hover {
                color: #239ae3;
            }

            .menu li:first-child {
                height: 35px;
                line-height: 35px;
                font-size: 16px;
                font-weight: 400;
                color: rgb(102, 102, 102);
            }

            .addCategory {
                font-size: 13px;
                font-weight: 300;
                color: rgb(102, 102, 102);
            }

            .addCategory:hover {
                color: rgb(102, 102, 102);
            }
            /* Content */

            #content {
                width: calc(100% - 240px);
                height: 100%;
                padding: 25px;
                display: table-cell;
                color: rgb(102, 102, 102);
            }

            #titleBar {
                height: 36px;
                margin-bottom: 30px;

            }

            .controls {
                display: block;
                width: 70px;
                height: 20px;
                color: rgb(102, 102, 102);
                font-size: 10px;
                font-weight: 300;
                text-transform: uppercase;
                text-align: center;
                line-height: 20px;
                float: right;
                border-radius: 20px;
            }

            .activeControl {
                color: rgb(102, 102, 102);
                font-weight: 600;
            }

            #salesData {
                margin-bottom: 60px;

            }

            #totalSales {
                height: 120px;
                position: relative;
                margin-top: 24px;
                margin-bottom: 50px;
            }

            #totalSales .col {
                float: left;
                width: 33.33%;
                height: 100%;
            }

            #totalSales .col .progressTitle {
                float: left;
                margin-left: 20px;
                font-weight: 300;
                color: rgb(102, 102, 102);
            }

            .progressBar {
                float: left;
                height: 120px;
                width: 120px;
                font-size: 40px;
                text-align: center;
                line-height: 120px;

            }
            /* Icons */

            .notification {
                display: block;
                width: 20px;
                height: 20px;
                background: rgba(255, 255, 255, .8);
                font-weight: 600;
                line-height: 20px;
                text-align: center;
                border-radius: 50%;
                color: #202b33;
                position: absolute;
                top: 0;
                bottom: 0;
                right: 2%;
                margin: auto;
            }

            .colorIcon {
                display: block;
                width: 10px;
                height: 10px;
                border-radius: 50%;
                position: absolute;
                top: 0;
                bottom: 0;
                right: 2%;
                margin: auto;

            }

            .plus {
                display: inline-block;
                width: 20px;
                height: 20px;
                font-weight: 600;
                font-size: 16px;
                line-height: 8px;
                padding: 4px;
                margin-right: 6px;
                border: 2px solid rgba(255, 255, 255, .2);
                border-radius: 50%;

            }

            .red {
                background: #ec1561;
            }

            .orange {
                background: #ff9939;
            }

            .green {
                background: #2bab51;
            }
            /* Table */

            table {
                width: 100%;
                border-collapse: collapse;

            }

            th {
                text-align: left;
                color: rgb(102, 102, 102);
                font-weight: 400;
                font-size: 13px;
                text-transform: uppercase;
                border-bottom: 1px solid   rgb(102, 102, 102);
                padding: 0 10px;
                padding-bottom: 14px;

            }

            tr:not(:first-child):hover {
            }

            td {
                height: 40px;
                line-height: 40px;
                font-weight: 300;
                color: rgb(102, 102, 102);
                padding: 0 10px;
            }
            /* Headers */





            .clearFix {
                clear: both;

            }



            #b .icon{
                transition: transform .2s ease-in-out;
                transform: translate3d(1000px, 20px, 0px); 
            }


            @keyframes bobble {
                0% {
                    transform: translate3d(50px, 40px, 0px);
                    animation-timing-function: ease-in;
                }
                50% {
                    transform: translate3d(50px, 50px, 0px);
                    animation-timing-function: ease-out;
                }
                100% {
                    transform: translate3d(50px, 40px, 0px);
                }
            }
        </style>
    </head>
    <body>
        <div id="container">

            <div id="content">

                <div class="mainChart">


                    <div class="span6">
                        <p class="text-center">
                            <b>ThunderShop </b>
                            <i class="em"></i>
                            <br>
                            <i>(NHL Sport Company)</i>
                            <br>
                            <i class="em">(Salse report)</i>
                        </p>
                        <center>
                            <h1>Top 20 New Product</h1>
                        </center>
                    </div>

                    <div id="totalSales">
                        <a href="#" style="text-decoration:none;">
                            <div class="text-center" style="padding-top:10px">
                                <div id="kysoban" style="margin: 0 auto; border: solid 1px #ff0000; padding: 3px; color: #ff0000; position: relative; z-index: 1; font-size:13px; max-width: 230px; text-align: left;line-height: 14px">
                                    <img style="position: absolute; z-index: -1; right: 30px; top:8px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA4CAYAAACyutuQAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAPQSURBVHja3JppSBVRFMev+TALK4LCQhOJNmiD+tJm2EZoFBUFBVFE0I6W0q5ZWNFGCpFFJZS0SJHQF0uLlg9RWB+LLNrpEWZBUdiq0//geTFcZubNe743c68Hfoze++a+fp2ZO+feMcEwDBFJpNUmCD8jmGvY/bsycejaRXSCgEw2DjnACHQCmXwcskA+shcMaCySgkM5GAPmkgy1BzSVycChCgwF2ZB5F+oLaCgzFoezYBCYApln5n7dhGaCMyAVLIDMffkDOs1yy0AN6AcKIVNj9SFdhFaDk6A7OAGZMrsPqi5ET/FtoAIkgTqwyekE1YV2gH0s9gasQna+6yq0E5Tyzy1gJXgb7iRVhbaC3abfS8ANNyeqKLSRL7NQnAdlbk9WTWg5OMj3DMVTUABadRSaD46bHvbfwFrwMZJBVBGaCE7TesbURpfdnUgHUkFoBDgHepvarkVy36gklMoymaa2JpAHfukmRGVMJRgttW8GL6Id1E+hQ2CW1FbN6xyhm9AansHMQVVAcUcH9kMoh581chR35FLzS2gwlf8gRWq/yhWB0EmoJ8tkSO304CwEbboJ7QJTLdoPgJex+hKvhBZz0SnHA3A0ll/khdBIcMSi/QfYDv7oJNQDHOONDTmoQrgd6y+MtxDtB2RZtDdLCzgthGbb3DcU+0FQJ6H+4DBItuh7xNO30EUokSuBIRZ9tPLcw5se8RFKq02I9RusJTxNW0U9VwUinhkaD6lpMRpvIGcg0aKvRdr8iJsQPaXnQaoMdOvgeHSzp9v00V70vbgLBXMNWiHuBdPBXUhNinKspWChTd9XljW8yBC9iP2AwwowitbzkCoByRGMk86Xml1cAE+8qLH+z3KQahDtO5YpXEjWQWqcy3EowwNs+ugKKPeqApan7QrTumQyqIVUUZhszQGLHPqpxHnuixCy9Fu0v65o5CbaWirly3CCxfl9eOZKshm/mf+ThF8ZCt1PG7gaDkU2Z2uL9PSn0ma4w/j0LvSVr0IsVccLL3P04pmKNgFp64le3q5zGJuyc8rrDQunl8ZUvtAW7QypnbJFrzY+s6RdXPTy3glbyyFLdMnl2VTFfcEwh3G/+JGdsMUppGhyKIjigXgZPFZOiKUu8arTbdCedKXwKdwuH4pAg8vPXuE1j7pCyBLVYuv53nCKvzxVt6qeIZJ6yLs0TkHV9E3hY0S6YqW/5qh26KeldZs2QshSK1cRjRbdVE1fFz5HNHsKTVwhyG/YqlzcY0oKUdySltOf+NkjdBUKlUb1puX1a92FfnJp9J7rNiXinwADAE4w55Whk0mGAAAAAElFTkSuQmCC" kasperskylab_antibanner="on">
                                    Signature Valid <br>
                                    Ký bởi: CÔNG TY TNHH NHL SPORT<br>
                                    Ký  Ngày: 27 tháng 06 năm 2020</div>
                            </div>
                        </a>

                    </div>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Brand</th>
                        </tr>
                        <c:set var="i" value="0" />
                        <c:forEach var="item" items="${listProduct}">
                            <tr>
                                <th>${item.productId}</th>
                                <th>${item.productName}</th>
                                <th>${item.categoryId.name}</th>
                                <th>${item.brandId.name}</th>
                            </tr>
                             </c:forEach>

                    </table>
                </div>

            </div>
        </div>

    </body>
</html>