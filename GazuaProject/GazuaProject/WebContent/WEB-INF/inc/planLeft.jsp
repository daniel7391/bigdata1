<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="planLeft">
   <div class="sidebar">
      <div class="clearfix">
          <!-- 검색 폼 -->
          <div class="pull-left" style="width:100%; margin-bottom:3px;">
              <button type="button" class="btn btn-default" style="width: 100%;">방문 명소</button>
              <div class="input-group">
               <div class="input-group-btn">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:100%; radiou:3px;">
                  지역구 검색
                     <span class="caret pull-right" style="margin-top:10px;"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                     <c:choose>
                        <c:when test="${fn:length(tourList) > 0}">
                           <c:forEach var="tour" items="${tourList}">
                              <li><a href="${tour.tourCode}">${tour.tourLocation_gu}</a></li>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                     </c:choose>
                  </ul>
               </div>
            </div>
            <input type="text" name="keyword" class="form-control" placeholder="여행지명으로 검색" value="${keyword}"/>
            <form method="get" action="${pageContext.request.contextPath}/gazua/plan.do" style="width:100%">
               <div class="input-group" style="width:100%">
                  <span class="input-group-btn" style="width:100%">
                     <button class="btn btn-success" type="submit" style="width:100%">
                        <i class="glyphicon glyphicon-search"></i>
                     </button>
                  </span>
               </div>
            </form>
         </div>
      </div>
      <div class="searchResult">
              <ul class="media-list">
            <c:choose>
               <c:when test="${fn:length(tourInfoList) > 0}">
                  <c:forEach var="tourInfo" items="${tourInfoList}">
                  <li class="media">
                     <a class="pull-left" href="${readUrl}"><img src="${tourInfo.imagePath}" width="60" height="60" ></a>
                     <div class="media-body">
                        <div class="clearfix">
                           <h5 class="media-heading pull-left" id="tourInfo_name_${tourInfo.id}">${tourInfo.name}</h5>
                           <p>
                           ${tourInfo.intro}
                           </p>
                        </div>
                     </div>
                     <div class="pull-right" style="padding-top:30px;">
                        <button class="btn btn-xs btn-primary planbtn" id="planList"><i class="glyphicon glyphicon-plus"></i></button>
                     </div>
                  </li>
                  </c:forEach>
               </c:when>
            </c:choose>
         </ul>
      </div>
<!-- 페이지 번호 시작 -->
<nav class="text-center">
   <ul class="pagination">
      <!-- 이전 그룹으로 이동 -->
      <c:choose>
         <c:when test="${pageHelper.prevPage > 0}">
            <!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
            <!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
            <c:url var="prevUrl" value="/gazua/plan.do">
               <c:param name="keyword" value="${keyword}"></c:param>
               <c:param name="page" value="${pageHelper.prevPage}"></c:param>
            </c:url>

            <li><a href="${prevUrl}">&laquo;</a></li>
         </c:when>

         <c:otherwise>
            <!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
            <li class='disabled'><a href="#">&laquo;</a></li>
         </c:otherwise>
      </c:choose>
         
      <!-- 페이지 번호 -->
      <!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
      <c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">

         <!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
         <c:url var="pageUrl" value="/gazua/plan.do" >
            <c:param name="keyword" value="${keyword}"></c:param>
            <c:param name="page" value="${i}"></c:param>
         </c:url>
            
         <!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
         <c:choose>
            <c:when test="${pageHelper.page == i}">
               <li class='active'><a href="#">${i}</a></li>
            </c:when>
            <c:otherwise>
               <li><a href="${pageUrl}">${i}</a></li>
            </c:otherwise>
         </c:choose>   

      </c:forEach>
         
      <!-- 다음 그룹으로 이동 -->
      <c:choose>
         <c:when test="${pageHelper.nextPage > 0}">
            <!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
            <!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
            <c:url var="nextUrl" value="/gazua/plan.do">
               <c:param name="keyword" value="${keyword}"></c:param>
               <c:param name="page" value="${pageHelper.nextPage}"></c:param>
            </c:url>

            <li><a href="${nextUrl}">&raquo;</a></li>
         </c:when>

         <c:otherwise>
            <!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
            <li class='disabled'><a href="#">&raquo;</a></li>
         </c:otherwise>
      </c:choose>
   </ul>
</nav>



<!--// 페이지 번호 끝 -->
               </div>
            </div>
            
            