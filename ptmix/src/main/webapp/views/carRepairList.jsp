<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>평택 레미콘</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/style.css">
</head>
<body>
<header>
    <h1>
        <a href="carList.html">평택 레미콘</a>
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
            <a href="carList.html">차량목록</a>
        </li>
        <li>
            <a href="carCreate.html">차량등록</a>
        </li>
        <li>
            <a href="customerList.html">고객목록</a>
        </li>
        <li class="on">
            <a href="carRepairList.html">차량수리내역</a>
        </li>
        <li>
            <a href="#">매출</a>
        </li>
    </ul>
</nav>
<div class="contents-wrap">
    <h2 class="page-title">차량수리내역</h2>
    <div class="contents">
        <table border="1">
            <colgroup>
                <col width="90">
                <col width="150">
                <col width="150">
                <col width="*">
                <col width="150">
            </colgroup>
            <thead>
            <tr>
                <th>번호</th>
                <th>제조사</th>
                <th>차대번호</th>
                <th>수리내역</th>
                <th>수리비용</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>현대</td>
              <td><a href="#">A123456789</a></td>
              <td>휠, 점화플러그</td>
              <td>10,000</td>
            </tr>
            <tr>
              <td>2</td>
              <td>대우</td>
              <td><a href="#">A123456789</a></td>
              <td>타이밍벨트</td>
              <td>20,000</td>
            </tr>
            <tr>
              <td>3</td>
              <td>현대</td>
              <td><a href="#">A123456789</a></td>
              <td>타이밍벨트, 점화플러그</td>
              <td>30,000</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<footer>
    <p>    &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>
</body>
</html>








