<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
	*{
                padding: 0;
                margin: 0;
            }
            body{
                padding-top: 0px;
                padding-bottom: 20px;
            }
            .container{
                width: 1030px;
            }
            .media-object {
              width: 200px;
              height: 170px;
            }
            .btn-box{
              position: relative;
              top: 10px;
              background: black;
            }
            section .plandBody{
                width: 200px;
                background-color: #eee;
            }
            section .jumbotron{
                text-align: center;
            }
            section .jumbotron h1, p{
                display: inline-block;
            }
            section .btn-group{
                padding-bottom: 10px;
            }
            section .btn-group button{
                width: 100px;
            }
            section .container li{
                list-style: none;
                width: 100%;

            }
            section .planLeft{
                vertical-align: top;
                border: 2px solid #eee;
                width: 29%;
                background-color:#eee;
                display: inline-block;
            }
            section .planRight{
                border: 2px solid #eee;
                width: 70%;
                display: inline-block;
                padding: 0;
                margin: 0;
            }
            section .sidebar{
                width: 100%;
                display: inline-block;
            }
            section .sidebar .btn-group{
                width: 100%;
            }
            section .sidebar .btn-group button{
                width: 50%;
            }
            section li {
                padding: 2px;
            }
            section ul li input{
                width: 100%;
            }
            section .planRight div div{
                display: inline-block;
            }
            section .planRight .first{
                width: 100%;
            }
            section .planRight .second{
                width: 100%;
                height: 150px;
                margin-top: 2px;
            }
            section .planRight .third{
                display: inline-block;
            }
            .pull-left{float: left; border: 2px solid #eee}
            .clearfix:after{content: ''; display: block; float: none; clear: both;}
            .hide{display: none;}

            .tab{width:100%; margin: 20px auto;}
            section .tab li {width: 50%; padding: 0; margin: 0;}
            section .tab .tab-panel{
                width: 100%;
            }
            .tab-button-item{width: 100px; height: 40px;}

            .tab-button-item-link .selected{
                background: url("img/tab_selected.jpg");

            }

            .tab-button-item-link{
                background: url("img/tab.jpg") width:100%;
                display: block;
                color: #222;
                line-height: 40px;
                text-align: center;
                text-decoration: none;
            }

            .tab-panel{
                border: 1px solid #9FB7D4;
                position: relative;
                top: -1px;
                padding: 20px 10px;
                width: 100%;
                height: 100%;
            }
            .tab-panel .tab-page-1{
                width: 100%;
                height: 100%;
            }
            .tab-panel .tab-page-2{
                width: 100%;
                height: 100%;
            }

            .tab-button{
                position: relative;
                z-index: 10;
            }
            section .form-group{
                padding: 10px 5px 0px 5px;
                margin: 0;
            }

            #gmap { width: 674px; height: 400px; }

            section table{
                width: 100%;
                border: 1px solid #d5d5d5;
                border-collapse: collapse;
            }
            section th, td{
                border: 1px solid #d5d5d5;
                width: 20%;
                text-align:center;
            }
            section th{
                border: 1px solid #d5d5d5;
                background-color: #444;
                padding: 5px 0;
                color: #eee;
                width: 20%;
                text-align:center;
            }
            section .input{
                padding: 5px 0;
                text-align: center;
                border: 0;
                width: 100%;
                display: block;
            }
            section .DayPlan{
                width: 674px;
                border: 0.8px solid #ccc;
            }

            section .sidebar .searchResult{
                padding-top: 10px;
            }
            section .sidebar .searchResult .media{
                border: 1px solid #fff;
            }
            section .sidebar .result img{
                width: 100px;
                height: 100px;
                padding-bottom: 10px;
            }
            section .sidebar .media-body{
                display: inline-block;
            }
            section .sidebar .media-body .clearfix{
                width: 170px;
            }
            
            .modal-backdrop {
       		display: none;
       		}
	<%@ include file="/assets/css/tourinfolist.css" %>
</style>

<%@ include file="/WEB-INF/inc/common.jsp" %>
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
                <p>
                    <a class="btn btn-warning btn-sm" role="button">수정</a>
                </p>
            </div>
        </div>
        
        <div class="planBody">
             <div class="planLeft">
                 <div class="sidebar">
                     <div class="btn-group">
                         <button type="submit" class="btn btn-default save">저장하기</button>
                         <button type="button" class="btn btn-default cancel">취소</button>
                     </div>
                     <div>
                         <ul>
                             <li>
                                 <button type="button" class="btn btn-default" style="width: 100%;">방문 명소</button>
                             </li>
                             <li>
                                 <input type="text" placeholder="지역구로 검색">
                             </li>
                             <li>
                                 <input type="text" placeholder="여행지명으로 검색">
                             </li>
                             <li>
                                 <button type="button" class="btn btn-warning" style="width: 100%">검색</button>
                             </li>
                         </ul>
                     </div>
                     <div class="searchResult">
                         <ul class="media-list">
                         	<c:choose>
								<c:when test="${fn:length(tourInfoList) > 0}">
									<c:forEach var="tourInfo" items="${tourInfoList}">
			                             <li class="media">
			                             	<c:url var="readUrl" value="/gazua/placeinfo.do">
												<c:param name="id" value="${tourInfo.id}" />
											</c:url>
											
			                                 <a class="pull-left" href="${readUrl}">
			                                 	<img src="${tourInfo.imagePath}" width="60" height="60" align="Generic placeholder image">
			                                 </a>
			                                 <div class="media-body">
			                                     <div class="clearfix">
			                                         <h4 class="media-heading pull-left">${tourInfo.name}</h4>
			                                         <p>
			                                         	${tourInfo.intro}
			                                         </p>
			                                     </div>
			                                 </div>
			                                 <c:url var="readUrl2" value="/gazua/place_input.do">
												 <c:param name="tour_id" value="${tourInfo.id}" />
											 </c:url>
			                                 <div class="pull-right" style="padding-top:30px;">
			                                         <a href="${readUrl2}" data-toggle="modal" data-target="#place_input_modal" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></a>
			                                 </div>
			                                 <div class="modal fade" id="place_input_modal">
									       		<div class="modal-dialog modal-md">
									       			<div class="modal-content">
									       			</div>
									       		</div>
									       	</div>
			                             </li>
                             		</c:forEach>
                             	</c:when>
                             </c:choose>
                         </ul>
                     </div>
                 </div>
             </div>

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
                 </div>
             </div>
             <div>
             	<h1>${placeDate}</h1>
             </div>
	</div>
</section>	
        
	<!--// 글 목록 끝 -->

	<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
		

</body>
</html>



