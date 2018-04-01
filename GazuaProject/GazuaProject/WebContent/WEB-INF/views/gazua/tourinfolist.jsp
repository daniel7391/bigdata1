<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
	<%@ include file="/assets/css/tourinfolist.css" %>
</style>

	<%@ include file="/WEB-INF/inc/common.jsp" %>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
</header>

<div class="container" style="margin-top: -10px;">
	<div class="search-process">
        <h5>추천여행지 > "경복궁" 검색결과</h5>
    </div>
		
	<!-- 글 목록 시작 -->
	
	<c:choose>
		<c:when test="${fn:length(tourInfoList) > 0}">
			<c:forEach var="place" items="${tourInfoList}">
				<div class="media">
					<div class="pull-left">
						<c:url var="readUrl" value="/place/place_read.do">
							<c:param name="tourInfo_id" value="${tourinfo.id}" />
						</c:url>
						<a href="${readUrl}">
							<c:choose>
								<c:when test="${tourinfo.imagePath != null}">
									<c:url var="downloadUrl" value="/download.do">
										<c:param name="file" value="${tourinfo.imagepath}" />
									</c:url>
									<img src="${downloadUrl}" class="media-object" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/assets/img/no_image.jpg" class="media-object"/>
								</c:otherwise>
							</c:choose>
						</a>
					</div>
					<div class="media-body">
				            <!-- 내용의 제목 -->
				            <a href="place.html" style="color: black; position: relative; top: 12px;"><h3 class="media-heading"><span class="glyphicon glyphicon-camera"></span><strong> "${place.name}"</strong></a><span class="rating">
				                    <button class="btn like pull-right" id="like" style="height: 45px;">좋아요! (<span class="likes">${tourinfo.likes}</span>)</button>
				                </span></h3>
				            <!-- 내용 -->
				            <br />
				            <a href="place.html" style="color: gray;"><h5 class="summary">${tourinfo.intro}</h5></a>
				            <br />
				            <h5 class="post"><span class="glyphicon glyphicon-list-alt"></span> 68개의 포스트 - ${tourinfo.addr1}</h5>
				 
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
        
	<!--// 글 목록 끝 -->

	<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
		
</div>
</body>
</html>



