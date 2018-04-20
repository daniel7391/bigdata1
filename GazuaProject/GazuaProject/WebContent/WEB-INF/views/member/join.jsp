<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<style type="text/css">
			.confirm {
				margin-top: 3px;
			}
			.container {
				width: 1030px;
			}
			.form-horizontal{
				margin-left:300px;
			}
	</style>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	
<script>
$(function() {
	$("#member_user_id_check").click(function(e){
		$.post("${pageContext.request.contextPath}/member/id_check.do",{
			
	    },function(json){
	       if(json.rt != "OK"){
	          alert(json.rt);
	          return false;
	       }
			
		var triger = false;
		
		if($("#member_user_id").val()==""){
			alert("아이디를 입력하세요.");
		}else{
		
			for(var i = 0; i<json.item.length; i++){
			if($("#member_user_id").val()==json.item[i].member_user_id){
				triger = true;
			} 
		}
		
		if(triger == true){
			alert("중복 된 아이디입니다 다른 아이디를 입력 사용해주세요");
			
		} else {
			alert("사용가능 한 아이디입니다.");
		}
		}
	});
       
       
  
     
     
       
    });
	
	$("#member_user_name2_check").click(function(e){
		$.post("${pageContext.request.contextPath}/member/id_check.do",{
			
	    },function(json){
	       if(json.rt != "OK"){
	          alert(json.rt);
	          return false;
	       }
			
		var triger = false;
		
		if($("#member_name2").val()==""){
			alert("닉네임을 입력하세요.");
		}
		else{
		
			for(var i = 0; i<json.item.length; i++){
			
			if($("#member_name2").val()==json.item[i].member_name2){
				triger = true;
			} 
		}
		
		if(triger == true){
			alert("중복 된 닉네임입니다 다른 닉네임을 사용해 주세요.");
			
		} else {
			alert("사용가능 한 닉네임입니다.");
		}
		}
	 	
	});
       
       
  
     
     
       
    });
    
});
</script>
	
</head>

<body>
	<header>
    	<%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    
    <div class='container'>
    <div class='page-header'>
        <h1 style="margin-left:150px;">회원가입</h1>
    </div>
    <!-- 가입폼 시작 -->
    <form class="form-horizontal" name="myform" method="post"  enctype="multipart/form-data"
        action="${pageContext.request.contextPath}/member/join_ok.do">
        
        <div class="form-group">
            <label for='member_name' class="col-md-2">이름*</label>
            <div class="col-md-10">
                <input type="text" name="member_name" id="member_name" class="form-control" style="width:200px;"/>
            </div>
        </div>

        <div class="form-group">
            <label for='member_user_id' class="col-md-2">아이디*</label>
            <div class="col-md-10" style="float:left;">
          	

               <input type="text" name="member_user_id" id="member_user_id" class="form-control pull-left" style="width:200px;"/>
	          
				
	           
	         <div class="col-md-3">	
				<button type="button" class="btn confirm" id="member_user_id_check"
					style="background: orange; color: white; margin-top: 0px; float:left;">중복확인
				</button>
			</div>
					
            </div>
        	
        </div>
        
         <div class="form-group ">
            <label for='member_name2' class="col-md-2">닉네임*</label>
            <div class="col-md-10" style="float:left;">
                <input type="text" name="member_name2" id="member_name2" class="form-control pull-left" style="width:200px;"/>
	           <div class="col-md-3">	
					<button type="button" class="btn confirm" id="member_user_name2_check"  
					style="background: orange; color: white; margin-top: 0px; float:left;">중복확인
					</button>
			</div>
					
            </div>
        	
        </div>
        
      

        <div class="form-group">
            <label for='"member_pw"' class="col-md-2">비밀번호*</label>
            <div class="col-md-10">
                <input type="password" name="member_pw" id="member_pw" class="form-control" style="width:200px;"/>
            </div>
        </div>

        <div class="form-group">
            <label for='member_pw_re' class="col-md-2">비밀번호 확인*</label>
            <div class="col-md-10">
                <input type="password" name="member_pw_re" id="member_pw_re" class="form-control"  style="width:200px;"/>
            </div>
        </div>

        <div class="form-group">
            <label for='member_email' class="col-md-2">이메일*</label>
            <div class="col-md-10">
                <input type="email" name="member_email" id="member_email" class="form-control"  style="width:450px;"/>
            </div>
        </div>

        <div class="form-group">
            <label for='member_gender' class="col-md-2">성별</label>
            <div class="col-md-10">
            	<label class="radio-inline">
                	<input type="radio" name="member_gender" id="member_gender1" value="M"  /> 남자
                </label>
                <label class="radio-inline">
                	<input type="radio" name="member_gender" id="member_gender2" value="F" /> 여자
                </label>
            </div>
        </div>

         <div class="form-group">
            <label for='birthdate' class="col-md-2">생년월일*</label>
            <div class="col-md-10">
                <input type="date" name="birthdate" id="birthdate" class="form-control" placeholder="yyyy-mm-dd" style="width:200px;"/>
            </div>
        </div>

        <div class="form-group">
            <label for='profile_img' class="col-md-2">프로필 사진</label>
            <div class="col-md-10">
                <input type="file" name="profile_img_path" id="profile_img_path" class="form-control"  style="width:300px;"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-primary">가입하기</button>
                <button type="reset" class="btn btn-danger">다시작성</button>
            </div>
        </div>
    </form>
    

    
    <!-- 가입폼 끝 -->
</div>
</body>
</html>
