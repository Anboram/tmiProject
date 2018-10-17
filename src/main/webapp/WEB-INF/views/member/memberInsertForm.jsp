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

	$(function(){
		$("#m_email").blur(function(){
			//이메일 형식 정규식
			var re= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			var checkEmail = $("#m_email").val();
			if(!re.test(checkEmail)){
				$("#email_info").text("올바른 형식이 아닌 이메일입니다.").css("color","red");
			}else{
				emailCheck();
			}
		});
		
		function emailCheck(){
			$.ajax({
				type:"get",
				url:"emailCheck.do",
				data:{id:$("#m_email").val()},
				success:function(data){
					if(data=='ok'){
						$("#email_info").text("사용가능한 이메일입니다.").css("color","green");
					}
					else{
						$("#email_info").text("이미 있는 이메일입니다.").css("color","red");
					}
				},
			}); 
		}
		$("#m_pwd").blur(function(){
			//비밀번호 정규식
			var re1=/^[a-zA-Z0-9]{6,20}$/g;
			var checkPwd = $("#m_pwd").val();
			if(!re1.test(checkPwd)){
				$("#pwd_info").text("사용할 수 없는 비밀번호 입니다.").css("color","red");
			}else{
				$("#pwd_info").text("사용할 수 있는 비밀번호 입니다.").css("color","green");
			}
		})
		
		$("#m_pwd2").blur(function(){
			//비밀번호 정규식
			console.log($("m_pwd").val());
			if($("#m_pwd2").val()!=$("#m_pwd").val()){
				$("#pwd2_info").text("비밀번호가 맞지 않습니다.").css("color","red");
			}
			else{
				$("#pwd2_info").text("");
			}
		})
	})
	
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
			    	  $("#memberInsertForm").submit();
			      }
		}
	
</script>
<section class="section section-login">
	<div class="container">
		<div>
			<div id="register" class="login-box">
				<div class="account-input-box">
					<h1 class="text-center">회원가입</h1>
					<div>
					<form id="memberInsertForm" method="post" action="memberInsert.do">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="100" />
							<col width="30" />
							<col />
						</colgroup>
							<tr>
								<td align="right"> 이름</td>
								<td></td>
								<td>
									<input type="text" name="m_name"size="15" class="input-box"/>
								</td>
							</tr>
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
							<tr><td colspan="3" class="text-center"><span>공백 없는 영문 또는 숫자 6-20자</span></td></tr>
							<tr><td colspan="3" class="text-center"><span id="pwd_info"></span></td></tr>
							<tr><td height="14"></td></tr>
							<tr>
								<td align="right"> 비밀번호확인</td>
								<td></td>
								<td><input type="password" id="m_pwd2" class="input-box"/></td>
							</tr>
							<tr><td colspan="3" class="text-center"><span>비밀번호 확인을 위해 한번 더 입력하세요</span></td></tr>
							<tr><td colspan="3" class="text-center"><span id="pwd2_info"></span></td></tr>
							<tr><td height="14"></td></tr>
						<tr><td height="14"></td></tr>
						</table>
					</div>
					</form>
					<div class="btnWrap">
						<div class="btn btn-outline readmore" onclick="validate();">가입</div>
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