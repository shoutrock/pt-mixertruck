<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평택 레미콘</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/jquery.modal.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/style.css">
    <script>var ctx = "${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery.modal.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/carList.js"></script>
</head>
<body>
<header>
    <h1>
        <a href="c${pageContext.request.contextPath}/car/list.do">평택 레미콘</a>
    </h1>
    <ul class="login-info">
        <li class="logout-btn"><a href="#">로그아웃</a></li>
    </ul>
</header>
<nav>
    <ul>
        <li class="user-info">
            이한종 님
        </li>
        <li class="on">
            <a href="${pageContext.request.contextPath}/car/list.do">차량목록</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/carCreate.jsp">차량등록</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/customer/list.do">고객목록</a>
        </li>
        <li>
            <a href="carRepairList.html">차량수리내역</a>
        </li>
        <li>
            <a href="#">매출</a>
        </li>
    </ul>
</nav>
<div class="contents-wrap">
    <h2 class="page-title">차량목록</h2>
    <div class="contents">
        <h4 class="form_title">조회조건</h4>
        <form action="${pageContext.request.contextPath}/car/findBy.do" method="GET">
            <fieldset>
                <div class="s_box">
                    <legend>조회조건</legend>
                    <label>
                        <span>일자</span>
                        <select name="dateType">
                            <option value="Purchase">구매일자</option>
                            <option value="Sell">판매일자</option>
                        </select>
                        <input type="date" name="fromDate"/> ~ <input type="date" name="toDate"/>
                    </label>
                    <label class="date_select">
                        <span>이름</span>
                        <select name="customerType">
                            <option value="Seller">매도인</option>
                            <option value="Buyer">매수인</option>
                        </select>
                        <input type="text" name="customerName"/>
                    </label>
                    <button type="submit" class="btn btn-default">
                        조회
                    </button>
                </div>
            </fieldset>
        </form>

        <h4 class="form_title">차량목록</h4>
        <table border="1">
            <colgroup>
                <col width="70">
                <col width="90">
                <col width="*">
                <col width="100">
                <col width="100">
                <col width="100">
                <col width="*">
                <col width="*">
                <col width="*">
                <col width="*">
                <col width="*">
            </colgroup>
            <thead>
            <tr>
                <th>번호</th>
                <th>제조사</th>
                <th>차명</th>
                <th>연식</th>
                <th>구매일자</th>
                <th>판매일자</th>
                <th>구매금액</th>
                <th>판매금액</th>
                <th>수리금액</th>
                <th>매도인</th>
                <th>매수인</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="car" items="${cars}" varStatus="sts">
                <tr>
                    <td>${sts.count}</td>
                    <td>${car.manufacturer.name}</td>
                    <td>${car.name}</td>
                    <td>${car.productionDate}</td>
                    <td>${car.purchase.purchaseDate}</td>
                    <td>${car.sell.sellDate}</td>
                    <td>
                        <fmt:formatNumber pattern="#,###">${car.purchase.amount}</fmt:formatNumber>
                        <span class="amt_tax">
                                (<fmt:formatNumber
                                pattern="#,###">${car.purchase.declaredAmount}</fmt:formatNumber>)</span>
                    </td>
                    <td>
                        <c:if test="${car.sell ne null}">
                            <fmt:formatNumber pattern="#,###">${car.sell.amount}</fmt:formatNumber>
                            <span class="amt_tax">
                                (<fmt:formatNumber
                                    pattern="#,###">${car.sell.declaredAmount}</fmt:formatNumber>)</span>
                        </c:if>
                    </td>
                    <td>
                        <a href="#" name="maintenanceDetail" data-car-id="${car.usid}">
                            <fmt:formatNumber pattern="#,###">${car.maintenanceAmount}</fmt:formatNumber>
                        </a>
                    </td>
                    <td>
                        <c:if test="${car.purchase ne null}">
                            <a href="#" name="customerDetail" data-customer-id=${car.purchase.seller.usid}">${car.purchase.seller.name}</a>
                        </c:if>
	                </td>
	                <td>
                        <c:if test="${car.sell ne null}">
                            <a href="#" name="customerDetail" data-customer-id="${car.sell.buyer.usid}">${car.sell.buyer.name}</a>
                            <%-- <button class="btn btn-link">링크버튼</button> --%>
                            <%-- <button type="button" class="btn btn_btn02" href="#detailModal" rel="modal:open">${car.sell.buyer.name}</button> --%>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="alignRight">
            <button id="btnCreate" class="btn btn-primary">등록</button>
        </div>
    </div>

    <div id="detailModal" class="modal modal_wrap" style="display:none; width:465px; ">
        <div class="modal_contents">
            <h3>고객 상세정보</h3>
            <div class="modal_con">
                <h4 class="form_title">고객정보 조회</h4>
                <form action="#" class="info_box">
                    <fieldset>
                        <legend>고객정보</legend>
                        <label>
                            <span>이름</span>
                            <input type="hidden" id="customerId">
                            <input type="text" id="customerName">
                        </label>
                        <label>
                            <span>주민등록번호</span>
                            <input type="text" id="customerJuminNo">
                        </label>
                        <label>
                            <span>전화번호</span>
                            <input type="text" id="customerPhone">
                        </label>
                        <label>
                            <span>주소</span>
                            <input type="text" id="customerAddress">
                        </label>
                        <label>
                            <span>비고</span>
                            <input type="text" id="customerRemark">
                        </label>
                    </fieldset>
                </form>
            </div>

            <div class="btn_group">
                <a href="#" rel="modal:close"><button type="button" class="btn btn-default">닫기</button></a>
            </div>
        </div>
    </div>

    <div id="maintenanceModal" class="modal modal_wrap" style="display:none; width:600px; ">
        <div class="modal_contents">
            <h3>차량관리</h3>
            <div class="modal_con">
                <div class="info-box">
                    <span id="carSummary">현대 / 노브스</span>
                </div>
                <div class="fixed-table-container">
                    <div class="header-background"></div>
                    <div class="fixed-table-container-inner" style="height:100px;">
                        <table id="maintenanceTable" class="table">
                            <colgroup>
                                <col width="20%"/>
                                <col width="65%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>일자</span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>내용</span>
                                        </div>
                                    </div>
                                </th>
                                <th>
                                    <div class="fixed-header">
                                        <div class="th-inner">
                                            <span>금액</span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody >
                            <%-- 검색 결과가 있을 경우 (고정 높이 초과시 스크롤)
                            <tr>
                                <td>test</td>
                                <td>test</td>
                                <td>test</td>
                            </tr>
                            --%>
                            <%-- 검색 결과가 없을 경우 --%>
                            <%--<tr class="no-list">--%>
                            <%--<td colspan="4">--%>
                            <%--검색 결과가 없습니다.--%>
                            <%--</td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="btn_group">
                <a href="#" rel="modal:close"><button type="button" class="btn btn-default">닫기</button></a>
            </div>
        </div>
    </div>

</div>

<footer>
    <p> &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>

</body>
</html>








