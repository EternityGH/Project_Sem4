<%-- 
    Document   : index
    Created on : May 25, 2020, 1:25:17 PM
    Author     : longv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.admin == null}">
    <c:redirect url="http://localhost:8080${context}/Admin/Login"/>  
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Category Page</title>
        <!-- Normalize -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/normalize/normalize.css">
        <!-- Bootstrap 4.0.0 -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/bootstrap-4.0.0-dist/css/bootstrap.min.css">
        <!-- Animate -->
        <link rel="stylesheet" type="text/css" href="${context}/vendors/animate/animate.css">
        <!-- Elegant Icon -->
        <link rel="stylesheet" type="text/css" href="${context}/assets/fonts/Elegants/style.css">
        <!-- FontAwesome -->
        <script src="https://kit.fontawesome.com/0644aaed0c.js" crossorigin="anonymous"></script>
        <!-- CSS Global Icons -->
        <link rel="stylesheet" href="${context}/admin/vendors/icon-hs/style.css">
        <link rel="stylesheet" href="${context}/admin/vendors/hs-admin-icons/hs-admin-icons.css">
        <!-- CSS Unify -->
        <link rel="stylesheet" href="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
        <link rel="stylesheet" href="${context}/admin/vendors/bootstrap/bootstrap-select.min.css">
        <link rel="stylesheet" href="${context}/admin/vendors/bootstrap/bootstrap-tagsinput.css">
        <link rel="stylesheet" href="${context}/admin/vendors/summernote/unify-lite.css">
        <link rel="stylesheet" href="${context}/admin/assets/css/unify-admin.css">
        <!-- My CSS -->
        <link rel="stylesheet" type="text/css" href="${context}/admin/assets/css/styles.css">
    </head>
    <body>

        <jsp:include page="../layout/header.jsp" />

        <main class="container-fluid px-0 g-pt-65">
            <div class="row no-gutters g-pos-rel g-overflow-x-hidden">

                <jsp:include page="../layout/navigation.jsp" />


                <div class="col g-ml-45 g-ml-0--lg g-pb-65--md">

                    <div class="g-pa-20">
                        <div class="row">
                            <div class="col-md-3 g-mb-30 g-mb-0--md">
                                <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                    <!-- User Information -->
                                    <section class="text-center g-mb-30 g-mb-50--md">
                                        <div class="d-inline-block g-pos-rel g-mb-20">
                                            <a class="u-badge-v2--lg u-badge--bottom-right g-width-32 g-height-32 g-bg-secondary g-bg-primary--hover g-transition-0_3 g-mb-20 g-mr-20" href="#">
                                                <i class="hs-admin-pencil g-absolute-centered g-font-size-16 g-color-white"></i>
                                            </a>
                                            <img class="img-fluid rounded-circle" src="${context}/admin/assets/img/avatar/user-male-icon.png" alt="Image description">
                                        </div>
                                        <h3 class="g-font-weight-300 g-font-size-20 g-color-black mb-0">${admin.fullName}</h3>
                                    </section>
                                    <!-- User Information -->

                                    <!-- Profile Sidebar -->
                                    <section>
                                        <ul class="list-unstyled mb-0">
                                            <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                                                <a class="d-flex align-items-center u-link-v5 g-parent g-py-15 active" href="/NHLSport/Admin/Profile">
                                                    <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent-active g-mr-15">
                                                        <i class="hs-admin-user"></i>
                                                    </span>
                                                    <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">Profile Information</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </section>
                                    <section>
                                        <ul class="list-unstyled mb-0">
                                            <li class="g-brd-top g-brd-gray-light-v7 mb-0">
                                                <a class="d-flex align-items-center u-link-v5 g-parent g-py-15 active" href="/NHLSport/Admin/Security">
                                                    <span class="g-font-size-18 g-color-gray-light-v6 g-color-primary--parent-hover g-color-primary--parent-active g-mr-15">
                                                          <i class="hs-admin-lock"></i>
                                                    </span>
                                                    <span class="g-color-gray-dark-v6 g-color-primary--parent-hover g-color-primary--parent-active">Security</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </section>
                                    <!-- End Profile Sidebar -->
                                </div>

                            </div>

                            <div class="col-md-9">
                                <div class="h-100 g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md">
                                    <form  method="post" action="${context}/Admin/updateAccount" class="js-validate">
                                       <input id="lastName" name="id" hidden value="${admin.id}">
                                        <header>
                                            <h2 class="text-uppercase g-font-size-12 g-font-size-default--md g-color-black mb-0">General information</h2>
                                        </header>

                                        <hr class="d-flex g-brd-gray-light-v7 g-my-15 g-my-30--md">
                 
                                            <c:if test="${errors != null}">
                                            <div class="noty_bar noty_type__error noty_theme__unify--v1 g-mb-25">
                                              <div class="noty_body">
                                                <div class="g-mr-20">
                                                  <div class="noty_body__icon">
                                                    <i class="hs-admin-alert"></i>
                                                  </div>
                                                </div>
                                                <div><c:out value="${errors}" /></div>
                                              </div>
                                            </div>
                                            </c:if>
                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#fullname">Full Name</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="form-group g-pos-rel mb-0">
                                                    <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                    </span>
                                                    <input id="lastName" name="fullname" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="text" value="${admin.fullName}" required="required" data-msg="This field is mandatory"
                                                           data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0">I’m</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="row g-mx-minus-10">
                                                    <div class="col-md-auto align-self-center g-width-180--md g-px-10">
                                                        <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                            </span>
                                                            <select name="gender" class="js-select u-select--v2-select" style="display: none;">
                                                                <option value="false" ${admin.gender == true ? "selected" : ""}>Male</option>
                                                                <option value="true" ${admin.gender == true ? "selected" : ""}>Female</option>
                                                            </select>
                                                            <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                                            

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0">Birth Date</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="row g-mx-minus-10">
                                                    <div class="col-md align-self-center g-px-10 g-mb-20 g-mb-0--md">
                                                        <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                            </span>
                                                            
                                                            <fmt:formatDate value='${admin.dob}' pattern='dd/MM/yyyy' var="dayOfBirth" />
                                                            <c:set var="daymonthyear" value="${dayOfBirth}"/>
                                                            <c:set var="month" value="${fn:substring(daymonthyear, 3, 5)}"/>

                                         
                                                            <select name="Month" class="js-select u-select--v2-select" style="display: none;">
                                                                <option value="01">--</option>                                                               
                                                                <option ${month == "01" ? "selected" : ""} value="01">January</option>
                                                                <option ${month == "02" ? "selected" : ""} value="02">February</option>
                                                                <option ${month == "03" ? "selected" : ""} value="03">March</option>
                                                                <option ${month == "04" ? "selected" : ""} value="04">April</option>
                                                                <option ${month == "05" ? "selected" : ""} value="05">May</option>
                                                                <option ${month == "06" ? "selected" : ""} value="06">June</option>
                                                                <option ${month == "07" ? "selected" : ""} value="07">July</option>
                                                                <option ${month == "08" ? "selected" : ""} value="08">August</option>
                                                                <option ${month == "09" ? "selected" : ""} value="09">September</option>
                                                                <option ${month == "10" ? "selected" : ""} value="10">October</option>
                                                                <option ${month == "11" ? "selected" : ""} value="11">November</option>
                                                                <option ${month == "12" ? "selected" : ""} value="12">December</option>
                                                            </select>
                                                            <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                        </div>
                                                    </div>

                                                    <div class="col-6 col-md-auto align-self-center g-width-100--md g-px-10">
                                                        <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                            </span>                                                        
                                                            <c:set var="day" value="${fn:substring(daymonthyear, 0, 2)}"/>  
                                                            <select name="Day" class="js-select u-select--v2-select" style="display: none;">
                                                                <option value="01">--</option>
                                                                <option ${day == "01" ? "selected" : ""} value="01">1</option>
                                                                <option ${day == "02" ? "selected" : ""} value="02">2</option>
                                                                <option ${day == "03" ? "selected" : ""} value="03">3</option>
                                                                <option ${day == "04" ? "selected" : ""} value="04">4</option>
                                                                <option ${day == "05" ? "selected" : ""} value="05">5</option>
                                                                <option ${day == "06" ? "selected" : ""} value="06">6</option>
                                                                <option ${day == "07" ? "selected" : ""} value="07">7</option>
                                                                <option ${day == "08" ? "selected" : ""} value="08">8</option>
                                                                <option ${day == "09" ? "selected" : ""} value="09">9</option>
                                                                <option ${day == "10" ? "selected" : ""} value="10">10</option>
                                                                <option ${day == "11" ? "selected" : ""} value="11">11</option>
                                                                <option ${day == "12" ? "selected" : ""} value="12">12</option>
                                                                <option ${day == "13" ? "selected" : ""} value="13">13</option>
                                                                <option ${day == "14" ? "selected" : ""} value="14">14</option>
                                                                <option ${day == "15" ? "selected" : ""} value="15">15</option>
                                                                <option ${day == "16" ? "selected" : ""} value="16">16</option>
                                                                <option ${day == "17" ? "selected" : ""} value="17">17</option>
                                                                <option ${day == "18" ? "selected" : ""} value="18">18</option>
                                                                <option ${day == "19" ? "selected" : ""} value="19">19</option>
                                                                <option ${day == "20" ? "selected" : ""} value="20">20</option>
                                                                <option ${day == "21" ? "selected" : ""} value="21">21</option>
                                                                <option ${day == "22" ? "selected" : ""} value="22">22</option>
                                                                <option ${day == "23" ? "selected" : ""} value="23">23</option>
                                                                <option ${day == "24" ? "selected" : ""} value="24">24</option>
                                                                <option ${day == "25" ? "selected" : ""} value="25">25</option>
                                                                <option ${day == "26" ? "selected" : ""}  value="26">26</option>
                                                                <option ${day == "27" ? "selected" : ""} value="27">27</option>
                                                                <option ${day == "28" ? "selected" : ""} value="28">28</option>
                                                                <option ${day == "29" ? "selected" : ""} value="29">29</option>
                                                                <option ${day == "30" ? "selected" : ""} value="30">30</option>
                                                                <option ${day == "31" ? "selected" : ""} value="31">31</option>
                                                            </select>
                                                            <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                        </div>
                                                    </div>

                                                    <div class="col-6 col-md-auto align-self-center g-width-135--md g-px-10">
                                                        <div class="form-group u-select--v2 g-pos-rel g-brd-gray-light-v7 g-rounded-4 mb-0">
                                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                            </span>
                                                             <c:set var="year" value="${fn:substring(daymonthyear, 6, 10)}"/>  
                                                            <select name="Year" class="js-select u-select--v2-select" style="display: none;">
                                                                <option ${year == "1900" ? "selected" : ""} value="1990">--</option>
                                                                <option ${year == "1900" ? "selected" : ""} value="1900">1900</option>
                                                                <option ${year == "1901" ? "selected" : ""} value="1901">1901</option>
                                                                <option ${year == "1902" ? "selected" : ""} value="1902">1902</option>
                                                                <option ${year == "1903" ? "selected" : ""} value="1903">1903</option>
                                                                <option ${year == "1904" ? "selected" : ""} value="1904">1904</option>
                                                                <option ${year == "1905" ? "selected" : ""} value="1905">1905</option>
                                                                <option ${year == "1906" ? "selected" : ""} value="1906">1906</option>
                                                                <option ${year == "1907" ? "selected" : ""} value="1907">1907</option>
                                                                <option ${year == "1908" ? "selected" : ""} value="1908">1908</option>
                                                                <option ${year == "1909" ? "selected" : ""} value="1909">1909</option>
                                                                <option ${year == "1910" ? "selected" : ""} value="1910">1910</option>
                                                                <option ${year == "1911" ? "selected" : ""} value="1911">1911</option>
                                                                <option ${year == "1912" ? "selected" : ""} value="1912">1912</option>
                                                                <option ${year == "1913" ? "selected" : ""} value="1913">1913</option>
                                                                <option ${year == "1914" ? "selected" : ""} value="1914">1914</option>
                                                                <option ${year == "1915" ? "selected" : ""} value="1915">1915</option>
                                                                <option ${year == "1916" ? "selected" : ""} value="1916">1916</option>
                                                                <option ${year == "1917" ? "selected" : ""} value="1917">1917</option>
                                                                <option ${year == "1918" ? "selected" : ""} value="1918">1918</option>
                                                                <option ${year == "1919" ? "selected" : ""} value="1919">1919</option>
                                                                <option ${year == "1920" ? "selected" : ""} value="1920">1920</option>
                                                                <option ${year == "1921" ? "selected" : ""} value="1921">1921</option>
                                                                <option ${year == "1922" ? "selected" : ""} value="1922">1922</option>
                                                                <option ${year == "1923" ? "selected" : ""} value="1923">1923</option>
                                                                <option ${year == "1924" ? "selected" : ""} value="1924">1924</option>
                                                                <option ${year == "1925" ? "selected" : ""} value="1925">1925</option>
                                                                <option ${year == "1926" ? "selected" : ""} value="1926">1926</option>
                                                                <option ${year == "1927" ? "selected" : ""} value="1927">1927</option>
                                                                <option ${year == "1928" ? "selected" : ""} value="1928">1928</option>
                                                                <option ${year == "1929" ? "selected" : ""} value="1929">1929</option>
                                                                <option ${year == "1930" ? "selected" : ""} value="1930">1930</option>
                                                                <option ${year == "1931" ? "selected" : ""} value="1931">1931</option>
                                                                <option ${year == "1932" ? "selected" : ""} value="1932">1932</option>
                                                                <option ${year == "1933" ? "selected" : ""} value="1933">1933</option>
                                                                <option ${year == "1934" ? "selected" : ""} value="1934">1934</option>
                                                                <option ${year == "1935" ? "selected" : ""} value="1935">1935</option>
                                                                <option ${year == "1936" ? "selected" : ""} value="1936">1936</option>
                                                                <option ${year == "1937" ? "selected" : ""} value="1937">1937</option>
                                                                <option ${year == "1938" ? "selected" : ""} value="1938">1938</option>
                                                                <option ${year == "1939" ? "selected" : ""} value="1939">1939</option>
                                                                <option ${year == "1940" ? "selected" : ""} value="1940">1940</option>
                                                                <option ${year == "1941" ? "selected" : ""} value="1941">1941</option>
                                                                <option ${year == "1942" ? "selected" : ""} value="1942">1942</option>
                                                                <option ${year == "1943" ? "selected" : ""} value="1943">1943</option>
                                                                <option ${year == "1944" ? "selected" : ""} value="1944">1944</option>
                                                                <option ${year == "1945" ? "selected" : ""} value="1945">1945</option>
                                                                <option ${year == "1946" ? "selected" : ""} value="1946">1946</option>
                                                                <option ${year == "1947" ? "selected" : ""} value="1947">1947</option>
                                                                <option ${year == "1948" ? "selected" : ""} value="1948">1948</option>
                                                                <option ${year == "1949" ? "selected" : ""} value="1949">1949</option>
                                                                <option ${year == "1950" ? "selected" : ""} value="1950">1950</option>
                                                                <option ${year == "1951" ? "selected" : ""} value="1951">1951</option>
                                                                <option ${year == "1952" ? "selected" : ""} value="1952">1952</option>
                                                                <option ${year == "1953" ? "selected" : ""} value="1953">1953</option>
                                                                <option ${year == "1954" ? "selected" : ""} value="1954">1954</option>
                                                                <option ${year == "1955" ? "selected" : ""} value="1955">1955</option>
                                                                <option ${year == "1956" ? "selected" : ""} value="1956">1956</option>
                                                                <option ${year == "1957" ? "selected" : ""} value="1957">1957</option>
                                                                <option ${year == "1958" ? "selected" : ""} value="1958">1958</option>
                                                                <option ${year == "1959" ? "selected" : ""} value="1959">1959</option>
                                                                <option ${year == "1960" ? "selected" : ""} value="1960">1960</option>
                                                                <option ${year == "1961" ? "selected" : ""} value="1961">1961</option>
                                                                <option ${year == "1962" ? "selected" : ""} value="1962">1962</option>
                                                                <option ${year == "1963" ? "selected" : ""} value="1963">1963</option>
                                                                <option ${year == "1964" ? "selected" : ""} value="1964">1964</option>
                                                                <option ${year == "1965" ? "selected" : ""} value="1965">1965</option>
                                                                <option ${year == "1966" ? "selected" : ""} value="1966">1966</option>
                                                                <option ${year == "1967" ? "selected" : ""} value="1967">1967</option>
                                                                <option ${year == "1968" ? "selected" : ""} value="1968">1968</option>
                                                                <option ${year == "1969" ? "selected" : ""} value="1969">1969</option>
                                                                <option ${year == "1970" ? "selected" : ""} value="1970">1970</option>
                                                                <option ${year == "1971" ? "selected" : ""} value="1971">1971</option>
                                                                <option ${year == "1972" ? "selected" : ""} value="1972">1972</option>
                                                                <option ${year == "1973" ? "selected" : ""} value="1973">1973</option>
                                                                <option ${year == "1974" ? "selected" : ""} value="1974">1974</option>
                                                                <option ${year == "1975" ? "selected" : ""} value="1975">1975</option>
                                                                <option ${year == "1976" ? "selected" : ""} value="1976">1976</option>
                                                                <option ${year == "1977" ? "selected" : ""} value="1977">1977</option>
                                                                <option ${year == "1978" ? "selected" : ""} value="1978">1978</option>
                                                                <option ${year == "1979" ? "selected" : ""} value="1979">1979</option>
                                                                <option ${year == "1980" ? "selected" : ""} value="1980">1980</option>
                                                                <option ${year == "1981" ? "selected" : ""} value="1981">1981</option>
                                                                <option ${year == "1982" ? "selected" : ""} value="1982">1982</option>
                                                                <option ${year == "1983" ? "selected" : ""} value="1983">1983</option>
                                                                <option ${year == "1984" ? "selected" : ""} value="1984">1984</option>
                                                                <option ${year == "1985" ? "selected" : ""} value="1985">1985</option>
                                                                <option ${year == "1986" ? "selected" : ""} value="1986">1986</option>
                                                                <option ${year == "1987" ? "selected" : ""} value="1987">1987</option>
                                                                <option ${year == "1988" ? "selected" : ""} value="1988">1988</option>
                                                                <option ${year == "1989" ? "selected" : ""} value="1989">1989</option>
                                                                <option ${year == "1990" ? "selected" : ""} value="1990">1990</option>
                                                                <option ${year == "1991" ? "selected" : ""} value="1991">1991</option>
                                                                <option ${year == "1992" ? "selected" : ""} value="1992">1992</option>
                                                                <option ${year == "1993" ? "selected" : ""} value="1993">1993</option>
                                                                <option ${year == "1994" ? "selected" : ""} value="1994">1994</option>
                                                                <option ${year == "1995" ? "selected" : ""} value="1995">1995</option>
                                                                <option ${year == "1996" ? "selected" : ""} value="1996">1996</option>
                                                                <option ${year == "1997" ? "selected" : ""} value="1997">1997</option>
                                                                <option ${year == "1998" ? "selected" : ""} value="1998">1998</option>
                                                                <option ${year == "1999" ? "selected" : ""} value="1999">1999</option>
                                                                <option ${year == "2000" ? "selected" : ""} value="2000">2000</option>
                                                                <option ${year == "2001" ? "selected" : ""} value="2001">2001</option>
                                                                <option ${year == "2002" ? "selected" : ""} value="2002">2002</option>
                                                                <option ${year == "2003" ? "selected" : ""} value="2003">2003</option>
                                                                <option ${year == "2004" ? "selected" : ""} value="2004">2004</option>
                                                                <option ${year == "2005" ? "selected" : ""} value="2005">2005</option>
                                                                <option ${year == "2006" ? "selected" : ""} value="2006">2006</option>
                                                                <option ${year == "2007" ? "selected" : ""} value="2007">2007</option>
                                                                <option ${year == "2008" ? "selected" : ""} value="2008">2008</option>
                                                                <option ${year == "2009" ? "selected" : ""} value="2009">2009</option>
                                                                <option ${year == "2010" ? "selected" : ""} value="2010">2010</option>
                                                                <option ${year == "2011" ? "selected" : ""} value="2011">2011</option>
                                                                <option ${year == "2012" ? "selected" : ""} value="2012">2012</option>
                                                                <option ${year == "2013" ? "selected" : ""} value="2013">2013</option>
                                                                <option ${year == "2014" ? "selected" : ""} value="2014">2014</option>
                                                                <option ${year == "2015" ? "selected" : ""} value="2015">2015</option>
                                                                <option ${year == "2016" ? "selected" : ""} value="2016">2016</option>
                                                                <option ${year == "2017" ? "selected" : ""} value="2017">2017</option>
                                                            </select>
                                                            <i class="hs-admin-angle-down g-absolute-centered--y g-right-0 g-color-gray-light-v6 ml-auto g-mr-15"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#email">Email</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="form-group g-pos-rel mb-0">
                                                    <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                    </span>
                                                    <input id="email" name="email" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" readonly="readonly" type="email" value="${admin.email}" data-msg="This field is mandatory"
                                                           data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#address">Your location</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="form-group g-pos-rel mb-0">
                                                    <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                    </span>
                                                    <input id="lastName" name="address" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="text" value="${admin.address}" data-msg="This field is mandatory"
                                                           data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row g-mb-20">
                                            <div class="col-md-3 align-self-center g-mb-5 g-mb-0--md">
                                                <label class="mb-0" for="#phone">Phone Number</label>
                                            </div>

                                            <div class="col-md-9 align-self-center">
                                                <div class="row g-mx-minus-10">
                                                    <div class="col-auto align-self-center g-width-270 g-px-10">
                                                        <div class="form-group g-pos-rel mb-0">
                                                            <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                                                                <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                                                            </span>
                                                            <input id="phone" name="phone" class="form-control h-100 form-control-md g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-brd-primary--error g-rounded-4 g-px-20 g-py-12" type="tel" value="${admin.phone}" data-msg="This field is mandatory"
                                                                   data-error-class="u-has-error-v3" data-success-class="has-success" aria-required="true">
                                                        </div>
                                                    </div>

                                                    <div class="col align-self-center g-hidden-md-down g-px-10">
                                                        <em class="d-flex align-self-center align-items-center g-font-style-normal g-color-gray-dark-v6">
                                                            <span class="g-pos-rel g-width-18 g-height-18 g-bg-secondary g-brd-around g-brd-secondary rounded-circle">
                                                                <i class="hs-admin-check g-absolute-centered g-font-weight-800 g-font-size-8 g-color-white" title="Confirmed"></i>
                                                            </span>
                                                            <span class="g-hidden-lg-down g-font-weight-300 g-font-size-default g-color-secondary g-ml-8">Confirmed</span>
                                                        </em>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

         
                                        <div>
                                            <button class="btn btn-md btn-xl--md u-btn-secondary g-width-160--md g-font-size-12 g-font-size-default--md g-mb-10" type="submit">Save Changes</button>
                                            <button class="btn btn-md btn-xl--md u-btn-outline-gray-dark-v6 g-font-size-12 g-font-size-default--md g-mr-10 g-mb-10" type="reset">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />   
                </div>
            </div>
        </main>




    <script src="${context}/vendors/jquery/jquery-3.5.0.min.js"></script>
    <script src="${context}/admin/vendors/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="${context}/vendors/popper/popper.min.js"></script>
    <script src="${context}/vendors/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="${context}/admin/vendors/cookiejs/jquery.cookie.js"></script>
    
    <script src="${context}/admin/vendors/appear/appear.js"></script>
    <script src="${context}/admin/vendors/bootstrap/bootstrap-select.min.js"></script>
    <script src="${context}/admin/vendors/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${context}/admin/vendors/bloodhound/bloodhound.min.js"></script>
    <script src="${context}/admin/vendors/bloodhound/typeahead.jquery.min.js"></script>
    <script src="${context}/admin/vendors/bootstrap/bootstrap-tagsinput.min.js"></script>
    <script src="${context}/admin/vendors/summernote/summernote-bs4.min.js"></script>
    <script src="${context}/admin/vendors/jquery-filter/jquery.filer.min.js"></script>
    

    <!-- JS Unify -->
    <script src="${context}/admin/assets/js/unify/hs.core.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.side-nav.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.dropdown.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.scrollbar.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.text-editor.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.focus-state.js"></script>
    <script src="${context}/admin/vendors/file-attachments/hs.file-attachments.js"></script>
    <script src="${context}/admin/assets/js/unify/hs.file-attachement.js"></script>
    
    <script src="${context}/admin/assets/js/script.js"></script>
    
    <!-- JS Plugins Init. -->
    <script>
        $(document).on('ready', function() {
            // initialization of custom select
            $('.js-select').selectpicker();

            // initialization of sidebar navigation component
            $.HSCore.components.HSSideNav.init('.js-side-nav', {
                afterOpen: function() {
                    setTimeout(function() {
                    }, 400);
                },
                afterClose: function() {
                    setTimeout(function() {
                    }, 400);
                }
            });

            // initialization of HSDropdown component
            $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
                dropdownHideOnScroll: false
            });
            // initialization of custom scrollbar
            $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));


        });
    </script>
</body>
</html>
