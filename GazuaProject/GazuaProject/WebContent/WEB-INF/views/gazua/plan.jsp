<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	<script type="text/javascript">
	$(function() {
        /** 표시할 위치에 대한 위도,경도 */
        var lat_value = 37.500674;
        var lng_value = 127.026683;

        /** 지도 표시하기 */
        var map = new GMaps({
            el: '#gmap',        // 지도를 표시할 div의 id값.
            lat: lat_value,     // 지도가 표시될 위도
            lng: lng_value,     // 지도가 표시될 경도
            zoomControl: true   // 줌 컨트롤 사용 여부
        });

        $(document).on("click", ".add", function(){
            var item = $(this).parents('.item');
            var clone = item.clone();
            clone.insertAfter(item);
        });

        $(document).on("click", ".remove", function(){
            $(this).parents(".item").remove();
        });


        $(".tab-button-item-link").click(function(e){
            e.preventDefault();

            $(".tab-button-item-link").not(this).removeClass("selected");

            $(this).addClass("selected");

            var target = $(this).attr('href');
            $(target).removeClass('hide');
            $(".tab-panel > div").not($(target)).addClass("hide");
        });

    });
	</script>
	<style type="text/css">
		<%@ include file="/assets/css/common.css" %>
		<%@ include file="/assets/css/plan.css" %>
	</style>
</head>

<body>
    <header>
    	<%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    <section>
    	<div class="container">
			<div class="planHeader">
				<div class="jumbotron">
					<h1>일정 제목</h1>
					<p><a class="btn btn-warning btn-sm" role="button">수정</a></p>
				</div>
			</div>
			<div class="planBody">
			
				<%@ include file="/WEB-INF/inc/planLeft.jsp" %>
				
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
    </section>
</body>

</html>