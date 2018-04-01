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
			<div class="input-group-btn">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				어디에서
				
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">강남구</a></li>
					<li><a href="#">강북구</a></li>
					<li><a href="#">강서구</a></li>
				</ul>
			</div>
			<input type="text" class="form-control">
			<div class="input-group-btn">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</div>
	</div>
</div>
