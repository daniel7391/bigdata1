<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="planLeft" style="width:300px;">

<span class="input-group-btn">
   <input type="text" class="form-control" id="tourInfo_list_searching"/>
   <button type="button" class="btn btn-primary" id="tourInfo_list_searching_btn" style="width:100%;" >
      <i class="glyphicon glyphicon-search"></i>
   </button>
</span>
<table class="sortable paginated" id="tourInfo_table" style="width:100%">
   <tr id="tourInfo_list_test">
   
   </tr>
</table>
   <div class="sidebar">
      <!-- 페이지 번호 시작 -->
      <nav class="text-center">
         <ul class="pagination" id="pagination" style="width:350px;">
         </ul>
      </nav>
   </div>
</div>

<!-- modal_2 시작 -->
<div class="modal fade" id="myModal_second">
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
            <input type="time" class="form-control" id="plan_list_time"/>
            <br/>
            <label>내용</label>
            <textarea class="form-control" id="plan_list_modal" cols="3" rows="10" wrap="hard"></textarea>
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

<script type="text/javascript">
$(function() {
   var json_list;
   var json_list_second;
   var num = 0;
   var add_num = 0;
   function ready(){
      // 여행 일정 만들기 시작시 여행정보들을 JSON으로 파싱
      $.get("${pageContext.request.contextPath}/gazua/plan_searching.do",{
      },function(json){
         if (json.rt != "OK") {
            alert(json.rt);
            return false;
         }
         json_list = json;
         var totalCount = json_list.item.length;
         console.log("totalCount >> " + totalCount);
         var groupCount = 6;
         for(var i = num-1; i < groupCount-1; i++){
            var temp = Handlebars.compile($("#tmpl_tourInfo_list").html());
            $("#tourInfo_list_test").append(temp(json_list.item[i]));
         }
         paging_test(totalCount, json_list, groupCount);   
      });
    }
   
   $(document).ready(function(){
      ready();   
   });
   
   // 페이징 처리
   function paging_test(totalCount, json_list_input, groupCount){
      $("#pagination").empty();
      var pagingHelper = {};
      
      $("#pagination").append("<li class='disabled' id='prevPagination'><a href='#'>&laquo;</a></li>");
      for( var i = 1; i < groupCount; i++){
         if(i > (totalCount/groupCount) + 1 ){
            break;
         }
         var temp = Handlebars.compile($("#tmpl_tourInfo_paging_list").html());
         pagingHelper.num = i;
         $("#pagination").append(temp(pagingHelper));
         if( i == 1){
            $('#pageNum_1').addClass('active');
         }
      }
      $("#pagination").append("<li id='nextPagination'><a href='#'>&raquo;</a></li>");
      
      // 검색시 결과가 적을때 nextPagination 비활성화
      if( (totalCount/groupCount) <= 5){
         $("#nextPagination").addClass('disabled');
      }else{
         $("#nextPagination").removeClass('disabled');
      }
      
      // 다음 페이지로 이동
      $('#pagination #nextPagination').click(function(e){
         e.preventDefault();
         if($('#pagination #nextPagination').hasClass('disabled')){
            return;
         }
         
         var next_num = $("#pageNum_5").children().html();
         
         if($('#pagination #prevPagination').hasClass('disabled')){
            $('#pagination #prevPagination').removeClass("disabled");
         }
         
         if(next_num > totalCount/(groupCount-1)+1){
            return;
         }
         
         for(var j = 1; j<6; j++){
            $("#pageNum_"+j).children().html(++next_num);
            if(j==1){
               $("#pageNum_"+j).click();
            }
         }
         
         for(var k = 1; k<6; k++){
            if($('#pageNum_'+k).children().html() > totalCount/(groupCount-1)+1){
               $('#pageNum_'+k).addClass('hidden');
            };
         }
         
         if(next_num > totalCount/(groupCount-1)){
            $('#pagination #nextPagination').addClass("disabled");
         }
         
      });
   
      
      // 이전 페이지로 이동
      $('#pagination #prevPagination').click(function(e){
         e.preventDefault();
         
         if($('#pagination #prevPagination').hasClass('disabled')){
            return;
         }
         
         if($('#pagination #nextPagination').hasClass('disabled')){
            $('#pagination #nextPagination').removeClass("disabled");
         }
         
         if($("#pageNum_1").children().html() == 1){
            return;
         }

         var prev_num = $("#pageNum_1").children().html();
         
         for(var j = 5; j>0; j--){
            $("#pageNum_"+j).children().html(--prev_num);
            if(j==5){
               $("#pageNum_"+j).click();
            }
         }
         
         for(var k = 1; k<6; k++){
            if($('#pageNum_'+k).children().html() < totalCount/(groupCount-1)+1){
               $('#pageNum_'+k).removeClass('hidden');
            };
         }
         
         if(prev_num == 1){
            $('#pagination #prevPagination').addClass("disabled");
         }
      });
   
   // 페이지 이동시
   $(document).on("click",".pageNum",function(e){
       e.preventDefault();
       console.log(json_list_input.item[0]);
       $("#pagination .pageNum").not(this).removeClass("active");
        $(this).addClass("active");
        $("#tourInfo_list_test").empty();
       
       var paging_test_num = $(this).children().html();
       
       for(var i = (paging_test_num-1)*5; i<(paging_test_num-1)*5 + 5; i++){
         var temp = Handlebars.compile($("#tmpl_tourInfo_list").html());
          if(i>totalCount-1){
            return;
         }
          $("#tourInfo_list_test").append(temp(json_list_input.item[i]));
       }
    });
   
// 동적 요소 on함수, 여행지 추가 기능
   $(document).on("click", ".planbtn", function(e){
      e.preventDefault();
      var id = $(this).data("id");
       $("#plan_list_ok").unbind('click');
       $("#myModal_second").modal('show');
       $("#plan_list_date").val("");
       $("#plan_list_time").val("");
       $("#plan_list_modal").val("");
       var i_num = 0;
       var json_list_item_id = null;
       for(var i = 0; i<json_list.item.length; i++){
          if(json_list.item[i].id == id){
             $("#modal-title").html(json_list.item[i].name);
             json_list_item_id = json_list.item[i].id;
             lat_value = json_list.item[i].x;
             lng_value = json_list.item[i].y;
             
             i_num = i;
          }
       }
       
       var plan_sc ={};
       var temp = Handlebars.compile($("#tmpl_searching").html());
       
       $("#plan_list_ok").click(function(){
          console.log($("#modal-title").html());
           plan_sc.plan_name = $("#modal-title").html();
           plan_sc.plan_date = $("#plan_list_date").val();
           plan_sc.plan_time = $("#plan_list_time").val();
           plan_sc.num = ++add_num;
           plan_sc.plan_contents = $("#plan_list_modal").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
           plan_sc.planInfo_id = json_list_item_id;
           
          $("#plan_list_start").append(temp(plan_sc));
       });
   });
   $('#pageNum_1').click();
  }
   
   //검색기능
    $(document).on("click","#tourInfo_list_searching_btn", function(e){
       e.preventDefault();

       var json_searching_list = {rt:"OK", item : Array()};
       var searching_name = $("#tourInfo_list_searching").val().trim();
       var searching_name_length = searching_name.length;
      
       //검색어가 없을 경우
       if(searching_name_length == 0){
          $("#tourInfo_list_test").empty();
          $("#pagination").empty();
          var totalCount = json_list.item.length;
         var groupCount = 6;
          paging_test(totalCount, json_list, groupCount);
         $('#pageNum_1').click();
          return;
       }
       
       $("#tourInfo_list_test").empty();
       var searching_cnt = 0;
       
       //여행지 정보 이름과 검색어 비교
       for(var i = 0; i <json_list.item.length; i++){
          var tourinfo_name = json_list.item[i].name;
          var tourinfo_name_length = tourinfo_name.length;
          
          for(var k = 0; k < tourinfo_name_length; k++){
             var sub_name = tourinfo_name.substring(k,searching_name_length+k);
             if(searching_name == sub_name){
                var temp = Handlebars.compile($("#tmpl_tourInfo_list").html());
                $("#tourInfo_list_test").append(temp(json_list.item[i]));
                json_searching_list.item.push(json_list.item[i]);
                searching_cnt++;
                break;
            }
         }
       }
       var json_searching_list_length = json_searching_list.item.length;
       paging_test(json_searching_list.item.length, json_searching_list, 6);
      $('#pageNum_1').click();
   });
   
  //삭제 버튼
    $(document).on("click", "#plan_delete", function(e){
    	e.preventDefault();
    	
    	var delete_num = Number($(this).parents().attr('id').substring(10, 11));
    	var delete_last_num = $("#plan_list_start li").length;
		
    	var del_ok=confirm("삭제 할랭?");
        
        if(del_ok){
        	$(this).parent().remove();
        }
        
    	
    	for(var k = delete_num + 1; k < $("#plan_list_start li").length + 2; k++){
    		var list_next_id = 'plan_list_'+(k-1);
    		var list_prev_id = 'plan_list_'+k;
    		$("#plan_list_"+k).attr("class", 'plan_list_'+(k-1));
    		for(var n = 5; n < 10; n++){
    			$("#plan_list_"+k).children().eq(n).attr('id', 'plan_list_'+(k-1)+'_'+(n-4));
    			$("#plan_list_"+k).children().eq(n).attr('name', 'plan_list_'+(k-1)+'_'+(n-4));
    		}
    		
    		$("#plan_list_"+k).attr("id", list_next_id);
    		
    	}
    	
    	add_num--;
    });
});

</script>

<script id="tmpl_tourInfo_paging_list" type="text/x-handlebars-template">
   <li class="pageNum" id="pageNum_{{num}}"><a href="#">{{num}}</a></li>      
</script>

<script id="tmpl_tourInfo_list" type="text/x-handlebars-template">
   <td class="pull-left" style="width:100%">
      <a class="pull-left">
         <img src="{{imagePath}}" width="70" height="70" >
      </a>
      <div class="media-body">
            <div class="clearfix">
             <h5 class="media-heading pull-left" id="tourInfo_name_{{id}}" style="width:200px; text-align:left;">&nbsp;{{name}}</h5>
            <p style="width:200px; height:40px; text-align:left;">{{{intro}}}</p>
            </div>
      </div>
      <div class="pull-right">
         <a href="#" class="btn btn-xs btn-primary planbtn" 
            data-id="{{id}}" id="planList_{{id}}">
            <i class="glyphicon glyphicon-plus"></i>
         </a>
      </div>
   </td>     
</script>

