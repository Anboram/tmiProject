<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>TMI</title>
	
</head>
<body>
	<div id="totalWrap">
	<c:import url="common/header.jsp" />
		<section class="section landing">
		<div class="container">
			<div class="title">
				오늘의  TMI를 알려주세요!
			</div>
			<h5>매일 다른 질문이 올라옵니다.</h5>
			<button class="btn btn-lg">확인하기</button>
		</div>
	</section>
	
	<section class="section section-index">
		<div class="container">
			<div class="contentWrap">
				<div class="cont">
					<div class="search-box">
						<div class="search-input-box">
							<input type="text" placeholder="키워드를 검색하세요" class="keyword">
							<div class="svg-wrapper"><img src="/tmi/resources/images/search.png" class="search-council svg"></div>
						</div>
					</div>
					<div class="content-wrapper">
						<div>
							<div class="content council-history">
								<span class="right bookmark pointer bookmark-empty"></span>
								<div>
									<div class="info-wrapper border">
										<strong class="h5">Q</strong>
										<span class="h6">질문</span>
									</div>
									<p class="date"></p>
								</div>
								<ul class="content-reply">
									<li class="reply">
										<div class="text">
											<p>A</p>
										</div>
									</li>
									
								</ul>
							</div>
						</div>
						<div class="btn btn-outline readmore">
									더보기</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="common/footer.jsp" />
	</div>
</body>
</html>
