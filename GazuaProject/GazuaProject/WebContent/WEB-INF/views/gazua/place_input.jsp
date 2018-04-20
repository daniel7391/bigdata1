<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="place_input_modal" method="get" 
	action="${pageContext.request.contextPath}/gazua/plan.do">
	<input type="hidden" name="tour_id" value="${tour_id}" />
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">정보 입력</h4>
	</div>
	<div class="modal-body">
		<label>시작 날짜</label>
            <input type="date" class="form-control" id="place_date" name="place_date"/>
            <br/>
            <label>시간</label>
            <input type="time" class="form-control" id="place_time" name="place_time"/>
            <br/>
            <label>내용</label>
            <textarea class="form-control" id="place_text" name="place_text" style="max-width:100%;"></textarea>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">저장</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
</form>
