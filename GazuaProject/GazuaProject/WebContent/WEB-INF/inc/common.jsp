<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<meta charset="utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Grid</title>

<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="../plugins/lightbox/js/lightbox.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCF2vH4Dij1sIDQx2WhmvRCfrduXXfLMcM"></script>


<!-- gmap 플러그인 참조 -->
<script src="../assets/plugins/gmaps/gmaps.min.js"></script>



<script src="../assets/js/masonry.pkgd.js"></script>
<script src="../assets/js/masonry.pkgd.min.js"></script>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-144-precomposed.png" />


<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css" />

<!-- handlebars -->
<script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

<!-- ajaxForm -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>

<!-- CKEditor -->
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>

<!-- Multi-column -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/multi-column/ie-row-fix.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/multi-column/multi-columns-row.css" />
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
<script type="text/javascript" src="assets/js/html5shiv.js"></script>
<script type="text/javascript" src="assets/js/respond.min.js"></script>
<![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
<link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
<script type="text/javascript" src="assets/js/ie10.js"></script>
<![endif]-->