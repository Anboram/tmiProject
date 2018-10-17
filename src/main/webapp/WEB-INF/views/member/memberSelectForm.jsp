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
<script>

	function validate(){
			var returnFlag = true;
			//빈칸 없는지 확인
			   $(".input-box").each(function(i,e){
		     //console.log(i+"번째 값 "+$(e).val());
			      if($(e).val() == ""){
			         alert("빈칸이 없게 작성해주세요.");
			         returnFlag = false;
			         return false;
			      }
		   });
			      if(returnFlag){
			    	  $("#memberSelectForm").submit();
			      }
		}
	
</script>
<section class="section section-login">
	<div class="container">
		<div>
			<div id="register" class="login-box">
				<div class="account-input-box">
					<h1 class="text-center">로그인</h1>
					<div>
					<form id="memberSelectForm" method="post" action="memberLogin.do">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="100" />
							<col width="30" />
							<col />
						</colgroup>
							<tr>
								<td align="right"> 이메일</td>
								<td></td>
								<td>
									<input type="text" name="m_email" id="m_email" class="input-box"/> 
								</td>
							</tr>
							<tr><td colspan="3" class="text-center"><span id="email_info"></span></td></tr>
							<tr><td height="14"></td></tr>
							<tr>
								<td align="right"> 비밀번호</td>
								<td></td>
								<td>
									<input type="password" name="m_pwd" id="m_pwd" class="input-box"/>
								</td>
							</tr>
							<tr><td colspan="3" class="text-center"><span id="pwd_info"></span></td></tr>
							<tr><td height="14"></td></tr>
						<tr><td height="14"></td></tr>
						</table>
					</div>
					</form>
					<div class="btnWrap">
						<div class="btn btn-outline readmore" onclick="validate();">로그인</div>
						<div class="btn btn-outline readmore">취소</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<c:import url="../common/footer.jsp" />
</body>
</html>