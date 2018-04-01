<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="container">
	<div class="planHeader">
		<div class="jumbotron">
			<h1>일정 제목</h1>
			<p><a class="btn btn-warning btn-sm" role="button">수정</a></p>
		</div>
	</div>
	<div class="planBody">
		<%@ include file = "/WEB-INF/inc/planSearch.jsp" %>
		<div class="planRight">
			<div>
				<div class="passData" style="width: 100%; height: 300px; background-color: #eee;">
					<input type="text" class="first" placeholder="여행 간단 소개" style="height: 50px;">
					<input type="text" class="second" placeholder="여행 일정 소개">
						<div class="form-group">
							<label for="start">여행시작일</label>
							<input type="date" style="height: 24px;">
						</div>
						<div class="form-group">
							<label>일</label>
							<input type="text" placeholder="여행 일수" style="width: 80px">
						</div>
						<div class="form-group">
							<label>명</label>
							<input type="text" placeholder="여행 인원" style="width: 80px">
						</div>
						<div class="form-group">
							<label>여행테마</label>
							<button type="button" class="btn btn-default">나홀로 여행</button>
							<button type="button" class="btn btn-default">친구와 함께</button>
							<button type="button" class="btn btn-default">가족과 함께</button>
							<button type="button" class="btn btn-default">연인과 함께</button>
						</div>
				</div>
				<div class="tab">
					<ul class="tab-button clearfix">
						<li class="tab-button-item pull-left">
							<a class="tab-button-item-link selected" href="#tab-page-1">일정 및 스토리</a>
						</li>
					</ul>
					<div class="tab-panel">
						<div id="tab-page-1">
							<div class="tab-pane active" id="map">
								<div id="gmap"></div>
	
								<div style="background:#eee;">
									<ul>
										<li>
											<h3><strong> * 2018.04.02</strong></h3>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
