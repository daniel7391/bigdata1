<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../assets/css/thumblist.css" />
	<%@ include file="/WEB-INF/inc/common.jsp" %>
	<style type="text/css">
             *{
                list-style: none;
                padding: 0px;
                margin:0px;
            }
            body{
                padding-top: 0px;
                padding-bottom: 20px;
            }
            .searchbar{
                ;
                background-color: gainsboro;
            }
            .btn-ttc, .btn-ttc:hover, .btn-ttc:focus {
                color: #1DDB16;
                background-color: #CEF279;
                
            }

            /* 기본 배경 색상 정의 - gradient 색상을 적용할 수도 있다. */
            .btn-ttc {
                background-color: #E4F7BA;
                color: #ABF200;
                width: 120px;
                
            }

            /* 마우스 올렸을 때, 약간의 위치 이동효과 */
            .btn-ttc:hover {
                background-position: 0 -15px;
            }
            .btn-ttc2, .btn-ttc2:hover, .btn-ttc2:active  {
                color: #FF0000;
                background-color: #FFCA6C;
                
            }

            /* 기본 배경 색상 정의 - gradient 색상을 적용할 수도 있다. */
            .btn-ttc2 {
                color: #FF0000;
                background-color: #FFCA6C;
            }

            /* 마우스 올렸을 때, 약간의 위치 이동효과 */
            .btn-ttc2:hover {
                background-position: 0 -15px;
            }

            /* 가장 작은 해상도 (핸드폰종류, 가로 480px 이하) */
            @media (max-width: 767px) {
                .btn-ttc{
                    width: 200px;
                }
            }
            
            /* 태블릿 PC 혹은 가로 768px 이상 */
            @media (min-width: 768px) and (max-width: 991px) {
                .btn-ttc{
                    width: 89px;
                }
              
         
            }
            
            /* 작은 크기의 데스크탑 혹은 가로 992px 이상 */
            @media (min-width: 992px) and (max-width: 1199px) {
               .btn-ttc{
                    width: 110px;
                }
               
                }
            

            .dropdownbar{
                width: 250px;
                margin:auto;
            }
             @media (min-width: 992px) and (max-width: 1199px) {
               .dropdownbar{
                    width: 228px;

                }
                 
           }
            @media (min-width: 768px) and (max-width: 991px) {
                .dropdownbar{
                    width: 185px;
                }
              
         
            }
             @media (max-width: 767px) {
                .dropdownbar{
                    width: 410px;
                }
            }

            #grid .item { width: 33%;  }
            #grid .item .item-box { padding: 5px; width: auto; }
            #grid .item .item-box .item-content { border: 1px solid #eee; }
            #grid .item .item-box .item-content .img { width: 100%; height: 180px; border-bottom:1px solid #eee; }
            #grid .item .item-box .item-content .title {
                color: #333; font-size: 14px; font-weight: bold; padding: 5px 10px;
            }
            #grid .item .item-box .item-content .desc {
                color: #555; font-size: 12px; padding: 0 10px;
            }
            #grid .item .item-box .item-content .state{
                color:orange;	padding: 0px 0px 0px 10px
            }
            #grid .item .item-box .item-content .nick{
                color:lightgray; font-size: 5px; padding: 0px 0px 0px 11px
            }
            .container{
                width: 1030px;
            }
            .btn-ttc:active, .btn-ttc:visited {
            	   color: #1DDB16;
                background-color: #CEF279;
			}

			.active {
				   color: #1DDB16;
                background-color: #CEF279;
			}
			.btn-default.active{
				 color: #1DDB16;
                background-color: #CEF279;
			}
			  .btn-ttc3:active, .btn-ttc3:visited {
            	   color: #1DDB16;
                background-color: #CEF279;
			}
			.btn-ttc3, .btn-ttc3:hover, .btn-ttc3:focus {
                color: #1DDB16;
                background-color: #CEF279;
                
            }

            /* 기본 배경 색상 정의 - gradient 색상을 적용할 수도 있다. */
            .btn-ttc3{
                background-color: #E4F7BA;
                color: #ABF200;
                width: 120px;
                
            }
    </style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/inc/header.jsp" %>
	</header>
	
        <div id="main">  
        	  <!-- 링크 바 시작-->
             <div class="container">
                <div class="linkbar">
                 <a href="${pageContext.request.contextPath}/gazua/main.do" style="margin: 5px">메인</a>
                 <font color=black> > </font>        
                 <a href="${pageContext.request.contextPath}/gazua/plan_review_list.do">여행후기</a>    
                  </div>
                  <hr />
             </div>
               <!-- 링크 바 끝-->

                 <!-- 사이드바 시작-->
             <div class="container " >
                <div class="row ">
                <div class="searchbar col-sm-3 text-center" style="padding-left: 0px; padding-right: 0px;">
                    <div style="text-align: center"><font color=black size=3><strong>검색 옵션</strong></font></div>
                  


                  <!-- 기간 드롭다운-->
            <form method="get" action="${pageContext.request.contextPath}/gazua/plan_review_list.do">
            <div class="dropdownbar">
                <div class="input-group" style="padding: 5px 1px 2px 3px">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        전체<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">최근 1주일</a></li>
                        <li><a href="#">최근 1달</a></li> 
                    </ul>
                </div>
                	<input type="text" name="keyword" class="form-control" value="${keyword}" />
                </div>
            </div>
              
               <!-- 인기 버튼-->
            
               <div style="padding: 10px 1px 2px 3px">
               	<label><input type='radio' name='arrange' value="1">인기순</label>
               	<label><input type='radio' name='arrange' value="2">최신순</label>
               </div>

                 <div style="text-align: center; padding: 10px 1px 1px 1px"><font color=black size=3><strong>여행 테마</strong></font></div>
                
                <!-- 여행 테마 버튼-->
                   <div  style="padding: 10px 1px 2px 3px">
                    <label><input type='radio' name='people_level' value="1">나홀로 여행</label>
               		<label><input type='radio' name='people_level' value="2">친구와 함께</label>
                   </div>

                   <div  style="padding: 5px 1px 2px 3px">
                    <label><input type='radio' name='people_level' value="3">가족과 함께</label>
               		<label><input type='radio' name='people_level' value="4">연인과 함께</label>
                   </div>
             
                    <div style="padding: 25px px 0px 0px">
                        <button type="submit" class="btn btn-ttc2 btn-block"><strong>검색</strong></button>
                    </div>
                </form>
                </div>
                  <!-- 사이드 바 끝-->
           <div class="board col-sm-9">
                   
            	  <!-- 게시물 정렬(masonry로 구현) 시작-->
                
                	
             <ul id="grid">
             <c:choose>
             	<c:when test="${fn:length(tourPlanJoinList) > 0}">
               		<c:forEach var="tourPlanJoin" items="${tourPlanJoinList}">
		                    <li class="item">
		                        <div class="item-box">
		                            <div class="item-content">
		                            	<c:url var="readUrl" value="/gazua/planinfo.do">
											<c:param name="id" value="${tourPlanJoin.id}" />
										</c:url>
		                                <a href="${readUrl}">
		                                	<img src="${tourPlanJoin.imagePath}" class="img" />
		                                </a>
		                                <h3 class="title">
		                                    <a href="${readUrl}" target="_blank">${tourPlanJoin.name }</a>
		                                </h3>
		                                <p class="state">${tourPlanJoin.intro} </p>
		                                <p class="nick">${tourPlanJoin.member_name2}</p>
		                            </div>
		                        </div>
		                    </li>
                    </c:forEach>
                	</c:when>
               	</c:choose>
               </ul>
		                
                
            </div>
                 <!-- 게시판 끝-->

        </div>
      
          
            </div>
        
              <!--  페이지네이션 시작-->
        <div class="row text-center" style="position:relative; left:120px;">

            <%@ include file="/WEB-INF/inc/review_bottom.jsp" %>	

        </div>
       		  <!--페이지네이션 끝-->

        </div>
          <!-- 메인 끝-->
	
	
    <%@ include file="/WEB-INF/inc/footer.jsp" %>
    
    <script src="../assets/plugins/masonry/masonry.pkgd.min.js"></script>
    
    <script type="text/javascript"> 
        $('#grid').masonry({
                itemSelector:'.item'
            });
    </script>
  	<script type="text/javascript">
  			$(document).ready(function(){ 
		     	$('.btn-ttc').click(function() { 
		       	 	$(this).toggleClass('active');
	          		$(".btn-ttc").not(this).removeClass("active");
		
		    	});
		 	});
		
   	</script>
		
	<script type="text/javascript">
		$(document).ready(function(){ 
		     $('.btn-ttc3').click(function() { 
		        $(this).toggleClass('active');
	            $(".btn-ttc3").not(this).removeClass("active");
		
		     });
		});

   	</script>
</body>
</html>
