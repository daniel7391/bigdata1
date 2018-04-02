<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

%>

<head>
<style type="text/css">
.main-profile{
	text-align:center;
	margin-top:5px;
}
.nick{

	font-size:20px; text-align:center;
	margin-top:20px;
}
.king{
	font-size:15px; text-align:center;
	margin-top:15px;
}
.logout{

font-size:15px; text-align:center;
}

</style>

</head>
<div id="infonav">
    
    	<div class="main-profile">
        <c:if test="${loginInfo.member_profile_img != null }">
            <c:if test="${cookie.profileThumbnail != null}">
                <img src="${pageContext.request.contextPath}/gazua/download.do?file=${cookie.profileThumbnail.value}" class="img-circle" />
            </c:if>
        </c:if>
        <c:if test="${loginInfo.member_profile_img == null}">
            <img src="${pageContext.request.contextPath}/assets/img/nullprof.png" class="img-circle" />
        </c:if>
        </div>
    </div>
   
    	<div class="nick">
        <label>${loginInfo.member_name2} 님</label>
        </div>
   
   	<div class="logout">
   	<label><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></label>
   	</div>
 
    <div class="col-md-12">
    <div class="king">
        <label><a href="${pageContext.request.contextPath}/member/mypage.do">마이페이지</a></label>
        <font color="#666666">|</font>
        <label><a href="${pageContext.request.contextPath}/member/edit.do">회원정보 수정</a></label>
 	</div>
        
    </div>
