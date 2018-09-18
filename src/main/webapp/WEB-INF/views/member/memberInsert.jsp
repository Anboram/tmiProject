<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
					<a id="google" href="#" onclick="" class="fb-login">구글계정으로 시작하기</a>
					<a id="email" href="memberInsertForm.do" class="fb-login">이메일로 시작하기</a>
					<div class="text-center">가입시 이메일 제공 동의가 필요합니다.</div>
				</div>
			</div>
		</div>
	</div>
</section>
<c:import url="../common/footer.jsp" />
</body>
</html>