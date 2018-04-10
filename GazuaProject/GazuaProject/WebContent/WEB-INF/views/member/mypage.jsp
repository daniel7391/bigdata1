<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
	<%@ include file="/assets/css/common.css" %>
	.media-object {
		width: 300px;
		height: 180px;
	}
</style>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/inc/header.jsp" %>
	</header>
	<section>
		<div class="container" style="margin-top: -50px;">
			<div class="page-header">
				<a href="${pageContext.request.contextPath}/member/out.do" class="btn btn-danger btn-md pull-right">회원 탈퇴</a>
				<h1>마이페이지</h1>
			</div>
			<!-- /.modal-dialog -->
			<!-- /.modal -->
				<table>
					<tr>
						<td colspan="2">
							<img src="../assets/img/100.jpg" class="img-circle" width="50">
							<a href="UserMod.html" class="btn btn-primary btn-md
							pull-right">
								정보 수정</a>
						</td>
					</tr>
					<tr>
						<td><h5>닉네임</h5> </td>
					</tr>
				</table>
		</div>
		<div class="container">
			<h3>내가 만든 일정</h3>
			<!-- 데스크탑: 한 줄에 4개, 태블릿: 한 줄에 2개 씩 배치되도록 그리드 구성 -->
			<div class="row">
				<!-- 게시물 하나 시작 -->
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img alt="엔틱 자전거 - my wish list" src="../assets/img/img1.jpg">
						<div class="caption">
							<h4>엔틱 자전거</h4>
							<p>my wish list~!!</p>
						</div>
					</div>
				</div>
				<!-- 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img alt="느낌 아니까!!" src="../assets/img/img2.jpg">
						<div class="caption">
							<h4>느낌 아니까!!</h4>
							<p>추워도 핫팬츠를 입는 센스!!</p>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img alt="그림자놀이" src="../assets/img/img3.jpg">
						<div class="caption">
							<h4>그림자놀이</h4>
							<p>마음을 담아서...</p>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
				<!-- 게시물 하나 시작 -->
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img alt="캐리비안의 해적" src="../assets/img/img4.jpg">
						<div class="caption">
							<h4>캐리비안의 해적</h4>
							<p>보물찾기 대장정</p>
						</div>
					</div>
				</div>
				<!--// 게시물 하나 끝 -->
			</div>
		</div>
		<div class="container">
			<ul class="pagination" style="margin-left: 380px;">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<li class="active"><span>1 <span class="sr-only">(current)</span>
				</span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
			<div class="container" style="padding-left: 0px;">
				<div class="page-header">
					<h3>북마크 메뉴</h3>
				</div>

				<!-- 웹진과 같은 형태로 구성되는 태그 구조 입니다. -->
				<div class="media">
					<!-- 이미지 왼쪽 배치 -->
					<a class="pull-left" href="#"> <img class="media-object" src="../assets/img/thumb1.jpg" alt="도심의 야경"> </a>
					<!-- 내용영역 -->
					<div class="media-body">
						<!-- 내용의 제목 -->
						<h5 class="media-heading">63빌딩의 야경</h5>
						<br />
						<!-- 내용 -->
						노을이 지는 도심의 야경은 정말 아름답습니다. 특히 붉은 빛을 내뿜는 모습은 인류의 문명사회를 한눈에 볼 수 있어요!
						<br />
						다른 나라를 여행중에 야경을 만난다면, 우리나라에서는 볼 수 없는 이국적인 모습에 흠뻑 취해 볼 수 도 있습니다.
					</div>
				</div>

				<hr />

				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object" src="../assets/img/thumb2.jpg" alt="초원 위의 집"> </a>
					<div class="media-body">
						<h5 class="media-heading">경기도 민속촌</h5>
						<br />
						누구나 한번쯤은 어느 유명 가수의 노래 가사처럼 '초원 위의 그림 같은 집'을 꿈꿔봤을 겁니다.
						어쩌면 '초원 위의 그림 같은 집'에 사는 것을 인생의 마지막 목표로 삼고, 오늘 하루도 열심히 일하면서 살아가는 이들도 많을 텐데요.
						요즘 갑갑한 아파트를 벗어나 탁 트인 자연 속에서 자신만의 '그림 같은 집'을 꾸리고자 하는 분들이 늘어나고 있습니다.
					</div>
				</div>
			</div>
			<br />
			<div id="content">
				<div id="sidebar">
				<h3>최근 조회한 일정, 장소</h3>
				<address>
			        <ul>
			          <li><a href="http://www.itpaper.co.kr">코엑스 아쿠아리움</a></li>
			          <li><a href="http://www.itpaper.co.kr">[1박 2일] 남자 친구랑...</a></li>
			          <li><a href="http://www.itpaper.co.kr">63빌딩에서 내려다보니...</a></li>
			        </ul>
	      	  </address>
	    	</div>
		</section>
	</body>
</html>
