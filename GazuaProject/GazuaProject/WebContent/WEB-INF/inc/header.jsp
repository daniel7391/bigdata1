<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="container">
	<a href="${pageContext.request.contextPath}/gazua/main.do">
		<img src="../assets/img/logo.png" />
	</a>
	<c:choose>
		<c:when test="${loginInfo != null}">
			<div class="pull-right">
				<!-- 로그인 된 경우 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						style="padding:5px;">
						<!-- 쿠키값에 따른 프로필 이미지 표시 끝 -->
						${loginInfo.member_name2}님 <span class="caret"></span>
						</a>
					</li>
				</ul>
			</div>
		</c:when>
	</c:choose>
</div>
<div class="navbar navbar-inverse navbar-static-top" role="navigation">
	<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">메뉴열기</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/gazua/tourinfolist.do">추천여행지</a></li>
				<li><a href="${pageContext.request.contextPath}/gazua/plan.do">여행 일정 만들기</a></li>
				<li><a href="${pageContext.request.contextPath}/gazua/">여행 후기</a></li>
			</ul>
		</div>
		<div class="input-group">
			<select name="subject" id="subject">
				<option value="">--- 지역구 선택 ---</option>
				<c:choose>
					<c:when test="${fn:length(tourList) > 0}">
						<c:forEach var="tour" items="${tourList}">
							<option value="${tour.tourCode}">${tour.tourLocation_gu}</option>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="text-center" style="line-height: 100px;">
								조회된 지역구가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</select>
			<input type="text" class="form-control">
			<div class="input-group-btn">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</div>
	</div>
</div>
