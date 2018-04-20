<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
            *{
                list-style: none;
            }
            body{
                padding-top: 0px;
                padding-bottom: 20px;
            }
            #content-box .summary {
                margin-top: 10px;
                margin-left: -9px;
                width: 700px;
            }
            #content-box .summary > h3 {
                margin-top: 2px;
                padding-top: 2px;
            }
            .photo {
                margin-left: -9px;
                width: 700px;
                height: 500px;
            }
            .container {
		        width: 1030px !important;
		    }
            .status {
                background: white;
                width: 270px;
                margin-top: 10px;
                margin-left: 3px;
                position: relative;
                right: -9px;
                height: 602px;
            }
            #back {
                background: #EBEBEB;
                margin-top: -20px;
            }
            .nav-tabs {
                background: white;
            }
            .review {
                padding-top: 0;
                background: white;
            }
            #review-box {
                margin-top: 20px;
                width: 1000px;
                background: white;
            }
            .summary {
                height: 60px;
                background: white;
            }
            .summary .btn {
                position: relative;
                left: 580px;
                bottom: 60px;
                width: 100px;
                height: 50px;
            }
            .filterLabel {
                 height: 20px;
                 position: relative;
                 right: 20px;
            }
            #gmap { width: 700px; height: 500px; background: black;}
            #like {
                background: white;
                border: 0.5px solid gainsboro;
            }
            #entry {
                position: relative;
                
            }
            #summary {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            p {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .status p {
                color: #888;
            }
        
        }
        

        </style>
<%@ include file="/WEB-INF/inc/common.jsp" %>

