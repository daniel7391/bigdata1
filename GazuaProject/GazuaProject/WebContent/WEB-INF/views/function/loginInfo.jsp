<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

%>
<div id="infonav">
   <div class="col-md-3">
        <c:if test="${loginInfo.member_profile_img != null }">
            <c:if test="${cookie.profileThumbnail != null}">
                <img src="${pageContext.request.contextPath}/download.do?file=${cookie.profileThumbnail.value}" class="img-circle" />
            </c:if>
        </c:if>
        <c:if test="${loginInfo.member_profile_img == null}">
            <img src="${pageContext.request.contextPath}/assets/img/nullprof.jpg" class="img-circle" />
        </c:if>
   </div>
   <div class="col-md-9">
        <label>${loginInfo.member_name2} 님</label>
    </div>
    <br />
    <label><a href="${pageContext.request.contextPath}/member/mypage.do">마이페이지</a></label>&nbsp;
    <label><a href="${pageContext.request.contextPath}/member/edit.do">회원정보 수정</a></label>&nbsp;
    <label><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></label>
</div>