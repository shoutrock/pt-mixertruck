<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/style.css">
</head>
<body>
<div class="login-wrap">
    <h3>로그인</h3>
    <form action="#" method="post">
        <label>아이디</label>
        <input type="text" name="loginId" placeholder="아이디를 입력하세요.">
        <label>비밀번호</label>
        <input type="password" name="passwd" placeholder="패스워드를 입력하세요.">
        <div class="login-btn">
            <button type="reset" class="btn btn-reset">취소</button>
            <button type="submit" class="btn btn-submit">로그인</button>
        </div>
    </form>
</div>
</body>
</html>



