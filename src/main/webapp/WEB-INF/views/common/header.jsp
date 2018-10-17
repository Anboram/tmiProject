<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TMI</title>
<link rel="stylesheet" type="text/css" href="/tmi/resources/css/common.css" />
<script type="text/javascript" src="/tmi/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<header>
	<nav class="navbar navigation">
		<div class="container">
			<a href="index.do" class="navbar-logo">로고</a>
			<ul class="navbar-menu list-inline">
				<li class="tab left"><a href="#">답변하기</a></li>
			<c:if test="${empty sessionScope.user}">
				<li class="tab left"><a href="login.do">로그인</a></li>
				<li class="tab left"><a href="join.do">회원가입</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.user}">
				<li class="tab left"><a href="mypage.do"><c:out value="${user.m_name}님"></c:out></a></li>
				<li class="tab left"><a href="memberLogout.do">로그아웃</a></li>
			</c:if>
			</ul>
		</div>
	</nav>
</header>
</body>
</html>