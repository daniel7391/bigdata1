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
          
          .contentsform{
       		background:white;
       		font-size:20px;
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
                   <c:if test="${readMember.member_profile_img != null}">
              <img src="${pageContext.request.contextPath}/gazua/download.do?file=${readMember.member_profile_img}" class="img-circle" style=" height:100px; margin-top:20px;" />
              </c:if>
              <c:if test="${readMember.member_profile_img == null}">
               <img src="${pageContext.request.contextPath}/assets/img/nullprof.png" class="img-circle" style=" height:100px; margin-top:20px;" />
           </c:if>
              </div>
              <div style="text-align: center;">
              
              <h3>${readMember.member_name2}</h3> 
              <br>
              <div style="color: orange">
              <h5> </h5>
            </div>

               </div>         
            </div>
            <!-- 프로필 끝-->
           
        <c:choose>
           <c:when test="${loginInfo.member_id == readTourPlan.member_id}">
              <form class="box3" method="post" action="${pageContext.request.contextPath}/plan/tourplan_delete_ok.do">
                 <input type="hidden" name="plan_id" value="${readTourPlan.id}" />
                 <button type="submit" class="btn btn-default btn-danger" style="width:100%">
                    여행일정삭제
                 </button>
              </form>
           </c:when>
        </c:choose>    
        
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
            
                   <!-- 내비 바  끝-->

           
            <div class="storylist">
              
                <c:choose>
					<c:when test="${fn:length(readPhotoTourInfoList) > 0}">
						<c:forEach var="phototourinfo" items="${readPhotoTourInfoList}">
							<!-- 사진 배치 -->
							<h3><strong><span class="glyphicon glyphicon-camera"></span>${phototourinfo.tourname}</strong></h3>
								<div style="text-align:right">${fn:substring(phototourinfo.date, 0, 16)}</div>
							<div class="img-box" align="center">
				            	
								<img src="${phototourinfo.dir}" style="width:785px; height:600px;"/>	
								<!-- 사진의 제목 -->
				            	<!-- 내용 -->
				            
				            	
				            </div>
				            
				            	
				            	
				            <div class=contentsform>
				            	<p  style="text-align:left;" >${phototourinfo.contents}</p>				
							</div>	
							<br/>
						</c:forEach>
					</c:when>
				</c:choose>
				 
            </div>
            
            <form id="comment_form" method="post" 
                  action="${pageContext.request.contextPath}/gazua/CommentInsertPlan">
                  <!-- 글 번호 상태 유지 -->
                  <input type='hidden' name='tourPlan_id' value='${readTourPlan.id}' />
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
                   <!-- 버튼 끝-->
        </div>
    </div>
</div>


   
<!-- Javascript -->
        
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
   
   
   
   <script type="text/javascript">
   $(function() {
      /** 페이지가 열리면서 동작하도록 이벤트 정의 없이 Ajax요청 */
      $.get("${pageContext.request.contextPath}/gazua/CommentListPlan", {
         tourPlan_id: "${readTourPlan.id}"
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
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>


