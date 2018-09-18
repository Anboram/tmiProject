<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
<c:import url="../common/header.jsp" />
<section class="section section-login">
	<div class="container">
		<div>
			<div class="border-box noti-box">
				TMI는 투머치토커들을 위한 <span>익명</span> 서비스입니다.
			</div>
			<div id="register" class="login-box">
				<div class="account-input-box">
					<h1 class="text-center">로그인</h1>
					<a id="google" href="#" onclick="" class="fb-login">구글계정으로 로그인</a>
					<a id="email" href="#" onclick="" class="fb-login">이메일로 로그인</a>
					<div onclick="location.href='join.do'" class="already-registered pointer f-primary text-center">
						회원이 아니신가요?
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<c:import url="../common/footer.jsp" />
</body>
</html>