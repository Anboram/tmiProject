<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TMI</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<c:import url="../common/header.jsp" />
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$(function(){
			
		//글의번호 -> 댓글 부모 번호 
		$("#a_q_no").val(parseInt($("#currentNo").val()));
		//자기가 쓴 댓글일때 색 변경
		if($("#a_m_no").val()=="${sessionScope.user.m_no}"){
			$(".replyDiv").attr('class','myReply');
		}
		
	    $("#calendarIcon").datepicker({
	    	//날짜 선택시 이벤트 발생
	    	onSelect: function (dateText,inst){
	    		var t1 =dateText.substr(0,2);
	    		var t2=dateText.substr(3,2)
	    		
	    		var date = t1+"-"+t2;
	    		
	    		//선택한 날짜에 해당되는 질문과 답변 가져옴
	    		location.href="selectDateBoard.do?selectDate="+date;
	    	}
	    });
	    
	    $("#prevIcon").click(function(){
	    	var prevNo =parseInt($("#currentNo").val())-1;
	    	
			if(prevNo <=0){
	    		prevNo=365;
	    	}
			//번호로 앞뒤 이동
			location.href="selectNoBoard.do?q_no="+prevNo;
	    	
	    })
	    
	    $("#nextIcon").click(function(){
	    	var nextNo =parseInt($("#currentNo").val())+1;
	    	
			if(nextNo >365){
				nextNo=1;
	    	}
			//번호로 앞뒤 이동
			location.href="selectNoBoard.do?q_no="+nextNo;
	    	
	    })
	    
	    $("#privateIcon").click(function(){
	    	 var src = ($(this).attr("src") == "/tmi/resources/images/private.png")
	            ? "/tmi/resources/images/private2.png" 
	            : "/tmi/resources/images/private.png"; 
	         $(this).attr("src", src); 
	         
	         //비공개일때
	         if(src="/tmi/resources/images/private2.png"){
	        	 $("#a_privateflag").val("Y");
	         }else{
	        	 $("#a_privateflag").val("N");
	         }
	         
	    })
	    
	    //수정해야할것
	    $(".replyA").mouseover(function(){
	    	console.log($(this).prevAll(".over").text());
	    	$(this).prevAll(".over").toggle();
	    })
	});
	</script>
	<section class="section">
		<div class="container">
			<div class="calendar">
			<input type="image" src="/tmi/resources/images/calendar.png" id="calendarIcon" style="width:50px; height:50px; cursor:pointer;"/>
			</div>
			<c:forEach items="${bList}" var="bList">
				<h1 style="text-align:center;">
				<fmt:formatDate value="${bList.q_date}" pattern="MM월dd일"/>
			</h1>
			<div class="boardBox">
			<div class="prev box">
				<input type="image" src="/tmi/resources/images/prev.png" id="prevIcon" style="width:150px; height:270px; cursor:pointer;"/>
				<input type="hidden" id="currentNo" value="<c:out value='${bList.q_no }' ></c:out>">
			</div>
				<div class="qBox box">
					<h1>Q.<c:out value="${bList.q_question }"></c:out></h1>
				</div>
			<div class="next box">
				<input type="image" src="/tmi/resources/images/next.png" id="nextIcon" style="width:150px; height:270px; cursor:pointer;"/></div>
			</div>
			</c:forEach>
			
			<form name="insertReply" id="insertReply" method="post" action="insertReply.do">
			<div class="replyBox">
				<table style="width:100%;">
			<colgroup>
				<col width="10%" />
				<col width="70%" />
				<col width="10%" />
				<col width="5%" />
				
			</colgroup>
				
			<%-- <c:if test="${!empty sessionScope.user }"> --%>
				<tr>
					<td colspan="4">
						<img src="/tmi/resources/images/private.png" id="privateIcon" name="a_privateflag">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="a_answer" class="answerArea" name="a_answer" ></textarea>
						<input type="hidden" name="a_m_no" value="${sessionScope.user.m_no }" />
						<input type="hidden" name="a_q_no"  id="a_q_no"/>
						<input type="hidden" name="a_privateflag" id="a_privateflag" value="N"/>
						
					</td>
					<td colspan="1" >
					<!-- ajax로 댓글 입력할것 -->
						<button type="submit" class="btn">입력</button>
					</td>
				</tr>				
			<%-- </c:if> --%>
				
				<c:forEach items="${rList }" var="rList">
				<table class="replyDiv" style="width:100%;">
					<colgroup>
					<col width="5%" />
					<col width="70%" />
					<col width="10%" />
					<col width="15%" />
					</colgroup>
				<tr class="reply">
					<td colspan="1">익명</td>
					<td colspan="2" id="date"><fmt:formatDate value="${rList.a_writedate}" pattern="YYYY.MM.dd"/></td>
					<c:if test="${rList.a_m_no eq sessionScope.user.m_no}">
					<td colspan="1" class="over" style="display:none">삭제</td>
					</c:if>
					<c:if test="${rList.a_m_no ne sessionScope.user.m_no}">
					<td colspan="1" class="over" style="display:none">신고</td>
					</c:if>
				</tr>
				<tr class="replyA">
					<td colspan="4">${rList.a_answer}
					<input type="hidden" name="a_no" value="${rList.a_no }"/>
					<input type="hidden" id="a_m_no" name="a_m_no" value="${rList.a_m_no }"/>
					<input type="hidden" name="a_q_no" value="${rList.a_q_no }"/>
					<input type="hidden" name="a_delflag" value="${rList.a_delflag }"/>
					<input type="hidden" name="a_privateflag" value="${rList.a_privateflag }"/>
					</td>
					
				</tr>
				</table>
				</c:forEach>
				
		</table>
			</div>
			</form>
		</div>
	</section>
	<c:import url="../common/footer.jsp" />
</body>
</html>