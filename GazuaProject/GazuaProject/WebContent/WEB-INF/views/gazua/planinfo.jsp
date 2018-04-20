<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		/* btn-ttc라는 사용자 정의 버튼 만들기
		 -------------------------------------------------- */
		/* 버튼의 기본 텍스트 색상, 기본배경, 마우스오버, 클릭시 배경색상 정의 */
          body {
         }
         
         /** 캐러셀의 높이와 하단 여백 확보 */
         .titlebar {
             height: 200px;
         }
         
         /** 캐러셀 내부의 이미지에 대한 높이와 넓이 확보 */
         .carousel-inner > .item {
             height: 200px;
         }
         
         .box1 img {
         	width: 1114px;
         	height: 200px;
         }
         
         /** 캐러셀 내부 내용 영역에 대한 배경 색상과 좌우 여백 확보 */
         .carousel-inner .carousel-caption {
             background-color: rgba(0,0,0,0.5) !important;
             padding-left: 30px;
             padding-right: 30px;
         }
         .box2{
             background-color: white;
             height: 250px;
             width: 200px;
             border-radius: 10px;
         }
         
         .main{
             background-color: #EBEBEB;
         }
         .box3{
             width: 200px;
             background-color: #EBEBEB;
             padding:8px 1px 1px 1px;
         }
         .container{
             width: 1030px !important;
         }

         .btn-ttc:hover, .btn-ttc:active {
            color: orange;
         }

         /* 기본 배경 색상 정의 - gradient 색상을 적용할 수도 있다. */
         .btn-ttc {
             background-color: white;
             width: 96px;
              border:1px solid #EBEBEB;
              color:gray;
         }

         /* 마우스 올렸을 때, 약간의 위치 이동효과 */
         .btn-ttc:hover {
             background-position: 0 -15px;
         }
         .box4{
             width: 192px;
         }
            .btn-ttc:hover, .btn-ttc:active {
            color: orange;
         }

         /* 기본 배경 색상 정의 - gradient 색상을 적용할 수도 있다. */
         .btn-ttc2 {
             background-color: white;
             width: 198px;
              border:1px solid #EBEBEB;
              color:gray;
              margin-top: 2px;
         }

         /* 마우스 올렸을 때, 약간의 위치 이동효과 */
         .btn-ttc:hover {
             background-position: 0 -15px;
         }
         .profile{
             
         }
         .box5{
             width:100%;
             min-height: 150px;
             margin-top: 8px;
             background-color: white;
             border-radius: 10px;
             
             }
         .sidebar{
              padding:8px 1px 1px 1px;
         }
         .box5 .subtit{
             font-size: 20px;
              padding:20px  20px;
         }
          .box5 .submain{
             font-size: 15px;
              padding:  20px;
         }
         .tabbar{
             margin-left: 20px;
              padding:20px 1px 1px 1px;
              width:95%;
         }
         .navbar-default{
             background-color: orange;
         }

		.content {
			float:left;
			padding-left: 15px;
			width:80%;
		}

		/* 방문하지 않은 링크 */
		.tabbar .nav li a:link{
		  color: black;
		  background-color: white;
		}
		/* 방문한 링크 */
		.tabbar .nav li a:hover{
		  color: orange;
		  background-color: white;
		}
		/* 링크를 활성화 할 때 */
		.tabbar .nav li a:active{
		  color: orange;
		}
		.comment{
           margin-left: 20px;
           padding:50px 1px 1px 1px;
           width:95%;
		}
		.tab-content .tab-pane img{
			width: 95%;
          	margin-left: 20px;
            padding:20px 1px 1px 1px;
		}
		
		.comment,.by-current-user{
		    padding-top:0px;
		}
		.box2 img {
			width: 100px;
		}
		.modal-backdrop {
       		display: none;
       	}
       	.story {
       		background : white;
       		height: 60px;
       		vertical-align: center;
       	}
       	.img-box {
       		background : white;
       	}
</style>
			
<%@ include file="/WEB-INF/inc/common.jsp" %>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
</header>

