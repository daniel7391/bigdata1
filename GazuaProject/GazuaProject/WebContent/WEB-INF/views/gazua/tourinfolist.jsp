<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
    .container {
        width: 1030px;
    }
    .media {
        border: 1px solid #DDD;
        height: 200px;
    }
    #like {
        position: relative;
        height: 20px;
        background: white;
        border: 0.5px solid gainsboro;
        width: 120px;
    }
    .media-object {
    	height: 200px;
    	width: 250px;
    }
    .media-body h5 {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .post {
        color: #999;
    }
    .glyphicon-camera {
        color: #2b2;
    }
    .summary {
        width: 615px;
    }
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
			<c:forEach var="tourInfo" items="${tourInfoList}">
				<div class="media">
					<div class="pull-left">
						<c:url var="readUrl" value="/gazua/placeinfo.do">
							<c:param name="id" value="${tourInfo.id}" />
						</c:url>
						<a href="${readUrl}">
							<img src="${tourInfo.imagePath}" class="media-object" />							
						</a>
					</div>
					<div class="media-body">
				            <!-- 내용의 제목 -->
				            <c:url var="readUrl" value="/gazua/placeinfo.do">
								<c:param name="id" value="${tourInfo.id}" />
							</c:url>
				            <a href="${readUrl}" style="color: black; position: relative; top: 12px;"><h3 class="media-heading"><span class="glyphicon glyphicon-camera"></span><strong> "${tourInfo.name}"</strong></h3></a><span class="rating">
				                    <button class="btn like pull-right" id="like" style="height: 45px;">좋아요! (<span class="likes">${tourInfo.likes}</span>)</button>
				                </span>
				            <!-- 내용 -->
				            <br />
				            <a href="tourInfo.html" style="color: gray;"><h5 class="summary">${tourInfo.intro}</h5></a>
				            <br />
				            <h5 class="post"><span class="glyphicon glyphicon-list-alt"></span> 68개의 포스트 - ${tourInfo.addr1}</h5>
				 
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
        
	<!--// 글 목록 끝 -->

	<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
	<%@ include file="/WEB-INF/inc/bbs_list_bottom.jsp" %>	
		
</div>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>



