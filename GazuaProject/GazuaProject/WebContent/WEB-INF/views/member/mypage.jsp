<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
<%@ include file ="/assets/css/common.css" %> 
.media-object {
	width: 300px;
	height: 180px;
}

.container {
	width: 1030px !important;
}
</style>
<%@ include file="/WEB-INF/inc/common.jsp"%>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/inc/header.jsp"%>
	</header>
	<section>
		<div class="container" style="margin-top: -50px;">
			<div class="page-header">
				<a href="${pageContext.request.contextPath}/member/out.do"
					class="btn btn-danger btn-md pull-right">회원 탈퇴</a>
				<h1>마이페이지</h1>
			</div>
			<!-- /.modal-dialog -->
			<!-- /.modal -->

			<!-- /.modal -->
			<div class="row">
				<tr>
					<td colspan="2">
						<img src="${pageContext.request.contextPath}/gazua/download.do?file=${cookie.profileThumbnail.value}" class="img-circle" style="height: 100px; margin-top: 20px;" />
						<a href="${pageContext.request.contextPath}/member/edit.do" class="btn btn-primary btn-md pull-right">정보 수정</a>
						<h5>${readMember.member_name2}</h5>
					</td>
				</tr>
			</div>
		</div>
		<div class="container">
			<div class="page-header">
				<h3>내가 만든 일정</h3>
			</div>
			<!-- 데스크탑: 한 줄에 4개, 태블릿: 한 줄에 2개 씩 배치되도록 그리드 구성 -->
			<div class="row">
				<!-- 게시물 하나 시작 -->
				<c:choose>
					<c:when test="${fn:length(tourPlanJoinList) > 0}">
						<c:forEach var="tourPlanJoin" items="${tourPlanJoinList}">
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
									<c:url var="readUrl" value="/gazua/planinfo.do">
										<c:param name="id" value="${tourPlanJoin.id}" />
									</c:url>
									<a href="${readUrl}"><img src="${tourPlanJoin.imagePath}"></a>
									<div class="caption">
										<a href="${readUrl}">
											<h4>${tourPlanJoin.name}</h4>
										</a>
										<p>${tourPlanJoin.intro}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!--  페이지네이션 시작-->
		<div class="row text-center">
			<%@ include file="/WEB-INF/inc/mypage_paging.jsp"%>
		</div>
		<div class="container" style="padding-left: 0px;">
			<div class="page-header">
				<h3>내가 리뷰한 관광장소(최근 4개의 장소까지)</h3>
			</div>
			<!-- 웹진과 같은 형태로 구성되는 태그 구조 입니다. -->
			<c:choose>
				<c:when test="${fn:length(tourInfoJoinList) > 0}">
					<c:forEach var="tourInfoJoin" items="${tourInfoJoinList}">
						<div class="media">
							<div class="pull-left">
								<c:url var="readUrl" value="/gazua/placeinfo.do">
									<c:param name="id" value="${tourInfoJoin.id}" />
								</c:url>
								<a href="${readUrl}"> <img src="${tourInfoJoin.imagePath}"
									class="media-object" />
								</a>
							</div>
							<div class="media-body">
								<!-- 내용의 제목 -->
								<c:url var="readUrl" value="/gazua/placeinfo.do">
									<c:param name="id" value="${tourInfoJoin.id}" />
								</c:url>
								<a href="${readUrl}" style="color: black; position: relative; top: 12px;">
									<h3 class="media-heading">
										<span class="glyphicon glyphicon-camera"></span><strong>
											"${tourInfoJoin.name}"</strong>
									</h3></a><span class="rating"> </span>
								<!-- 내용 -->
								<br />
								<a href="tourInfo.html" style="color: gray;">
								<h5 class="summary">${tourInfoJoin.intro}</h5></a>
								<br />
								<h5 class="post">
									<span class="glyphicon glyphicon-list-alt"></span> 68개의 포스트 -
									${tourInfoJoin.addr1}
								</h5>

							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<br />
	</section>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>

