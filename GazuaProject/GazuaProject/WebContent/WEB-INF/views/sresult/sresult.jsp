<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	 <style type="text/css">
	 	<%@ include file="/assets/css/common.css" %>
	 	<%@ include file="/assets/css/SResult.css" %>
     </style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/inc/header.jsp" %>
	</header>
	<section>
	<div class="container" style="margin-top: -10px;">
            <div class="search-process">
                <h5>추천여행지 > "경복궁" 검색결과</h5>
            </div>
    <c:choose>
    	<c:when test="${fn:length(tourinfoList)>0}">
    		<c:forEach var="tourinfo" items="${tourinfo}">
    			<div class="media">
                <!-- 이미지 왼쪽 배치 -->
                <a class="pull-left" href="place.html"><img class="media-object" src="../assets/img/KyungMini.jpg" alt="경복궁"></a>
                <!-- 내용영역 -->
                <div class="media-body pull-left">
                    <!-- 내용의 제목 -->
                    <a href="place.html" style="color: black; position: relative; top: 12px;">
                    	<h3 class="media-heading">
                    	<span class="glyphicon glyphicon-camera"></span>
                    	<strong> ${tourinfo.name}</strong>
                    	</h3>
                    </a>
                    <!-- 내용 -->
                    <br />
                    <a href="place.html" style="color: gray;">
                    	<h5 class="summary">
							${tourinfo.intro}
                   		</h5>
                   	</a>
                    <br />
                    <h5 class="post"><span class="glyphicon glyphicon-list-alt"></span> 68개의 포스트 - 한국 ${tourinfo.addr1}</h5>
                </div>
				<button class="btn like pull-right" id="like" style="height: 45px; margin: 45px 0 0 20px;">
				좋아요! (<span class="likes">${tourinfo.likes}</span>)
				</button>
           		</div>
    		</c:forEach>
    		<c:otherwise>
    			<div>
    				<a>skdfsadf</a>
    			</div>
    		</c:otherwise>
    	</c:when>
    </c:choose>
            
            
        </div>
	</section>
</body>
</html>
