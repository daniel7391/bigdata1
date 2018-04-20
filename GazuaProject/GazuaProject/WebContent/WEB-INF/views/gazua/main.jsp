<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <%@ include file="/WEB-INF/inc/common.jsp" %>

        <!-- 시각적 확인을 위한 CSS 적용 -->
        <style type="text/css">
            <%@ include file="/assets/css/mainpage.css" %>
            .status{
            	width:255px;
            }
            .content-box{
            	width:723px;
            }
        	#carousel-example-generic{
        	width:740px;
        	}
        </style>
    </head>
    <body>
        <header>
        	<%@ include file="/WEB-INF/inc/header.jsp" %>
        </header>

        <!-- 본문 영역 -->
        <div id="back">
            <div class="container" id="midbar" style="position:relative; left:10px;">
                <div class="content-box pull-left" id="content-box">
                    <div class="summary">
                        <div id="carousel-example-generic" class="carousel slide"
                                data-ride="carousel">
                                <!-- 현재 위치 표시 -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0"
                                    class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <!-- 내용 영역 -->
                            <div class="carousel-inner" align="center">
                                <!-- 항목 (1) -->
                                <div class="item active">
                                    <img src="../assets/img/carousel_1.jpg" alt="슬라이더(1)" width="100%" height="100%">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h2>제목</h2>
                                            <p>내용</p>
                                            <p>
                                                <a href="#" class="btn btn-sm btn-primary">더 보기</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 항목 (2) -->
                                <div class="item">
                                    <img src="../assets/img/carousel_2.jpg" alt="슬라이더(2)" width="100%" height="100%">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h2>제목</h2>
                                            <p>내용내용</p>
                                            <p>
                                                <a href="#" class="btn btn-sm btn-primary">더 보기</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 항목 (3) -->
                                <div class="item">
                                    <img src="../assets/img/carousel_3.jpg" alt="슬라이더(3)" width="100%" height="100%">
                                    <div class="container">
                                        <div class="carousel-caption">
                                            <h2>제목</h2>
                                            <p>내용내용내용내용</p>
                                            <p>
                                                <a href="#" class="btn btn-sm btn-primary">더 보기</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- // 내용영역 구성 -->
                            <!-- 이동 버튼 -->
                            <a class="left carousel-control" href="#carousel-example-generic"
                                data-slide="prev"> <span class="icon-prev"></span>
                            </a> <a class="right carousel-control" href="#carousel-example-generic"
                                data-slide="next"> <span class="icon-next"></span>
                            </a>
                        </div><!-- 캐러셀 구획 끝 -->
                    </div><!-- summary -->
                </div>
                <div class="status pull-left">
                    <div class="guestArea">
                        <c:choose>
                            <c:when test="${loginInfo == null}">
								<%@ include file="/WEB-INF/views/function/login.jsp"%>
                            </c:when>
                            <c:otherwise>
								<%@ include file="/WEB-INF/views/function/loginInfo.jsp" %>
                            </c:otherwise>
                        </c:choose>
                        <!-- 아이디 찾기 모달 -->
                        <div class="modal" id="findId" aria-hidden="true">
                            <div class="modal-dialog" style="z-index: 1070 !important;">
                                <form name="findIdform" method="post" action="${pageContext.request.contextPath}/member/findId.do">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">아이디 찾기</h2>
                                </div>
                                <div>
                                    <div class="modal-body">
                                       <fieldset>
                                           <div class="form-group">
                                               <label for="find_id_email">이메일</label>
                                               <input type="email" name="find_id_email" id="find_id_email" class="form-control" />
                                           </div>
                                           <p>또는</p>
                                           <div class="form-group">
                                               <label for="find_id_name">이름</label>
                                               <input type="text" name="find_id_name" id="find_id_name" class="form-control" />
                                           </div>
                                       </fieldset>
                                       <span id="resultId"></span>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="#" data-dismiss="modal" class="btn">닫기</a>
                                    <button type="button" class="btn btn-primary" id="findIdButton">아이디찾기</button>
                                </div>
								</form>
                            </div>
                        </div><!-- 아이디모달끝 -->
                        <!-- 비밀번호 찾기 모달 -->
                        <div class="modal" id="findPw" aria-hidden="true">
                            <div class="modal-dialog" style="z-index: 1070 !important;">
                            	<form name="myform" method="post" action="${pageContext.request.contextPath}/member/findpw_ok.do">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h2 class="modal-title">비밀번호 찾기</h2>
                                </div>
                                <div>
                                    <div class="modal-body" style="height:110px;">
                                        <%@ include file="/WEB-INF/views/member/find_pw.jsp" %>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary btn-block">비밀번호 재설정 하기</button>
                                </div>
                                </form>
                            </div>
                        </div><!-- 비번모달끝 -->
                    </div>
                </div>
            </div>
            <div class="container" id="travels">
                <h3><strong>&nbsp;베스트 여행일정</strong></h3>
                <hr />
                <div class="row">
                    <div class="content-box pull-left" id="content-box">
                        <ul id="grid">
                        	<c:choose>
                        		<c:when test="${fn:length(tourPlanJoinList) > 0}">
                        			<c:forEach var="tourPlanJoin" items="${tourPlanJoinList}">
			                            <li class="item">
			                                <div class="item-box">
			                                    <div class="item-content">
			                                    	<c:url var="readUrl2" value="/gazua/planinfo.do">
														<c:param name="id" value="${tourPlanJoin.id}" />
													</c:url>
			                                        <a href="${readUrl2}"><img src="${tourPlanJoin.dir}" class="img" /></a>
			                                        
			                                     
			                                        <h3 class="title">
			                                            <a href="${readUrl2}">${tourPlanJoin.name}</a>
			                                        </h3>
			                                        <p class="state">${tourPlanJoin.member_name2} | 
			                                        	<c:choose>
						                            		<c:when test="${tourPlanJoin.theme==4}">
						                            			 가족과 함께
						                            		</c:when>
						                            		<c:when test="${tourPlanJoin.theme==3}">
						                            			 연인과 함께
						                            		</c:when>
						                            		<c:when test="${tourPlanJoin.theme==2}">
						                            			 친구와 함께
						                            		</c:when>
						                            		<c:otherwise>
						                            			 혼자서
						                            		</c:otherwise>
						                            	</c:choose>
			                                        </p>
			                                    </div>
			                                </div>
			                            </li>
                            		</c:forEach>
                            	</c:when>
                            </c:choose>
                        </ul>
                    </div><!-- content-box end -->
                </div><!-- row end -->
                <br />
                <h3><strong>&nbsp;최신 여행일정</strong></h3>
                <hr />
                <div class="row">
                    <div class="content-box pull-left" id="content-box">
                        <ul id="grid1">
                        	<c:choose>
                        		<c:when test="${fn:length(tourPlanJoinList2) > 0}">
                        			<c:forEach var="tourPlanJoin2" items="${tourPlanJoinList2}">
			                            <li class="item">
			                                <div class="item-box">
			                                    <div class="item-content">
			                                    	<c:url var="readUrl3" value="/gazua/planinfo.do">
														<c:param name="id" value="${tourPlanJoin2.id}" />
													</c:url>
			                                        <a href="${readUrl3}"><img src="${tourPlanJoin2.dir}" class="img" /></a>
			                                        
			                                     
			                                        <h3 class="title">
			                                            <a href="${readUrl3}">${tourPlanJoin2.name}</a>
			                                        </h3>
			                                        <p class="state">${tourPlanJoin2.member_name2} | 
			                                        	<c:choose>
						                            		<c:when test="${tourPlanJoin2.theme==4}">
						                            			 가족과 함께
						                            		</c:when>
						                            		<c:when test="${tourPlanJoin2.theme==3}">
						                            			 연인과 함께
						                            		</c:when>
						                            		<c:when test="${tourPlanJoin2.theme==2}">
						                            			 친구와 함께
						                            		</c:when>
						                            		<c:otherwise>
						                            			 혼자서
						                            		</c:otherwise>
						                            	</c:choose>
			                                        </p>
			                                    </div>
			                                </div>
			                            </li>
                            		</c:forEach>
                            	</c:when>
                            </c:choose>
                        </ul>
                    </div><!-- content-box end -->
                </div><!-- row end -->
            </div><!-- container end -->
        </div> <!-- back end -->
        <footer>
            <hr>
            <address>
                Copyright&copy;2018. <a href="http://www.itpaper.co.kr">gazua.co.kr</a>. All rights resurved
            </address>
        </footer>

        <script type="text/javascript">
            // modal
            $(document).on('hidden.bs.modal', function (event) {
                if ($('.modal:visible').length) {
                    $('body').addClass('modal-open');
                }
            });

            $(function(){
                $('#grid').masonry({
                    itemSelector:'.item'
                });

                $('#grid1').masonry({
                    itemSelector:'.item'
                });

                $("#findIdButton").click(function(e){
                	//console.log($("#find_id_email").val());
                	
                	$.post("${pageContext.request.contextPath}/member/findId.do",{
                		find_id_email : $("#find_id_email").val()
                	}, function(json){
                		if(json.rt != "OK"){
                			alert(json.rt);
                			return false;
                		}
                		//console.log(json.rt);
                		//console.log(json.item);
                		//console.log(json.item.member_user_id);
                		$("#resultId").html("아이디는 <strong>"+json.item.member_user_id+"</strong> 입니다.");
                	});
                });
                
                
            });

                //모달 검사
                //모달 아이디찾기
                /* $("#findId").submit(function(e){
                    e.preventDefault();

                    if(!regex.value("#find_id_email", "이메일을 입력하세요")){return false;}
                    if(!regex.email("#find_id_email", "이메일 유형이 아님")){return false;}

                    if(!regex.value("#user_name", "이름을 입력하세요")){return false;}
                    if(!regex.kor("#user_name", "이름은 한글")){return false;}
                    if(!regex.min_length("#user_name",2, "최소2자")){return false;}
                    if(!regex.max_length("#user_name",20, "최대20자")){return false;}
                });

                $("#findPw").submit(function(e){
                    if(!regex.value("#find_pw_id", "아이디를입력하세요")){return false;}
                    if(!regex.eng_num("#user_id", "영어와 숫자만")){return false;}
                    if(!regex.min_length("#user_id", 4, "4자까지만")){return false;}
                    if(!regex.max_length("#user_id", 20, "20자까지만")){return false;}

                    if(!regex.value("#find_pw_email", "이메일을 입력하세요")){return false;}
                    if(!regex.email("#find_pw_email", "이메일 유형이 아님")){return false;}
                }); */
            //});
        </script>
    </body>
</html>
