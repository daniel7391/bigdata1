<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">방문 명소 리스트</h4>
	</div>
	<div class="modal-body">
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
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
