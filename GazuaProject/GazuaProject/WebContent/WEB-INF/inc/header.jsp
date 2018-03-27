<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="container">
<a href="MainPage.html"><img src="img/logo.png" /></a>
</div>
<div class="navbar navbar-inverse navbar-static-top" role="navigation">
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">메뉴열기</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
  </div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li><a href="SResult.html">추천여행지</a></li>
<li><a href="Plan.html">여행 일정 만들기</a></li>
<li><a href="Review.html">여행 후기</a></li>
</ul>
</div>
<div class="input-group">
<div class="input-group-btn">
<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">어디에서<span class="caret"></span>
</button>
<ul class="dropdown-menu" role="menu">
<li><a href="#">강남구</a></li>
<li><a href="#">강북구</a></li>
<li><a href="#">강서구</a></li>
</ul>
</div>
<input type="text" class="form-control">
<div class="input-group-btn">
<button type="submit" class="btn btn-primary">검색</button>
</div>
</div>
</div>
</div>
