<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
   <%@ include file="/WEB-INF/inc/common.jsp" %>
   
   <style type="text/css">
      <%@ include file="/assets/css/common.css" %>
      <%@ include file="/assets/css/plan.css" %>
      .modal-backdrop{
         display:none;
      }
   </style>
</head>

<body>
    <header>
       <%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    <section>
       <!-- 여행제목 시작 -->
       <div class="container">
         <div class="planHeader">
            <div class="jumbotron" id="title">
               <h1><span id="planname">일정 제목</span></h1>
               <button type="button" class="btn btn-warning" id="title_edit">수정</button>
            </div>
         </div>
         <div class="planBody">
      <!-- 여행제목 끝 -->
      
      <!-- 검색창 시작 -->
      <%@ include file="/WEB-INF/inc/planLeft.jsp" %>
      <!-- 게시물 작성 시작 -->
      
      <!-- 여행 주요 목록 시작 -->
      <div class="planRight">
         <div>
            <div class="passData" style="width: 100%; height: 300px; background-color: #eee;">
               <input type="text" class="first form-control" placeholder="여행 간단 소개" style="height: 50px;">
               <input type="text" class="second form-control" placeholder="여행 일정 소개">
                  <div class="form-group">
                     <label for="startDate">여행시작일</label>
                     <input type="date" class="form-control" id="startDate" style="height: 24px;">
                  </div>
                  <div class="form-group">
                     <label for="days">일</label>
                     <input type="text" class="form-control" id="days" placeholder="여행 일수" style="width: 80px">
                  </div>
                  <div class="form-group">
                     <label for="people">명</label>
                     <input type="text" class="form-control" id="people" placeholder="여행 인원" style="width: 80px">
                  </div>
                  <div class="form-group" id="theme">
                     <label for="theme">여행테마</label>
                     <button type="button" class="btn btn-default active" id="1">나홀로 여행</button>
                     <button type="button" class="btn btn-default" id="2">친구와 함께</button>
                     <button type="button" class="btn btn-default" id="3">가족과 함께</button>
                     <button type="button" class="btn btn-default" id="4">연인과 함께</button>
                  </div>
            </div>
            <div class="tab">
               <div class="tab-button clearfix form-control" style="text-align:center;">
                  일정 및 스토리
               </div>
               <div class="tab-panel">
                  <div id="tab-page-1">
                     <div class="tab-pane active" id="map">
                        <!-- gmap -->
                        <div id="gmap"></div>
                        
                        <!-- 여행 일정 -->
                        <div style="background:#eee;">
                           <ul id="plan_list_start">
                              
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
<!-- 여행 주요 목록 끝 -->

<!-- 게시물 작성 끝 -->
         </div>
      </div>
    </section>
<!-- modal_1 시작 -->
<div class="modal fade" id="myModal">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">제목 수정</h4>
         </div>
         
         <div class="modal-body">
            <input type="text" class="form-control" id="title_edit_modal"/>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-warning" 
               data-dismiss="modal">Cancle</button>
            <button type="button" class="btn btn-success"
               data-dismiss="modal" id="title_edit_ok">OK</button>
         </div>
      </div>
   </div>
</div>
<!-- modal_1 끝 -->

<!-- modal_2 시작 -->
<div class="modal fade" id="myModal_second">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="modal-title"></h4>
         </div>
         
         <div class="modal-body">
            <label>시작 날짜</label>
            <input type="date" class="form-control" id="plan_list_date"/>
            <br/>
            <label>시간</label>
            <input type="time" class="form-control" id="plan_list_time"/>
            <br/>
            <label>내용</label>
            <textarea class="form-control" id="plan_list_modal" style="max-width:100%;"></textarea>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-warning" 
               data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-success"
               data-dismiss="modal" id="plan_list_ok">OK</button>
         </div>
      </div>
   </div>
</div>
<!-- modal_1 끝 -->
    <script type="text/javascript">
   $(function() {
   // gmap
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
        
        // 여행지 검색창
        
        
        $("#sidebar").ajaxForm(function(json){
        });
        // 여행지 검색창 끝
        
        // 타이틀제목 변경
        $("#title_edit").click(function(){
           
           $("#myModal").modal('show');
         $("#title_edit_ok").click(function(){
              $("#planname").html($("#title_edit_modal").val());
              
           });
         
        });
        
     
        // 여행지 추가미션
         $(".planbtn").click(function(){
            
           $("#myModal_second").modal('show');
           
           $("#plan_list_ok").click(function(){
              var val = "<li><h3><strong> * ";
              val += $("#plan_list_date").val();
              val += "</strong></h3><h4>   ";
              val += $("#plan_list_time").val();
              val += "</h4>";
              val += $("#plan_list_modal").val();
            val += "</li>";
              
              $("#plan_list_start").append(val);
              
           });
         });
        
        //테마 버튼 설정
        $("#theme .btn").click(function(e){
           e.preventDefault();
           
           $("#theme .btn").not(this).removeClass("active");
           
           $(this).addClass("active");
        });
    });
   
   var Test ={};
   
   </script>

    <script id="tmpl_result" type="text/x-handlebars-template">
      <li class="media" id="plan_list_{{id}}">
           <a class="pull-left" href="#"><img src="{{imagePath}}" width="60" height="60" align="Generic placeholder image"></a>
           <div class="media-body">
               <div class="clearfix">
                    <h5 class="media-heading pull-left">{{name}}</h5>
                    <p>
                    {{intro}}
                    </p>
                </div>
            </div>
            <div class="pull-right" style="padding-top:30px;">
               <button type="button" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></button>
            </div>
       </li>
   </script>
</body>

</html>