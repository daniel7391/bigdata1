<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <%@ include file="/WEB-INF/inc/common.jsp" %>

        <!-- 시각적 확인을 위한 CSS 적용 -->
        <style type="text/css">
        	<%@ include file="/assets/css/common.css" %>
        	
        </style>
        
    </head>
    <body>
		<header>
			<%@ include file="/WEB-INF/inc/header.jsp" %>
        </header>
        <section>
			<div class="container">
	            <h1>서울 여행자 분석 결과</h1>
	      		<div>
					<a href="#" class="analysis">
						<img src="../img/analysis1.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis2.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis3.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis4.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis5.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis6.png" width="100" height="70">
					</a>
					<a href="#" class="analysis">
						<img src="../img/analysis7.png" width="100" height="70">
					</a>
					<a href="#" class="analysis" >
						<img src="../img/analysis8.png" width="100" height="70">
					</a>
					<div class="result">
					</div>
				</div>
	        </div>
		</section>
        
        <footer>
        	
        </footer>
    </body>
    <script type="text/javascript">
    	$(function() {
    		$(document).on("click",".analysis",function(e){
    			e.preventDefault();
    			var src = $(this).children().attr("src");
    			console.log(src);
				var img = "<img src='" + src + "' width='" + 1000 + "'/>";
				$(".result").html(img);
    			
    		});
    	});
    </script>
</html>