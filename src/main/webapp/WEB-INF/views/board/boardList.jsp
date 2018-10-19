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
	    	var prevNo =$(this).siblings('input').val()-1;
	    	
			if(prevNo <=0){
	    		prevNo=365;
	    	}
			//번호로 앞뒤 이동
			location.href="selectNoBoard.do?q_no="+prevNo;
	    	
	    })
	    
	    $("#nextIcon").click(function(){
	    	var nextNo =$(this).siblings('input').val()-1;
	    	
			if(nextNo >365){
				nextNo=1;
	    	}
			//번호로 앞뒤 이동
			location.href="selectNoBoard.do?q_no="+nextNo;
	    	
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
				<input type="hidden" value="<c:out value='${bList.q_no }'></c:out>">
			</div>
				<div class="qBox box">
					<h1>Q.<c:out value="${bList.q_question }"></c:out></h1>
				</div>
			<div class="next box">
				<input type="image" src="/tmi/resources/images/next.png" id="nextIcon" style="width:150px; height:270px; cursor:pointer;"/></div>
				<input type="hidden" value="<c:out value='${bList.q_no }'></c:out>">
			</div>
			</c:forEach>
			<div class="replyBox"><p>answer구역</p></div>
		</div>
	</section>
	<c:import url="../common/footer.jsp" />
</body>
</html>