<!-- 내용물 컨테이너 시작-->
    <div class="main col-md-12">
        <div class="container">
        	<!-- 제목 틀 시작-->
        <div class="box1">
         <div id="carousel-example-generic" class="titlebar">
         

            <!-- 내용 영역 -->
            <div class="carousel-inner">
                <!-- 항목 (1) -->
                <div class="item active">
                    <img src="${readPhoto.dir}" alt="배경사진">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>${readTourPlan.name}</h1>  
                            	${readTourPlan.people}명                          
                            	<c:choose>
                            		<c:when test="${readTourPlan.theme==4}">
                            			/ 가족과 함께
                            		</c:when>
                            		<c:when test="${readTourPlan.theme==3}">
                            			/ 연인과 함께
                            		</c:when>
                            		<c:when test="${readTourPlan.theme==2}">
                            			/ 친구와 함께
                            		</c:when>
                            		<c:otherwise>
                            			/ 혼자서
                            		</c:otherwise>
                            	</c:choose>
                            	/ ${readTourPlan.days}일동안
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- 제목 틀 끝-->
        <!-- 사이드 바 시작-->
        <div class="sidebar" style="float:left;width: 20%">
        <!-- 프로필 시작-->
        <div class="box2">
              <div class="profile" style="text-align: center;">
              	<img src="${pageContext.request.contextPath}/gazua/download.do?file=${readMember.member_profile_img}" class="img-circle" style=" height:100px; margin-top:20px;" />
              </div>
              <div style="text-align: center;">
              
              <h3>${readMember.member_name2}</h3> 
              <br>
              <div style="color: orange">
              <h5>야스오 장인</h5>
            </div>

               </div>         
            </div>
            <!-- 프로필 끝-->
              <!-- 버튼 시작-->
        <form class="box3" method="post" action="${pageContext.request.contextPath}/gazua/likes_ok3.do">
        	<input type="hidden" name="plan_id" value="${readTourPlan.id}" />
	        <button type="submit" class="btn btn-ttc "><span class="glyphicon glyphicon-thumbs-up"></span><span class="goodnum">${readTourPlan.likes}</span> <div>추천</div> </button>
	        
	        <c:url var="readUrl" value="/gazua/tourinfolist2.do">
				<c:param name="plan_id" value="${readTourPlan.id}" />
			</c:url>
	        <a href="${readUrl}" data-toggle="modal" data-target="#tourinfolist2_modal" class='btn btn-ttc'>
	        <span class="glyphicon glyphicon-flag"></span><span class="booknum">${planIdCount}</span><br/>방문명소</a>
       	</form>
       	<div class="modal fade" id="tourinfolist2_modal">
       		<div class="modal-dialog modal-lg">
       			<div class="modal-content">
       			</div>
       		</div>
       	</div>
          <!-- 버튼 끝--> 
        </div>
          <!-- 사이드 바 끝-->

          <!-- 메인 컨탠트 시작-->
        <div class="content" style="float:left;width: 80%">
               <!-- ㅇ내용 요약 시작-->
             <div class="box5">
                <br>
                <span class="subtit"><strong>${readTourPlan.intro}</strong></span>
                <br>
                <span class="submain">${readTourPlan.intro_main}</span>
               
             </div>
               <!-- 내용 요약  끝-->
                 <!-- 메인 컨텐츠 시작(중훈이 폼 부분이라 이미지 대체했습니다)-->
             <div class="story">
                <h3><span class="glyphicon glyphicon-tasks "></span>스토리</h3>
    		 </div>  
            	    <!-- 내비 바  끝-->

           
            <div class="storylist">
                <c:choose>
					<c:when test="${fn:length(readPhotoTourInfoList) > 0}">
						<c:forEach var="phototourinfo" items="${readPhotoTourInfoList}">
							<!-- 사진 배치 -->
							<h3><strong><span class="glyphicon glyphicon-camera"></span>${phototourinfo.tourname}</strong></h3>
							<div class="img-box" align="center">
				            	
								<img src="${phototourinfo.dir}" style="width:785px; height:600px;"/>	
								<!-- 사진의 제목 -->
				            	<!-- 내용 -->
				            	<h5>${phototourinfo.contents}</h5>						
							</div>
							<br/>
						</c:forEach>
					</c:when>
				</c:choose>
            </div>
            
           
           		  <!-- 버튼 끝-->
        </div>
    </div>
</div>


   
<!-- Javascript -->
        
<script type="text/javascript">
	  
</script>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>



