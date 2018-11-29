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
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/lib/jquery.modal.min.js"></script>
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
    <h2 class="page-title">고객터치</h2>
    <div class="contents">
      <div class="info-box">
        고객명 : ${customer.name} <br>
        연락처 : ${customer.phone}
      </div>
      <table>
        <colgroup>
          <col width="150">
          <col width="*">
        </colgroup>
        <thead>
        <tr>
          <th>일자</th>
          <th>상세내역</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="touch" items="${customerTouchs}" varStatus="sts">
            <tr>
                <td>${touch.meetDate}</td>
                <td class="alignLeft">${touch.contents}</td>
            </tr>
        </c:forEach>
        <tr>
          <td>2017-02-20</td>
          <td class="alignLeft">평택 사무실 방문하여 차량 인수</td>
        </tr>
        <tr>
          <td>2017-01-20</td>
          <td class="alignLeft">홍길동 사장님 사무실에 방문하여 명절 선물 전달^^</td>
        </tr>
        <tr>
          <td>2017-01-09</td>
          <td class="alignLeft">평택 사무실 방문하여 대우, 현대 차량 2개 확인함<br>금액은 최대한 맞춰드리기로 했음</td>
        </tr>
        <tr>
          <td>2017-01-05</td>
          <td class="alignLeft">40만 키로 이하 차량 문의함<br>금액은 7000만원 정도 선으로 요청</td>
        </tr>
        </tbody>
      </table>
      <div class="alignRight">
        <button class="btn btn-primary" href="#detailModal" rel="modal:open">고객터치내역 등록</button>
      </div>
    </div>

    <div id="detailModal" class="modal modal_wrap" style="display:none; width:465px; ">
        <div class="modal_contents">
            <h3>고객 상세정보</h3>
            <div class="modal_con">
                <h4 class="form_title">고객터치 등록</h4>
                <form action="${pageContext.request.contextPath}/customer/touch/regist.do" class="info_box">
                    <fieldset>
                        <legend>고객터치 등록</legend>
                        <label>
                            <span>일자</span>
                            <input type="hidden" name="customerId" value="${customer.usid}"/>
                            <input type="date" name="meetDate"/>
                        </label>
                        <label>
                            <span>상세 내역</span>
                            <textarea name="contents" id="" cols="30" rows="5"></textarea>
                        </label>
                    </fieldset>
                </form>
            </div>

            <div class="btn_group">
                <a href="#" rel="modal:close">
                    <button type="button" class="btn btn-default">닫기</button>
                </a>
                <button class="btn btn-primary">저장</button>
            </div>
        </div>
    </div>

</div>
<footer>
    <p>    &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>
</body>
</html>