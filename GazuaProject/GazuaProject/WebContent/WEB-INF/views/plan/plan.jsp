<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	<script type="text/javascript">
	$(function() {
        /** 표시할 위치에 대한 위도,경도 */
        var lat_value = 37.500674;
        var lng_value = 127.026683;

        /** 지도 표시하기 */
        var map = new GMaps({
            el: '#gmap',        // 지도를 표시할 div의 id값.
            lat: lat_value,     // 지도가 표시될 위도
            lng: lng_value,     // 지도가 표시될 경도
            zoomControl: true   // 줌 컨트롤 사용 여부
        });

        $(document).on("click", ".add", function(){
            var item = $(this).parents('.item');
            var clone = item.clone();
            clone.insertAfter(item);
        });

        $(document).on("click", ".remove", function(){
            $(this).parents(".item").remove();
        });


        $(".tab-button-item-link").click(function(e){
            e.preventDefault();

            $(".tab-button-item-link").not(this).removeClass("selected");

            $(this).addClass("selected");

            var target = $(this).attr('href');
            $(target).removeClass('hide');
            $(".tab-panel > div").not($(target)).addClass("hide");
        });

    });
	</script>
	<style type="text/css">
		<%@ include file="/assets/css/plan.css" %>
	</style>
</head>

<body>
    <header>
    	<%@ include file="/WEB-INF/inc/header.jsp" %>
    </header>
    <section>
    	<%@ include file="/WEB-INF/inc/plan1.jsp" %>
    </section>
</body>

</html>