</head>
<body>
	<header>
		<%@ include file="/WEB-INF/inc/header.jsp" %>
	</header>
	<section>
	<div class="container">
        <!-- 본문 영역 -->
        <div id="back">
            <form class="container" id="contents" action="${pageContext.request.contextPath}/gazua/likes_ok.do" style="position:relative;">
            	<input type="hidden" name="tour_id" value="${readTourInfo.id}" />
                <div class="content-box pull-left" id="content-box">
                    <div class="summary">
                        <h3>&nbsp;<strong>${readTourInfo.name}</strong></h3>
                        <p id="summary" style="width: 550px; color: #888">&nbsp;&nbsp;${readTourInfo.intro}</p>
                        <div id="rating">
                            <button type="submit" class="btn like" id="like" style="height: 45px;">좋아요! (<span class="likes">${readTourInfo.likes}</span>)</button>
                        </div>
                    </div>
                    <div class="photo" style="width: 700px;">
                        <div class="tab-content">
                            <div class="tab-pane" id="picture">
                                <!-- 캐러셀 영역 구성 -->
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- 현재 위치 표시 -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                    </ol>

                                    <!-- 내용 영역 -->
                                    <div class="carousel-inner">
                                        <!-- 항목 (1) -->
                                        <div class="item active">
                                            <img src="${readPhoto.dir}" alt="슬라이더(1)">
                                        </div>

                                        <!-- 항목 (2) -->
                                        <div class="item">
                                            <img src="${readPhoto.dir}"alt="슬라이더(2)">
                                        </div>

                                        <!-- 항목 (3) -->
                                        <div class="item">
                                            <img src="${readPhoto.dir}" alt="슬라이더(3)">
                                        </div>
                                    </div>
                                    <!-- // 내용영역 구성 -->

                                    <!-- 이동 버튼 -->
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
                                </div>
                                <!-- 캐러셀 영역 끝 -->
                            </div>

                            <div class="tab-pane active" id="map">
                                <div id="gmap"></div>
                            </div>
                        </div>
                        <!-- 탭 메뉴 시작 -->
                        <ul class="nav nav-tabs">
                            <li><a href="#picture" data-toggle="tab">사진</a></li>
                            <li class="active"><a href="#map" data-toggle="tab">지도</a></li>
                        </ul>
                    </div>
                </div>
                <div class="status pull-left">
                    <h3>&nbsp;&nbsp;<strong>기본정보</strong></h3>
                    <hr />
                    <h5>&nbsp;&nbsp;<strong>주소</strong></h5>
                    <p>&nbsp;&nbsp;${readTourInfo.addr1}<br/>&nbsp;&nbsp;${readTourInfo.addr2}</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>비용</strong></h5>
                    <p>&nbsp;&nbsp;3000원(만 24세 이하, 65세 이상 무료)</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>가는 방법</strong></h5>
                    <p>&nbsp;&nbsp;아몰랑</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>휴무</strong></h5>
                    <p>&nbsp;&nbsp;${readTourInfo.holiday1}</p>
                </div>
            </form>

            <div class="container" id="review-box">
                <form class="review clearfix" action="${pageContext.request.contextPath}/gazua/review_ok.do">
                	<input type="hidden" name="tour_id" value="${readTourInfo.id}" />
                    <h3><strong>리 뷰</strong></h3>
                    <div class="like-review pull-left form-group" style="width:300px;">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem clearfix">

                                    <span class="toggle pull-left">
                                        <label><input type="radio" name="filterRating1" value="4" class="filterInput"/>&nbsp;아주 좋음</label>
                                    </span>
                                    <label class="filterLabel pull-right" style="width: 60%;">
                                        
                                        <div class="progress pull-left" style="width: 80%;  border: 1px solid black; height: 15px; margin-top: 5px;">
                                            <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                            <div class="progress-bar pro1 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                                <span class="sr-only">40% Complete</span>
                                            </div>
                                        </div>
                                        <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.verygood}</span>
                                    </label>

                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating1" value="3" class="filterInput" />&nbsp;좋음</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro2 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.good}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating1" value="2" class="filterInput" />&nbsp;보통</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro3 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.soso}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
	                                <label>
	                                    <input type="radio" name="filterRating1" value="1" class="filterInput" />&nbsp;별로
	                                </label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro4 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.bad}</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="people-review pull-left form-group" style="width:300px;">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating2" value="4" class="filterInput" />&nbsp;가족</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro5 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.family}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating2" value="3" class="filterInput" />&nbsp;커플</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro6 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.couple}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating2" value="2" class="filterInput" />&nbsp;친구</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro7 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.friend}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating2" value="1" class="filterInput" />&nbsp;혼자</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro8 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.solo}</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="season-review pull-left form-group" style="width:300px;">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                   <label><input type="radio" name="filterRating3" value="4" class="filterInput" />&nbsp;3~5월</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro9 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.spring}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating3" value="3" class="filterInput" />&nbsp;6~8월</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro10 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.summer}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating3" value="2" class="filterInput" />&nbsp;9~11월</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro11 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.autumn}</span>
                                </label>
                            </li>
                            <li class="filterItem clearfix">
                                <span class="toggle pull-left">
                                    <label><input type="radio" name="filterRating3" value="1" class="filterInput" />&nbsp;12~2월</label>
                                </span>
                                <label class="filterLabel pull-right" style="width: 60%;">
                                    
                                    <div class="progress pull-left" style="width: 80%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pro12 pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">0% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;${reviewSupport.winter}</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="form-group">
                    	<button type="submit" id="entry" class="btn btn-primary" >리뷰등록</button>
                    </div>
                </form>

                <h3><strong>댓 글</strong></h3>

                <form id="comment_form" method="post" 
				      action="${pageContext.request.contextPath}/gazua/CommentInsert">
				      <!-- 글 번호 상태 유지 -->
				      <input type='hidden' name='tour_id' value='${readTourInfo.id}' />
				      <!-- 작성자,비밀번호,이메일은 로그인하지 않은 경우만 입력한다. -->
				      
				      <!-- 내용입력, 저장버튼 -->
				      <div class='form-group'>
				         <div class="input-group">
				            <textarea class="form-control custom-control" name='content' 
				               style="resize:none; height: 80px"></textarea>     
				            <span class="input-group-btn">
				               <button type="submit" class="btn btn-success" 
				                  style="height: 80px">저장</button>
				            </span>
				         </div>
				      </div>
				      <ul class="media-list" id="comment_list">
				      </ul>
				   </form>

                <h3><strong>이 명소가 포함된 인기 여행일정</strong></h3>
                <hr />

                <div class="row">
                    <!-- 게시물 하나 시작 -->
                    <c:choose>
		             	<c:when test="${fn:length(readPhotoJoinList) > 0}">
		               		<c:forEach var="readPhotoJoin" items="${readPhotoJoinList}">
			                    <div class="col-sm-6 col-md-4">
			                    	<c:url var="readUrl" value="/gazua/planinfo.do">
										<c:param name="id" value="${readPhotoJoin.tourPlan_id}" />
									</c:url>
			                        <a href="${readUrl}" style="color: black;">
			                            <div class="thumbnail">
			                                <img src="${readPhotoJoin.dir}">
			                                    <h3><strong>${readPhotoJoin.planname}</strong></h3>
			                                    <p>${readPhotoJoin.intro}</p>
			                            </div>
			                        </a>
			                    </div>
	                    	</c:forEach>
	                    </c:when>
                    </c:choose>
                    <!-- 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                
                    
                </div>

            </div>
        </div> <!-- back end -->

	<%@ include file="/WEB-INF/inc/footer.jsp" %>
	
	 <script id="tmpl_comment_item" type="text/x-handlebars-template">
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' id="comment_{{comment_id}}">
        <div class="media-body" style='display: block;'>
            <h4 class="media-heading clearfix">
                <!-- 작성자,작성일시 -->
                <div class='pull-left'>
                    {{comment_user_name}}
                    <small>
                      
                       {{reg_date}}
                    </small>
               </div>
                <!-- 수정,삭제 버튼 -->
                <div class='pull-right'>
                    <a href='${pageContext.request.contextPath}/gazua/CommentEdit?comment_id={{comment_id}}' data-toggle="modal" data-target="#comment_edit_modal" class='btn btn-warning btn-xs'>
                        <i class='glyphicon glyphicon-edit'></i>
                    </a>
                    <a href='${pageContext.request.contextPath}/gazua/CommentDelete.do?comment_id={{comment_id}}' data-toggle="modal" data-target="#comment_delete_modal" class='btn btn-danger btn-xs'>
                        <i class='glyphicon glyphicon-remove'></i>
                    </a>
                </div>
            </h4>
            <!-- 내용 -->
            <p>{{{content}}}</p>
        </div>
    </li>
	</script>
			
			<div class="modal fade" id="comment_delete_modal">
			  <div class="modal-dialog ">
			    <div class="modal-content">
			   
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="comment_edit_modal">
			  <div class="modal-dialog ">
			    <div class="modal-content">
			   
			    </div>
			  </div>
			</div>
        
        <!-- Javascript -->
        
        <script type="text/javascript">
            $(function(){

                var counter = [[${reviewSupport.verygood},${reviewSupport.good},${reviewSupport.soso},${reviewSupport.bad}],
                			[${reviewSupport.family},${reviewSupport.couple},${reviewSupport.friend},${reviewSupport.solo}],
                			[${reviewSupport.spring},${reviewSupport.summer},${reviewSupport.autumn},${reviewSupport.winter}]];
				
                var sum1 = counter[0][0] + counter[0][1] + counter[0][2] + counter[0][3];
                var sum2 = counter[1][0] + counter[1][1] + counter[1][2] + counter[1][3];
                var sum3 = counter[2][0] + counter[2][1] + counter[2][2] + counter[2][3];
               
              
                $(".like-review .progress-bar").attr('aria-valuemax', sum1);
                $(".people-review .progress-bar").attr('aria-valuemax', sum2);
                $(".season-review .progress-bar").attr('aria-valuemax', sum3);
                   
                $(".pro1").attr('style', 'width:'+ (counter[0][0]/sum1*100)+'%;');
                $(".pro2").attr('style', 'width:'+ (counter[0][1]/sum1*100)+'%;');
                $(".pro3").attr('style', 'width:'+ (counter[0][2]/sum1*100)+'%;');
                $(".pro4").attr('style', 'width:'+ (counter[0][3]/sum1*100)+'%;');
                $(".pro5").attr('style', 'width:'+ (counter[1][0]/sum1*100)+'%;');
                $(".pro6").attr('style', 'width:'+ (counter[1][1]/sum1*100)+'%;');
                $(".pro7").attr('style', 'width:'+ (counter[1][2]/sum1*100)+'%;');
                $(".pro8").attr('style', 'width:'+ (counter[1][3]/sum1*100)+'%;');
                $(".pro9").attr('style', 'width:'+ (counter[2][0]/sum1*100)+'%;');
                $(".pro10").attr('style', 'width:'+ (counter[2][1]/sum1*100)+'%;');
                $(".pro11").attr('style', 'width:'+ (counter[2][2]/sum1*100)+'%;');
                $(".pro12").attr('style', 'width:'+ (counter[2][3]/sum1*100)+'%;');
               

                /** 표시할 위치에 대한 위도,경도 */
                var lat_value = ${readTourInfo.y};
                var lng_value = ${readTourInfo.x};

                /** 지도 표시하기 */
                var map = new GMaps({
                    el: '#gmap',        // 지도를 표시할 div의 id값.
                    lat: lat_value,     // 지도가 표시될 위도
                    lng: lng_value,     // 지도가 표시될 경도
                    zoomControl: true   // 줌 컨트롤 사용 여부
                });

                /** 표시중인 위치에 마커 추가 */
                // 필요한 만큼 반복하면 마커가 여러 개 표시된다.
               map.addMarker({
                // 마우스 오버시 노란 박스
                title: '${readTourInfo.name}',
                lat: lat_value,		// 마커가 표시될 위도
                lng: lng_value,		// 마커가 표시될 경도
                icon: {				// 사용자 정의 아이콘
                    url: "../assets/img/marker3.png",
                    scaledSize: new google.maps.Size(15, 15)
                	},
                
            	});
                
               $.get("${pageContext.request.contextPath}/gazua/CommentList", {
                   tour_id: "${readTourInfo.id}"
                }, function(json) {
                   if (json.rt != "OK") {
                      alert(json.rt);
                      return false;
                   }
                   
                   // 템플릿 HTML을 로드한다.
                   var template = Handlebars.compile($("#tmpl_comment_item").html());
                   
                   // JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
                   // --> 정규표현식 /~~~/g는 문자열 전체의 의미.
                   for (var i=0; i<json.item.length; i++) {
                      json.item[i].content 
                         = json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");
                      
                      // 덧글 아이템 항목 하나를 템플릿과 결합한다.
                      var html = template(json.item[i]);
                      // 결합된 결과를 덧글 목록에 추가한다.
                      $("#comment_list").append(html);
                   }
                });
                
                /** 덧글 작성 폼의 submit 이벤트 Ajax 구현 */
                // <form>요소의 method, action속성과 <input>태그를
                // Ajax요청으로 자동 구성한다.
                $("#comment_form").ajaxForm(function(json) {
                   // json은 API에서 표시하는 전체 데이터
                   if (json.rt != "OK") {
                      alert(json.rt);
                      return false;
                   }

                   // 줄 바꿈에 대한 처리
                   // --> 정규표현식 /~~~/g는 문자열 전체의 의미.
                   // --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
                   json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
                   
                   // 템플릿 HTML을 로드한다.
                   var template = Handlebars.compile($("#tmpl_comment_item").html());
                   // JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
                   var html = template(json.item);
                   // 결합된 결과를 덧글 목록에 추가한다.
                   $("#comment_list").append(html);
                   // 폼 태그의 입력값을 초기화 하기 위해서 reset이벤트를 강제로 호출
                   $("#comment_form").trigger('reset');
                });
                
                
                   
                  
                $(document).on('submit', "#comment_delete_form", function(e) {
                   e.preventDefault();

                   // AjaxForm 플러그인의 강제 호출
                   $(this).ajaxSubmit(function(json) {
                      if (json.rt != "OK") {
                         alert(json.rt);
                         return false;
                      }
                      
                      alert("삭제되었습니다.");
                      // modal 강제로 닫기
                      $("#comment_delete_modal").modal('hide');
                      
                      // JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
                      var commentId = json.comment_id;
                      $("#comment_" + commentId).remove();
                   });
                });
                
                $('.modal').on('hidden.bs.modal', function (e) {
                   // 모달창 내의 내용을 강제로 지움.
                    $(this).removeData('bs.modal');
                });
         
                
                
                
                
                
                $(document).on('submit', "#comment_edit_form", function(e) {
                   e.preventDefault();
                   
                   // AjaxForm 플러그인의 강제 호출
                   $(this).ajaxSubmit(function(json) {
                      if (json.rt != "OK") {
                         alert(json.rt);
                         return false;
                      }
                      
                      // 줄 바꿈에 대한 처리
                      // --> 정규표현식 /~~~/g는 문자열 전체의 의미.
                      // --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
                      json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
                      
                      // 템플릿 HTML을 로드한다.
                      var template = Handlebars.compile($("#tmpl_comment_item").html());
                      // JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
                      var html = template(json.item);
                      // 결합된 결과를 기존의 덧글 항목과 교체한다.
                      $("#comment_" + json.item.id).replaceWith(html);
                      
                      // 덧글 수정 모달 강제로 닫기
                      $("#comment_edit_modal").modal('hide');
                      history.go(0);
                   });
                });
                


            });
            

            
        </script>
		</div>
	</section>
</body>
</html>



