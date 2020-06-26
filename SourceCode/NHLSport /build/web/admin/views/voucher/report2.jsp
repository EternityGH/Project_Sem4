<%-- 
    Document   : printBill
    Created on : Jun 17, 2020, 4:03:09 PM
    Author     : DUY
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #FAFAFA;
                font: 12pt "Tohoma";
            }
            * {
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }
            .page {
                width: 21cm;
                overflow:hidden;
                min-height:297mm;
                padding: 2.5cm;
                margin-left:auto;
                margin-right:auto;
                background: white;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .subpage {
                padding: 1cm;
                border: 5px red solid;
                height: 237mm;
                outline: 2cm #FFEAEA solid;
            }
            @page {
                size: A4;
                margin: 0;
            }
            button {
                width:100px;
                height: 24px;
            }
            .header {
                overflow:hidden;
            }
            .logo {
                background-color:#FFFFFF;
                text-align:left;
                float:left;
            }
            .company {
                padding-top:24px;
                text-transform:uppercase;
                background-color:#FFFFFF;
                text-align:right;
                float:right;
                font-size:16px;
            }
            .title {
                text-align:center;
                position:relative;
                color:#0000FF;
                font-size: 24px;
                top:1px;
            }
            .footer-left {
                text-align:center;
                text-transform:uppercase;
                padding-top:24px;
                position:relative;
                height: 150px;
                width:50%;
                color:#000;
                float:left;
                font-size: 12px;
                bottom:1px;
            }
            .footer-right {
                text-align:center;
                text-transform:uppercase;
                padding-top:24px;
                position:relative;
                height: 150px;
                width:50%;
                color:#000;
                font-size: 12px;
                float:right;
                bottom:1px;
            }
            .TableData {
                background:#ffffff;
                font: 11px;
                width:100%;
                border-collapse:collapse;
                font-family:Verdana, Arial, Helvetica, sans-serif;
                font-size:12px;
                border:thin solid #d3d3d3;
            }
            .TableData TH {
                background: rgba(0,0,255,0.1);
                text-align: center;
                font-weight: bold;
                color: #000;
                border: solid 1px #ccc;
                height: 24px;
            }
            .TableData TR {
                height: 24px;
                border:thin solid #d3d3d3;
            }
            .TableData TR TD {
                padding-right: 2px;
                padding-left: 2px;
                border:thin solid #d3d3d3;
            }
            .TableData TR:hover {
                background: rgba(0,0,0,0.05);
            }
            .TableData .cotSTT {
                text-align:center;
                width: 10%;
            }
            .TableData .cotTenSanPham {
                text-align:left;
                width: 40%;
            }
            .TableData .cotHangSanXuat {
                text-align:left;
                width: 20%;
            }
            .TableData .cotGia {
                text-align:right;
                width: 120px;
            }
            .TableData .cotSoLuong {
                text-align: center;
                width: 50px;
            }
            .TableData .cotSo {
                text-align: right;
                width: 120px;
            }
            .TableData .tong {
                text-align: right;
                font-weight:bold;
                text-transform:uppercase;
                padding-right: 4px;
            }
            .TableData .cotSoLuong input {
                text-align: center;
            }
            @media print {
                @page {
                    margin: 0;
                    border: initial;
                    border-radius: initial;
                    width: initial;
                    min-height: initial;
                    box-shadow: initial;
                    background: initial;
                    page-break-after: always;
                }
            }
        </style>
    </head>
    <body onload="window.print();">
        <div id="page" class="page">
            <div class="header">
                <span class="flaticon-pawprint-1 mr-2"></span>
                <div class="company" style="color: #0000FF;">Shop Pet</div>
            </div>
            <br/>
            <div class="title">
                HÓA ĐƠN THANH TOÁN
                <br/>
                -------oOo-------
            </div>
            <br/>
            <br/>
            <table class="TableData">
                <thead>
                    <tr>
                        <th>Pet Name</th>
                        <th>Date Start</th>
                        <th>Received date</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${hotel.namePet}</td>
                        <td>${hotel.dateStart}</td>
                        <td>${hotel.dateEnd}</td>
                        <td>${hotel.price}$</td>
                    </tr>
                </tbody>
            </table>
            <%
                Calendar cal = Calendar.getInstance();
                int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
                int monthOfYear = cal.get(Calendar.MONTH);
                int year = cal.get(Calendar.YEAR);
            %>
            <div class="footer-left"> TP Hồ Chí Minh, ngày <%=dayOfMonth%> tháng <%=monthOfYear%> năm <%=year%><br/>
                Khách hàng </div>
            <div class="footer-right">  TP Hồ Chí Minh, ngày <%=dayOfMonth%> tháng <%=monthOfYear%> năm <%=year%><br/>
                Nhân viên 
            </div>
    </body>
</html>