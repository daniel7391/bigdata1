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
      
      div .form-group{
       padding-left: 30px;
      }
      
      .theme {
       margin-right: 10px;
      }
      
      .media-body h5 {
      	white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .media-body p {
      	white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
   </style>
</head>

<body>
    <header>
       <%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    <section>
        <div class="container">
      <form class="form-horizontal" method="post" enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/plan/tourplan_write_ok.do">
      <div style="display:none">
			<input type="submit" onclick="return false;" />
			<input type="text"/>
		</div>
      <div class="btn-group">
          <button type="submit" class="btn btn-default btn-success save">저장하기</button>
          <button type="button" class="btn btn-default cancel">취소</button>
       </div>
            
      <!-- 여행제목 시작 -->
           <div class="planHeader">
            <div class="jumbotron" id="title">
                  <input class="hidden" id="plan_name" name="planname">
               <p><h1 id="planname">일정 제목</h1>
               <button type="button" class="btn btn-warning" id="title_edit">수정</button>
                </div>
             </div>
        <!-- 여행제목 끝 -->
      
      <!-- 여행지 오른쪽 -->
      <div class="planRight pull-right">
            <div class="passData" style="width: 100%; height: 300px; background-color: #eee;">
               <input type="text" id="intro" class="first form-control" name="intro" placeholder="여행 간단 소개" style="height: 50px;">
                <textarea class="second form-control" name="intro_main"  placeholder="여행 일정 소개"></textarea>
                <div class="form-group">
                   <label for="startDate">여행시작일</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" style="width: 165px; height: 24px;">
                </div>
                <div class="form-group">
                    <label for="days">여행(일)</label>
                    <input type="text" class="form-control" id="days" name="days" placeholder="여행 일수" style="width: 85px;height: 24px;">
                </div>
                <div class="form-group">
                    <label for="people">인원(명)</label>
                    <input type="text" class="form-control" id="people" name="people" placeholder="여행 인원" style="width: 85px; height: 24px;">
                </div>
                <div class="form-group" id="theme">
                    <label for="theme" class="theme">여행테마</label> 
                    <label><input type='radio' id="solo" name='theme'  value="1">&nbsp;나홀로 여행</label>
                     <label><input type='radio' name='theme' value="2">&nbsp;친구와 함께</label>
                    <label><input type='radio' name='theme' value="4">&nbsp;가족과 함께</label>
                   <label><input type='radio' name='theme' value="3">&nbsp;연인과 함께</label>
                </div>
                 <div class="tab">
                     <div class="tab-button clearfix form-control" style="text-align:center;">
                     일정 및 스토리
                     </div>
                  <div class="tab-panel">
                   <div id="tab-page-1">
                       <div class="tab-pane active" id="map">
                        <!-- gmap -->
                           
                           <!-- 여행 일정 -->
                             <div style="background:white; width:100%;" >
                                <button type="button" id="addplanbtn" class="btn btn-success hidden" style="width:100%;" >여행지추가...</button>
                              <ul id="plan_list_start">
                              </ul>
                          </div>
                       </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- //여행지 오른쪽 -->
   </form>
     <%@ include file="/WEB-INF/inc/planLeft.jsp" %>

      
      
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
               data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-success"
               data-dismiss="modal" id="title_edit_ok">OK</button>
         </div>
      </div>
   </div>
</div>

<!-- modal_3 시작 -->
<div class="modal fade" id="myModal_third">
   <div class="modal-dialog modal-lg" style="width:800px;">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="modal-title"></h4>
         </div>
         
         <div class="modal-body">
            <input type="hidden" id="plan_list_tourinfo_id" value=""/>
            <label>시작 날짜</label>
            <input type="date" class="form-control" id="plan_list_date"/>
            <br/>
            <label>시간</label>
            <input type="time" class="form-control" id="plan_list_time" />
            <br/>
            <label>내용</label>
            <textarea class="form-control" id="plan_list_modal" cols="3" rows="10" wrap="hard"></textarea>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-warning" 
               data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-success"
               data-dismiss="modal" id="plan_list_edit_ok">OK</button>
         </div>
      </div>
   </div>
</div>
<!-- modal_3 시작 -->
    <script type="text/javascript">
   $(function() {
	   // 오류가 있을 시 타이틀 제목 input hidden 데이터를 가져온다
	   if($("#plan_name").val()!=""){
           $("#planname").html($("#plan_name").val());
        }
	  
	   $("#intro").keyup(function(d) {
	       	if(d.keyCode == 13) {
	       		$(".second").focus();
	       	}
       });
	   
	   $("#startDate").keyup(function(d) {
	       	if(d.keyCode == 13) {
	       		$("#days").focus();
	       	}
       });

	   $("#days").keyup(function(d) {
	       	if(d.keyCode == 13) {
	       		$("#people").focus();
	       	}
       });

	   $("#people").keyup(function(d) {
	       	if(d.keyCode == 13) {
	       		$("#solo").focus();
	       	}
       });
	   
     	// 여행지 검색창
        $("#sidebar").ajaxForm(function(json){
        });
        // 여행지 검색창 끝
        
        // 타이틀제목 변경
        $("#title_edit").click(function(){
			$("#myModal").modal('show');
         	$("#title_edit_ok").click(function(){
            	$("#planname").html($("#title_edit_modal").val()); // 보여지는 화면의 타이틀제목 변환
            	$("#plan_name").val($("#title_edit_modal").val()); // 숨겨진 타이틀 제목 저장 -> DB에 들어감
            });
        });
        
        var plan_sc={};
        var num = 0;
        //테마 버튼 설정
        $("#theme .btn").click(function(e){
           e.preventDefault();
           
           $("#theme .btn").not(this).removeClass("active");
           
           $(this).addClass("active");
        });
        
        
        // 리스트 수정
        var edit_plan = {};
        $(document).on("click", "#plan_edit", function(e){
           e.preventDefault();
           $("#myModal_third").modal('show');
           
           // $(this) <-- 버튼 기준
           // $(this).parents() <-- 버튼을 감싸는 부모 : 리스트 하나
           // 목록 데이터를 가져옴
           var edit_target_id          = $(this).parents().attr('id');
           var edit_num             = edit_target_id.substring(10, 11);
           var edit_plan_date         = $(this).parents().children().eq(8).val();
           var edit_plan_time          = $(this).parents().children().eq(9).val();
           var edit_plan_title       = $(this).parents().children().eq(10).val();
           var edit_plan_contents       = $(this).parents().children().eq(11).val();
           var edit_plan_planInfo_id    = $(this).parents().children().eq(12).val();
           
           edit_plan_contents = edit_plan_contents.replace(/(?:\r\<br>|\r|\<br>)/g, '\n');
           
           // 다른 기능으로 들어갈때 필요
           var edit_ok = $(this);
           
           var temp2 = Handlebars.compile($("#tmpl_plan_edit").html());
           
            $("#myModal_third .modal-header #modal-title").html(edit_plan_title);
            $("#myModal_third .modal-body #plan_list_date").val(edit_plan_date);
            $("#myModal_third .modal-body #plan_list_time").val(edit_plan_time);
            $("#myModal_third .modal-body #plan_list_modal").val(edit_plan_contents);
            
            $("#plan_list_edit_ok").click(function(){
               $("#plan_list_edit_ok").unbind('click');
               
               edit_plan.plan_date = $("#myModal_third .modal-body #plan_list_date").val();
               edit_plan.plan_time = $("#myModal_third .modal-body #plan_list_time").val();
               edit_plan.plan_name = edit_plan_title;
               edit_plan.plan_contents = $("#myModal_third .modal-body #plan_list_modal").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
               edit_plan.planInfo_id = edit_plan_planInfo_id
               edit_plan.num = edit_num;
               
               $('#' + edit_target_id).html(temp2(edit_plan));
               
            });
        });
        
        
     
    });
   
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
   
   <script id="tmpl_searching" type="text/x-handlebars-template">
      <li class="plan_list_{{num}}" id="plan_list_{{num}}">
         <hr> 
		<div>
            <h3><strong> * {{plan_date}}</strong></h3>
            <h4>{{plan_time}}</h4>
         </div> 
         <div>{{plan_name}}</div>
         <button type="button" id="plan_edit" class="btn btn-warning glyphicon glyphicon-edit">수정</button>
         <button type="button" id="plan_delete" class="btn btn-danger glyphicon glyphicon-remove">삭제</button>
         <br/>
		 <div  id="content" style="width:100%">{{{plan_contents}}}</div>
		 <hr>
      	 <input type="hidden" name="plan_list_{{num}}_1" id="plan_list_{{num}}_1" value="{{plan_date}}">
       	 <input type="hidden" name="plan_list_{{num}}_2" id="plan_list_{{num}}_2" value="{{plan_time}}">
      	 <input type="hidden" name="plan_list_{{num}}_3" id="plan_list_{{num}}_3" value="{{plan_name}}">
      	 <input type="hidden" name="plan_list_{{num}}_4" id="plan_list_{{num}}_4" value="{{{plan_contents}}}">
      	 <input type="hidden" name="plan_list_{{num}}_5" id="plan_list_{{num}}_5" value="{{planInfo_id}}">
      </li>
   </script>
   
   <script id="tmpl_plan_edit" type="text/x-handlebars-template">
		  <hr>
         <div>
            <h3><strong> * {{plan_date}}</strong></h3>
            <h4>{{plan_time}}</h4>
         </div> 
         <div>{{plan_name}}</div>
         <button type="button" id="plan_edit" class="btn btn-warning glyphicon glyphicon-edit">수정</button>
         <button type="button" id="plan_delete" class="btn btn-danger glyphicon glyphicon-remove" >삭제</button>
		 <br/>
         <div  id="content" style="max-width:100%">{{{plan_contents}}}</div>
		  <hr>
      	 <input type="hidden" name="plan_list_{{num}}_1" id="plan_list_{{num}}_1" value="{{plan_date}}"/>
       	 <input type="hidden" name="plan_list_{{num}}_2" id="plan_list_{{num}}_2" value="{{plan_time}}"/>
      	 <input type="hidden" name="plan_list_{{num}}_3" id="plan_list_{{num}}_3" value="{{plan_name}}"/>
      	 <input type="hidden" name="plan_list_{{num}}_4" id="plan_list_{{num}}_4" value="{{{plan_contents}}}"/>
      	 <input type="hidden" name="plan_list_{{num}}_5" id="plan_list_{{num}}_5" value="{{planInfo_id}}"/>

   </script>
</body>

</html>
      