<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="planLeft">
	<div class="sidebar">
		<div class="btn-group">
		    <button type="submit" class="btn btn-default save">저장하기</button>
		    <button type="button" class="btn btn-default cancel">취소</button>
		</div>
		<div>
		    <ul>
		        <li>
		            <button type="button" class="btn btn-default" style="width: 100%;">방문 명소</button>
				</li>
				<li>
					<form id="myform">
					<div>
						<select name="subject" id="subject">
							<option value="">--- 지역구 선택 ---</option>
							<c:choose>
								<c:when test="${fn:length(tourList) > 0}">
									<c:forEach var="document" items="${tourList}">
										<option value="${tourList.tourCode}">${tourList.tourLocation_gu}</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center" style="line-height: 100px;">
											조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					    	<input type="text" placeholder="여행지명으로 검색">
						<hr/>
						<div id="result"></div>
					</form>
				</li>
				<li>
				    <input type="text" placeholder="지역구로 검색">
				</li>
				<li>
				</li>
				<li>
				    <button type="button" class="btn btn-warning" style="width: 100%">검색</button>
			    </li>
		</ul>
	</div>
	<div class="searchResult">
	    <ul class="media-list">
	        <li class="media">
	            <a class="pull-left" href="#"><img src="img/chang.jpg" width="60" height="60" align="Generic placeholder image"></a>
	            <div class="media-body">
	                <div class="clearfix">
	                    <h4 class="media-heading pull-left">${tourinfo.name}</h4>
	                    <p>
	                    Twitter Bootstrap 정말 좋은 것 같습니다.
	                    </p>
	                </div>
	            </div>
	            <div class="pull-right" style="padding-top:30px;">
	                      <button type="submit" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></button>
	              </div>
	          </li>
	        </ul>
	    </div>
	</div>
</div>