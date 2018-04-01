<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<form name="loginform" id="loginform" method="post" action="${pageContext.request.contextPath}/member/login_ok.do">
    <fieldset>
        <legend>로그인</legend>
        <div class="form-group">
            <label for="user_name">아이디</label>
            <input type="text" name="member_user_id" id="member_user_id" class="form-control" />
        </div>
        <div class="form-group">
            <label for="user_pw">비밀번호</label>
            <input type="password" name="member_user_pw" id="member_user_pw" class="form-control" />
        </div>
        <span style="font-size: small;">
            <a href="#findId" data-toggle="modal"><span class="clickable">아이디 찾기</span></a>
            &nbsp;/&nbsp;
            <a href="#findPw" data-toggle="modal"><span class="clickable">비밀번호 찾기</span></a>
        </span><br/><br/>
        <button type="submit" class="btn btn-primary">로그인</button>
        <a href="${pageContext.request.contextPath}/member/join.do" type="button" class="btn btn-default">회원가입</a>
    </fieldset>
</form>