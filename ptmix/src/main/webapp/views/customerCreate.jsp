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
    <h2 class="page-title">고객 등록</h2>
    <div class="contents">

        <form action="#" method="post">
            <div>
                <label>사번 : </label>
                <input type="text" name="empNo">
            </div>
            <div>
                <label>이름 : </label>
                <input type="text" name="empName">
            </div>
            <div class="alignRight">
                <input type="reset" value="초기화">
                <input type="submit" value="저장">
                <button id="btnCreate">등록</button>
            </div>
        </form>
    </div>
</div>
<footer>
    <p>    &#169; 2016. Pyeongtaek Remicon all rights reserved.</p>
</footer>
</body>
</html>