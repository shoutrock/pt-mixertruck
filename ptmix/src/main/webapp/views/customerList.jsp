<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${pageContext.request.contextPath}/style/js/customerList.js"></script>
</head>
<body>
<header>
    <h1>
        <a href="${pageContext.request.contextPath}/car/list.do">평택 레미콘</a>
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
        <li>
            <a href="${pageContext.request.contextPath}/car/list.do">차량목록</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/carCreate.jsp">차량등록</a>
        </li>
        <li class="on">
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
    <h2 class="page-title">고객목록</h2>
    <div class="contents">
    	<h4 class="form_title">고객목록</h4>
        <table border="1">
            <colgroup>
                <col width="90">
                <col width="100">
                <col width="150">
                <col width="150">
                <col width="*">
                <col width="*">
            </colgroup>
            <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>주민등록번호</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>비고</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customers}" varStatus="sts">
	            <tr>
	              <td>${sts.count}</td>
                  <td><a href="${pageContext.request.contextPath}/customer/touch/list.do?customerId=${customer.usid}">${customer.name}</a></td>
	              <td>${customer.juminNo}</td>
	              <td>${customer.phone}</td>
	              <td>${customer.address}</td>
	              <td>${customer.remark}</td>
	            </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="alignRight">
          <button id="btnRegistPop" class="btn btn-primary">등록</button>
        </div>
    </div>
    
    <div id="detailModal" class="modal modal_wrap" style="display:none; width:560px; ">
    		<div class="modal_contents">
        		<h3>신규 고객</h3>
        		<div class="modal_con">
	            <h4 class="form_title">신규 고객 등록</h4>
	            <form action="#" class="info_box">
	                <fieldset>
	                    <legend>신규고객</legend>
	                    <label>
	                        <span>이름</span>
	                        <input type="text" id="name">
	                    </label>
	                    <label>
	                        <span>주민등록번호</span>
	                        <input type="text" id="juminNo">
	                    </label>
	                    <label>
	                        <span>전화번호</span>
	                        <input type="text" id="phone">
	                    </label>
	                    <label>
	                        <span>주소</span>
	                        <input type="text" id="address">
	                    </label>
	                    <label>
	                        <span>비고</span>
	                        <input type="text" id="remark">
	                    </label>
	                </fieldset>
	            </form>
	        </div>

	        <div class="btn_group">
	            <a href="#" rel="modal:close"><button type="button" class="btn btn-default">닫기</button></a>
	            <button id="btnRegist" class="btn btn-primary">저장</button>
	        </div>
    		</div>
	</div>
</div>
<footer>
    <p>    &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>
</body>
</html>








