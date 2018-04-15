<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	<style type="text/css">
		.confirm {
			margin-top: 3px;
		}
		.container {
			width: 1030px !important;
		}
		.form-horizontal{
			margin-left:300px;
		}
	</style>
</head>
<body>
	<header>
    	<%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    <div class='container'>
	    <div class='page-header'>
	        <h1 style="margin-left:150px;">회원정보 수정</h1>
	    </div>
    	<!-- 가입폼 시작 -->
	    <form class="form-horizontal" name="myform" method="post" action="${pageContext.request.contextPath}/member/edit_ok.do" enctype="multipart/form-data">
	    	<div class="form-group">
	            <label for='member_name' class="col-md-2">이름*</label>
	            <div class="col-md-10">
	                <!-- 아이디는 변경할 수 없기 때문에 출력만 한다. -->
	                <p class="form-control-static">${loginInfo.member_name}</p>
	            </div>
	        </div>
	    	 <div class="form-group">
	            <label for='member_user_id' class="col-md-2">아이디*</label>
	            <div class="col-md-10">
	                <!-- 아이디는 변경할 수 없기 때문에 출력만 한다. -->
	                <p class="form-control-static">${loginInfo.member_id}</p>
	            </div>
	        </div>
        
			<div class="form-group ">
	            <label for='member_name2' class="col-md-2">닉네임*</label>
	            <div class="col-md-10" style="float:left;">
					<input type="text" name="member_name2" id="member_name2" class="form-control pull-left" value="${loginInfo.member_name2}" style="width:200px;"/>
					
            	</div>
	        </div>
	        <div class="form-group">
	            <label for='"member_pw"' class="col-md-2">현재 비밀번호*</label>
	            <div class="col-md-10">
	                <input type="password" name="member_pw" id="member_pw" class="form-control"  style="width:200px;"/>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for='new_member_pw' class="col-md-2">변경할 비밀번호</label>
	            <div class="col-md-10">
	                <input type="password" name="new_member_pw" id="new_member_pw" 
	                    class="form-control" placeholder="변경을 원하실 경우만 입력하세요."  style="width:200px;"/>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for='member_pw_re' class="col-md-2">변경할 비밀번호 확인</label>
	            <div class="col-md-10">
	                <input type="password" name="new_member_pw_re" id="new_member_pw_re" class="form-control"  style="width:200px;"/>
	            </div>
	        </div>
        
	         <div class="form-group">
	            <label for='member_email' class="col-md-2">이메일*</label>
	            <div class="col-md-10">
	                <input type="email" name="member_email" id="member_email" class="form-control" 
	                    value="${loginInfo.member_email}" style="width:450px;"/>
	            </div>
	        </div>
        
	        <div class="form-group">
	            <label for='member_gender' class="col-md-2">성별*</label>
	            <div class="col-md-10">
	            	<label class="radio-inline">
	                	<input type="radio" name="gender" id="member_gender1" value="M"  
	                		<c:if test="${loginInfo.member_gender == 'M'}">checked</c:if>/> 남자
	                </label>
	                <label class="radio-inline">
	                	<input type="radio" name="gender" id="member_gender2" value="F"
	                		<c:if test="${loginInfo.member_gender == 'F'}">checked</c:if> /> 여자
	                </label>
	            </div>
	        </div>
        
	         <div class="form-group">
	            <label for='birthdate' class="col-md-2">생년월일*</label>
	            <div class="col-md-10">
	              <p class="form-control-static">${loginInfo.birthdate}</p>
	            </div>
	        </div>
        
	         <div class="form-group">
	            <label for='member_profile_img' class="col-md-2">프로필 사진</label>
	            <div class="col-md-10">
	                <input type="file" name="member_profile_img" id="member_profile_img" class="form-control" style="width:300px;"/>
	            </div>
	        </div>

        	<c:if test="${cookie.profileThumbnail != null}">
        		<div class="form-group">
	            	<!-- 등록된 프로필 이미지 표시하기 -->
	            	<div class="col-md-10 col-md-offset-2">
		            	<p>
			            	<img src="${pageContext.request.contextPath}/gazua/download.do?file=${cookie.profileThumbnail.value}" class="img-circle"/>
			            	<label class="checkbox-inline">
			            		<input type="checkbox" name="img_del" id="img_del" value="Y" /> 이미지 삭제
			            	</label>
		            	</p>
			            <script type="text/javascript">
			            	$(function() {
			            		// 이미지가 등록된 상태이므로, 파일의 신규 등록을 방지
			            		$("#profile_img").prop("disabled", true);
			            		$("#img_del").change(function() {
			            			$("profile_img").prop("disabled", !$(this).is(":checked"));
			            		});
			            	});
			            </script>
            		</div>
              	</div>
	   	 	</c:if>
	    
		    <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <button type="submit" class="btn btn-primary">수정하기</button>
	                <button type="reset" class="btn btn-danger">다시작성</button>
	            </div>
	        </div>
	    </form>
	    <!-- 가입폼 끝 -->
	</div>
</body>
</html>
