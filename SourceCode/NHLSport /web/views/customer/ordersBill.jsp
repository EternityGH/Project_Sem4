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
    <body>
        <div id="page" class="page">
            <div class="header">
                <span class="flaticon-pawprint-1 mr-2"></span>
                <div class="company" style="color: #0000FF;">THUNDER SHOP</div>
            </div>
            <center>
                <div id="main" class="container" style="display: table;">


                    <div class="wallperBg">
                        <img class="textEvat" style="" src="">
                    </div><div class="marginTopDiv"></div><div id="invoice0header1" class="border2">
                        <div style="overflow: hidden;margin-top:10px">
                            <div style="float: left;width: 73%;">

                                <div style="float: right;width: 60%; text-align: center;margin-top:15px;">
                                    <b style="font-size: 23px!important;line-height:22px;color:red;">
                                        HÓA ĐƠN GIÁ TRỊ GIA  TĂNG<br></b>
                                    <p style="margin:10px 0px;" align="center">
                                        Ngày<em class="em">&nbsp;(Date)</em>&nbsp;&nbsp;&nbsp;25&nbsp;&nbsp;&nbsp;tháng<em class="em">&nbsp;(month)</em>&nbsp;&nbsp;&nbsp;06&nbsp;&nbsp;&nbsp;năm<em class="em">&nbsp;(year)</em>&nbsp;&nbsp;&nbsp;2020</p>
                                </div>
                            </div>
                            <div style="float: right;line-height: 1.4;margin-top:20px;margin-right:9px;">
                                <div>Mẫu số <em class="em">(Form No.)</em>:&nbsp;01GTKT0/002</div>
                                <div style="padding-top: 3px;">Ký hiệu <em class="em">(Serial)</em>:&nbsp;AA/19E</div>
                                <div>Số <em class="em">(No.)</em>:&nbsp;
                                    <b style="color:red;font-size:18px">2725316</b></div>
                            </div>
                            <div style="clear:both;line-height: 0px;">&nbsp;</div>
                        </div>
                        <p style="color:red;font-size:14px; margin-top:10px;margin-bottom:10px; text-transform: uppercase; text-align: center;">
                        </p><div>
                            <table class="fixTa" border="0" cellspacing="0" cellpadding="0" width="100%" style="font-size:13px; margin-top:15px; line-height:18px;">
                                <tbody><tr>
                                        <td width="100" valign="middle" nowrap="nowrap">Đơn vị bán hàng</td>
                                        <td width="5" valign="top">:</td>
                                        <td colspan="6" valign="middle">
                                            <b style="font-size:16px!important;font-weight:bold;width:800px;color:#00b9f4">
                                                &nbsp;&nbsp;CÔNG TY TNHH NHL SPORT</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100" valign="middle" nowrap="nowrap">Mã số thuế</td>
                                        <td width="5" valign="top">:</td>
                                        <td colspan="5" valign="middle">
                                            <span style="font-weight: bold; letter-spacing: 5px;font-size:13px;">
                                                &nbsp;0312388363</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100" valign="top" nowrap="nowrap">Địa chỉ</td>
                                        <td valign="top">:</td>
                                        <td colspan="5" valign="middle">
                                            <span style="line-height:17px;">
                                                &nbsp;&nbsp;52 Út Tịch, P.4, Q. Tân Bình, TP. Hồ Chí Minh, Việt Nam</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100" valign="top" nowrap="nowrap">Điện thoại</td>
                                        <td width="5" valign="top">:</td>
                                        <td colspan="5" valign="middle">
                                            <span style="line-height:17px;">
                                                &nbsp;&nbsp;(028) 7 305 8454</span>
                                        </td>
                                    </tr>
                                </tbody></table>
                        </div>
                        <br>
                        <div class="fixTa">
                            <div style="line-height: 17px; padding-bottom:5px; margin-bottom:5px; border:1px #000 solid;padding-left:10px; padding-top: 5px;">
                                <table style="font-size:13px;">
                                    <tbody>
                                        <tr>
                                            <td width="140" valign="left" nowrap="nowrap">
                                                Họ tên người mua hàng<i class="em">&nbsp;(Buyer's name)</i></td>
                                            <td width="5" valign="top">:</td>
                                            <td colspan="5" valign="left">
                                                <span>${order.cusName}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="140" valign="left" nowrap="nowrap">
                                                Đơn vị mua hàng<i class="em">&nbsp;(Company name)</i></td>
                                            <td width="5" valign="top">:</td>
                                            <td colspan="5" valign="left">
                                                <span>${order.cusName}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="140" valign="left" nowrap="nowrap">
                                                Mã số thuế<i class="em">&nbsp;(Tax code)</i></td>
                                            <td width="5" valign="left">:</td>
                                            <td colspan="5" valign="left">
                                                <span>-------</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="140" valign="top" nowrap="nowrap">Địa chỉ&nbsp;<i class="em">(Address)</i></td>
                                            <td valign="top">:</td>
                                            <td colspan="5" valign="left">
                                                <span style="line-height:17px;">${order.address}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="140" valign="left" nowrap="nowrap">
                                                Điện thoại
                                            </td>
                                            <td width="5" valign="left">:</td>
                                            <td width="200" valign="middle" nowrap="nowrap">${order.cusName}</td>
                                            <td valign="left" nowrap="nowrap">Hình thức thanh toán<i class="em">&nbsp;(Method of payment)</i></td>
                                            <td width="5" valign="left">:</td>
                                            <td valign="middle" nowrap="nowrap">${order.paymentMethod}</td>
                                        </tr>
                                    </tbody></table>
                            </div>
                        </div>
                    </div>
                    <div class="wallperTable"><table id="invoice0table1" class="table table-bordered">
                            <thead>
                                <tr class="thead" style="font-size:11px; line-height:15px;">

                            <th style="">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Tên hàng hóa dịch vụ</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">(Description of goods/service)</em>
                            </p>
                            </th>
                            <th style="width: 50px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Số lượng</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">(Quantity)</em>
                            </p>
                            </th>
                            <th style="width: 80px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Đơn giá trước chiết khấu</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">(Unit price)</em>
                            </p>
                            </th>
                            <th style="width: 80px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Tổng số tiền chiết khấu</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">
                                </em></p><em class="em">
                            </em></th>
                            <th style="width: 90px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Thành tiền trước thuế</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">(Amount before VAT)</em>
                            </p>
                            </th>
                            <th style="width: 80px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Thuế suất GTGT</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">(VAT rate)</em>
                            </p>
                            </th>
                            <th style="width: 80px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Tiền thuế</span>
                            </p>
                            <p style="margin:2px 2px;">
                                <em class="em">VAT</em>
                            </p>
                            </th>
                            <th style="width: 95px;">
                            <p style="margin:2px 2px;line-height:15px;">
                                <span>Thành tiền sau thuế GTGT</span>
                                <br>
                                <em class="em">(Amount after VAT)</em>
                            </p>
                            </th>
                            </tr>

                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${order.ordersDetailCollection}">
                                        
                                    <tr id="invoice0_tr_so1">
       
                                        <td class="tdFixBD">
                                            <p style="margin:2px 2px;line-height:23px;">${item.productId.productName}</p>
                                        </td>
             
                                        <td class="text-center">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;${item.quantity}</p>
                                        </td>
                                        <td class="text-right">
                                            <p style="margin:2px 2px;">${item.productId.price}$</p>
                                        </td>
                                        <td class="text-right">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0</p>
                                        </td>
                                        <td class="text-right">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;${item.productId.price}$</p>
                                        </td>
                                        <td class="text-center">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;10%
                                            </p>
                                        </td>
                                        <td class="text-right">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${item.productId.price * 10 / 100}" maxFractionDigits="2"/>$</p>
                                        </td>
                                        <td class="text-right">
                                            <p style="margin:2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${item.productId.price * 110 / 100}" maxFractionDigits="2"/>$</p>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <div>
                                <table class="fixTa" border="1px solid #000 !important" style="margin-right:2px; font-size:12px;">
                                    <tbody>
                                        <tr>
                                            <td height="23" colspan="6" valign="middle">
                                                <strong style="margin: 2px 2px">Tổng cộng <em class="em">(Total amount): </em></strong>
                                            </td>
                                            <td width="92" align="right" nowrap="nowrap">
                                                <p style="margin: 2px 2px"><fmt:formatNumber value="${order.total}" maxFractionDigits="2"/>$</p>
                                            </td>
                                            <td width="82">
                                                <strong>&nbsp;</strong>
                                            </td>
                                            <td width="82" align="right" nowrap="nowrap">
                                                <p style="margin: 2px 2px">+<fmt:formatNumber value="${order.total * 10 / 100}" maxFractionDigits="2"/>$ VAT</p>
                                            </td>
                                            <td width="97" align="right" nowrap="nowrap">
                                                <p style="margin: 2px 2px"><fmt:formatNumber value="${order.total * 110 / 100}" maxFractionDigits="2"/>$</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="23" colspan="10" valign="middle">
                                                <strong style="margin-left:100px;">
                                                    <b>MDH:&nbsp;&nbsp;</b>208380948</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="23" colspan="10" valign="middle" style="margin:2px 2px;">
                                                <div id="barcodecontainer" style="width:3in">
                                                    <div id="barcode"><div style="text-align:center"><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid white;height:1cm;display:inline-block;"></span><span style="border-left:0.03cm solid black;height:1cm;display:inline-block;"></span></div></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="23" colspan="10" style="margin:2px 2px;">
                                                <strong>Số tiền viết bằng chữ&nbsp;:&nbsp;Một trăm ba mươi hai nghìn chín trăm chín mươi tám đồng.</strong>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div colspan="6" class="text-left" style="margin-left:px;height:150px;line-height:17px">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <p class="text-center">
                                            <b>Người mua hàng </b>
                                            <i class="em">(Buyer)</i>
                                            <br>
                                            <i>(Ký, ghi rõ họ tên)</i>
                                            <br>
                                            <i class="em">(Sign &amp; full name)</i>
                                        </p>
                                        <br>
                                    </div>
                                    <div class="span6">
                                        <p class="text-center">
                                            <b>Người bán hàng </b>
                                            <i class="em">(Seller)</i>
                                            <br>
                                            <i>(Ký, ghi rõ họ tên)</i>
                                            <br>
                                            <i class="em">(Sign &amp; full name)</i>
                                        </p>
                                        <a href="#" style="text-decoration:none;">
                                            <div class="text-center" style="padding-top:10px">
                                                <div id="kysoban" style="margin: 0 auto; border: solid 1px #ff0000; padding: 3px; color: #ff0000; position: relative; z-index: 1; font-size:13px; max-width: 230px; text-align: left;line-height: 14px">
                                                    <img style="position: absolute; z-index: -1; right: 30px; top:8px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA4CAYAAACyutuQAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAPQSURBVHja3JppSBVRFMev+TALK4LCQhOJNmiD+tJm2EZoFBUFBVFE0I6W0q5ZWNFGCpFFJZS0SJHQF0uLlg9RWB+LLNrpEWZBUdiq0//geTFcZubNe743c68Hfoze++a+fp2ZO+feMcEwDBFJpNUmCD8jmGvY/bsycejaRXSCgEw2DjnACHQCmXwcskA+shcMaCySgkM5GAPmkgy1BzSVycChCgwF2ZB5F+oLaCgzFoezYBCYApln5n7dhGaCMyAVLIDMffkDOs1yy0AN6AcKIVNj9SFdhFaDk6A7OAGZMrsPqi5ET/FtoAIkgTqwyekE1YV2gH0s9gasQna+6yq0E5Tyzy1gJXgb7iRVhbaC3abfS8ANNyeqKLSRL7NQnAdlbk9WTWg5OMj3DMVTUABadRSaD46bHvbfwFrwMZJBVBGaCE7TesbURpfdnUgHUkFoBDgHepvarkVy36gklMoymaa2JpAHfukmRGVMJRgttW8GL6Id1E+hQ2CW1FbN6xyhm9AansHMQVVAcUcH9kMoh581chR35FLzS2gwlf8gRWq/yhWB0EmoJ8tkSO304CwEbboJ7QJTLdoPgJex+hKvhBZz0SnHA3A0ll/khdBIcMSi/QfYDv7oJNQDHOONDTmoQrgd6y+MtxDtB2RZtDdLCzgthGbb3DcU+0FQJ6H+4DBItuh7xNO30EUokSuBIRZ9tPLcw5se8RFKq02I9RusJTxNW0U9VwUinhkaD6lpMRpvIGcg0aKvRdr8iJsQPaXnQaoMdOvgeHSzp9v00V70vbgLBXMNWiHuBdPBXUhNinKspWChTd9XljW8yBC9iP2AwwowitbzkCoByRGMk86Xml1cAE+8qLH+z3KQahDtO5YpXEjWQWqcy3EowwNs+ugKKPeqApan7QrTumQyqIVUUZhszQGLHPqpxHnuixCy9Fu0v65o5CbaWirly3CCxfl9eOZKshm/mf+ThF8ZCt1PG7gaDkU2Z2uL9PSn0ma4w/j0LvSVr0IsVccLL3P04pmKNgFp64le3q5zGJuyc8rrDQunl8ZUvtAW7QypnbJFrzY+s6RdXPTy3glbyyFLdMnl2VTFfcEwh3G/+JGdsMUppGhyKIjigXgZPFZOiKUu8arTbdCedKXwKdwuH4pAg8vPXuE1j7pCyBLVYuv53nCKvzxVt6qeIZJ6yLs0TkHV9E3hY0S6YqW/5qh26KeldZs2QshSK1cRjRbdVE1fFz5HNHsKTVwhyG/YqlzcY0oKUdySltOf+NkjdBUKlUb1puX1a92FfnJp9J7rNiXinwADAE4w55Whk0mGAAAAAElFTkSuQmCC" kasperskylab_antibanner="on">
                                                    Signature Valid <br>
                                                    Ký bởi: CÔNG TY TNHH NHL SPORT<br>
                                                    Ký  Ngày: 25 tháng 06 năm 2020</div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <em>(Cần kiểm tra đối chiếu khi lập, giao, nhận hóa đơn)</em>
                                <br>
                            </div>
                    </div><div><div class="row text-center"><div class="displayPage"></div></div></div><div class="breackPage"></div>   
                </div>
            </center>

    </body>
</html>