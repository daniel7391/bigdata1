<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="planLeft">
<table class="sortable paginated hidden" id="tourInfo_table">
   <c:choose>
      <c:when test="${fn:length(tourInfoList) > 0}">
         <c:forEach var="tourInfo" items="${test}">
            <tr id="tourInfo_list_test">
            <td>
               <a class="pull-left" href="${readUrl}"><img src="${tourInfo.imagePath}" width="60" height="60" ></a>
            <div class="media-body">
               <div class="clearfix">
                  <input type="hidden" value="${tourInfo.id}"/>
                  <h5 class="media-heading pull-left" id="tourInfo_name_${tourInfo.id}">${tourInfo.name}</h5>
            ${tourInfo.intro}
               </div>
            </div>
            <div class="pull-right" style="padding-top:30px;">
                  <button class="btn btn-xs btn-primary planbtn" id="planList"><i class="glyphicon glyphicon-plus"></i></button>
               </div>
               </td>
            </tr>
         </c:forEach>
      </c:when>
   </c:choose>
</table>
   <div class="sidebar">
      <!-- 페이지 번호 시작 -->
      <nav class="text-center">
         <ul class="pagination" id="pagination">
         </ul>
      </nav>
   </div>
</div>
<script type="text/javascript">
   
$(function() {
   var pageHelper = {
      totalCount : ${pageHelper.totalCount},         
      groupCount : ${pageHelper.groupCount},
      num : 1
   };
   
   $("#pagination").append("<li class='disabled' id='prevPagination'><a href='#'>&laquo;</a></li>");
   for( var i = 1; i < pageHelper.groupCount; i++){
      var temp = Handlebars.compile($("#tmpl_tourInfo_list").html());
      pageHelper.num = i;
      //temp(num);
      $("#pagination").append(temp(pageHelper));
      if( i == 1){
         $('#pageNum_1').addClass('active');
      }
   }
   $("#pagination").append("<li id='nextPagination'><a href='#'>&raquo;</a></li>");
   
   $(".pagination .pageNum").click(function(e){
      e.preventDefault();
       $(".pagination li").not(this).removeClass("active");
       $(this).addClass("active");
       
         //alert($(this).children().html());
         var paging_num = $(this).children().html()-1;
         
      $(".pager").children("#page_"+paging_num).click();
         
         
   });
   
   $('.pagination #nextPagination').click(function(e){
      e.preventDefault();
      if($('.pagination #prevPagination').hasClass('disabled')){
         $('.pagination #prevPagination').removeClass("disabled");
      }
      if(pageHelper.num > pageHelper.totalCount/(pageHelper.groupCount-1)+1){
         return;
      }
      
      pageHelper.num += 1;
      
      for(var j = 1; j<6; j++){
         $("#pageNum_"+j).children().html(pageHelper.num+j-1);
         if(j==1){
            $("#pageNum_"+j).click();
         }
      }
      
      for(var k = 1; k<6; k++){
         if($('#pageNum_'+k).children().html() > pageHelper.totalCount/(pageHelper.groupCount-1)+1){
            $('#pageNum_'+k).addClass('hidden');
         };
      }
      
      pageHelper.num += 4;
      
      if(pageHelper.num > pageHelper.totalCount/(pageHelper.groupCount-1)+1){
         $('.pagination #nextPagination').addClass("disabled");
      }
      
   });
   
   $('.pagination #prevPagination').click(function(e){
      e.preventDefault();
      if($('.pagination #nextPagination').hasClass('disabled')){
         $('.pagination #nextPagination').removeClass("disabled");
      }
      if(pageHelper.num == 0){
         return;
      }
      pageHelper.num -= 4;
      for(var j = 1; j<6; j++){
         $("#pageNum_"+j).children().html(pageHelper.num+j-1);
         if(j==5){
            $("#pageNum_"+j).click();
         }
      }
      for(var k = 1; k<6; k++){
         if($('#pageNum_'+k).children().html() < pageHelper.totalCount/(pageHelper.groupCount-1)+1){
            $('#pageNum_'+k).removeClass('hidden');
         };
      }
      pageHelper.num -= 1;
      
      if(pageHelper.num == 0){
         $('.pagination #prevPagination').addClass("disabled");
      }
   });
   //------------------------------------
   $('table.paginated').each(function() {
          var currentPage = 0;
          var numPerPage = 5;
          var $table = $(this);
          $table.find('tr').hide()
           .slice(currentPage * numPerPage,
             (currentPage + 1) * numPerPage)
           .show();
         
          $table.bind('repaginate', function() {
            $table.find('tr').hide()
                 .slice(currentPage * numPerPage,
                   (currentPage + 1) * numPerPage)
              .show();
          });
              
          var numRows = $table.find('tr').length;
          var numPages = Math.ceil(numRows / numPerPage);
          var $pager = $('<div class="pager hidden" id="paging"></div>') ;

          for (var page = 0; page < numPages; page++) {
             $("#tourInfo_table").removeClass("hidden");
            $('<span class="page-number" style="coursor:pointer" id="page_'+page+'"></span>').text(page + 1)
               .bind('click', {newPage: page}, function(event) {
               currentPage = event.data['newPage'];
                   $table.trigger('repaginate');
                   
                   $(this).addClass('active')
                     .siblings().removeClass('active');
            }).appendTo($pager).addClass('clickable');
         }
          
         $pager.insertBefore($table)
            .find('span.page-number:first').addClass('active');
         
         //alert(document.getElementById("pager2"));
         //$("#pager2").trigger();
      });//$(ul)
   //------------------------------------
   
});
</script>

<script id="tmpl_tourInfo_list" type="text/x-handlebars-template">
   <li class="pageNum" id="pageNum_{{num}}"><a href="#">{{num}}</a></li>      
</script>