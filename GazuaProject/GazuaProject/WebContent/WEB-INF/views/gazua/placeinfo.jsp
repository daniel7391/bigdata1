<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<style type="text/css">
            *{
                list-style: none;
            }
            body{
                padding-top: 0px;
                padding-bottom: 20px;
            }
            #content-box .summary {
                margin-top: 10px;
                margin-left: -9px;
                width: 700px;
            }
            #content-box .summary > h3 {
                margin-top: 2px;
                padding-top: 2px;
            }
            .photo {
                margin-left: -9px;
                width: 700px;
                height: 500px;
            }
            .container {
                width: 1011px;
            }
            .status {
                background: white;
                width: 287px;
                margin-top: 10px;
                margin-left: 3px;
                position: relative;
                right: -9px;
                height: 602px;
            }
            #back {
                background: #EBEBEB;
                margin-top: -20px;
            }
            .nav-tabs {
                background: white;
            }
            .review {
                padding-top: 0;
                background: white;
            }
            #review-box {
                margin-top: 20px;
                width: 1000px;
                background: white;
            }
            .summary {
                height: 60px;
                background: white;
            }
            .summary .btn {
                position: relative;
                left: 580px;
                bottom: 60px;
                width: 100px;
                height: 50px;
            }
            .filterLabel {
                 height: 20px;
            }
            #gmap { width: 700px; height: 500px; background: black;}
            #like {
                background: white;
                border: 0.5px solid gainsboro;
            }
            #entry {
                position: relative;
                right: -880px;
            }
            #summary {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            p {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .status p {
                color: #888;
            }
        	
        	#contents {
        		position: relative;
        		left: 80px;
        	}
        	.carousel-inner .item {
        		width: 700px;
        		height: 500px;
        	}

        </style>

<%@ include file="/WEB-INF/inc/common.jsp" %>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
</header>

        <!-- 본문 영역 -->
        <div id="back">
            <div class="container" id="contents">
                <div class="content-box pull-left" id="content-box">
                    <div class="summary">
                        <h3>&nbsp;<strong>${readTourInfo.name}</strong></h3>
                        <p id="summary" style="width: 550px; color: #888">&nbsp;&nbsp;${readTourInfo.intro}</p>
                        <div id="rating">
                            <button class="btn like" id="like" style="height: 45px;">좋아요! (<span class="likes">0</span>)</button>
                        </div>
                    </div>
                    <div class="photo" style="width: 700px;">
                        <div class="tab-content">
                            <div class="tab-pane" id="picture">
                                <!-- 캐러셀 영역 구성 -->
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- 현재 위치 표시 -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                    </ol>

                                    <!-- 내용 영역 -->
                                    <div class="carousel-inner">
                                        <!-- 항목 (1) -->
                                        <div class="item active">
                                            <img src="${readPhoto.dir}" alt="슬라이더(1)">
                                        </div>

                                        <!-- 항목 (2) -->
                                        <div class="item">
                                            <img src="${readPhoto.dir}"alt="슬라이더(2)">
                                        </div>

                                        <!-- 항목 (3) -->
                                        <div class="item">
                                            <img src="${readPhoto.dir}" alt="슬라이더(3)">
                                        </div>
                                    </div>
                                    <!-- // 내용영역 구성 -->

                                    <!-- 이동 버튼 -->
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
                                </div>
                                <!-- 캐러셀 영역 끝 -->
                            </div>

                            <div class="tab-pane active" id="map">
                                <div id="gmap"></div>
                            </div>
                        </div>
                        <!-- 탭 메뉴 시작 -->
                        <ul class="nav nav-tabs">
                            <li><a href="#picture" data-toggle="tab">사진</a></li>
                            <li class="active"><a href="#map" data-toggle="tab">지도</a></li>
                        </ul>
                    </div>
                </div>
                <div class="status pull-left">
                    <h3>&nbsp;&nbsp;<strong>기본정보</strong></h3>
                    <hr />
                    <h5>&nbsp;&nbsp;<strong>주소</strong></h5>
                    <p>&nbsp;&nbsp;${readTourInfo.addr1}<br/>&nbsp;&nbsp;${readTourInfo.addr2}</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>비용</strong></h5>
                    <p>&nbsp;&nbsp;3000원(만 24세 이하, 65세 이상 무료)</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>가는 방법</strong></h5>
                    <p>&nbsp;&nbsp;지하철 3호선 경복궁역 5번 출구</p>
                    <br />
                    <h5>&nbsp;&nbsp;<strong>휴무</strong></h5>
                    <p>&nbsp;&nbsp;${readTourInfo.holiday1}</p>
                </div>
            </div>

            <div class="container" id="review-box">
                <div class="review">
                    <h3><strong>리 뷰</strong></h3>
                    <form class="col-md-4">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem">

                                    <span class="toggle pull-left">
                                        <input type="radio" name="filterRating" value="0" class="filterInput"/>
                                    </span>
                                    <label class="filterLabel" style="width: 90%;">
                                        <label class="pull-left" style="width: 30%;">&nbsp;아주 좋음</label>
                                        <div class="progress pull-left" style="width: 55%;  border: 1px solid black; height: 15px; margin-top: 5px;">
                                            <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                            <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                                <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                        <span class="pull-left hit">&nbsp;&nbsp;3</span>
                                    </label>

                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="1" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;좋음</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="2" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;보통</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="3" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;별로</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                        </ul>
                    </form>
                    <form class="col-md-4">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="4" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;가족</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="5" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;커플</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="6" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;친구</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="7" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;혼자</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                        </ul>
                    </form>
                    <form class="col-md-4">
                        <ul style="padding-left: 0px;">
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="8" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;3~5월</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="9" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;6~8월</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="10" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;9~11월</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                            <li class="filterItem">
                                <span class="toggle pull-left">
                                    <input type="radio" name="filterRating" value="11" class="filterInput" />
                                </span>
                                <label class="filterLabel" style="width: 90%;">
                                    <label class="pull-left" style="width: 30%;">&nbsp;12~2월</label>
                                    <div class="progress pull-left" style="width: 55%; border: 1px solid black; height: 15px; margin-top: 5px;">
                                        <!-- 진행상태를 위한 그래픽 박스 >> style 속성으로 넓이를 지정해 준 것에 주의 합시다. -->
                                        <div class="progress-bar pull-left" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <!-- 웹 접근성을 위한 스크린 리더 전용 부분 처리 -->
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <span class="pull-left hit">&nbsp;&nbsp;600</span>
                                </label>
                            </li>
                        </ul>
                    </form>
                    <div><button type="submit" id="entry" class="btn btn-primary" >리뷰등록</button></div>
                </div>

                <h3><strong>댓 글</strong></h3>

                <div id="comments-container">
                </div>

                <h3><strong>이 명소가 포함된 인기 여행일정</strong></h3>
                <hr />

                <div class="row">
                    <!-- 게시물 하나 시작 -->
                    <div class="col-sm-6 col-md-4">
                        <a href="#" style="color: black;">
                            <div class="thumbnail">
                                <img alt="경복궁 찾아가기" src="img/mapKyung.jpg">
                                    <h3><strong>경복궁 찾아가기</strong></h3>
                                    <p>뚜벅이는 웁니다 ㅠㅠ</p>
                            </div>
                        </a>
                    </div>
                    <!-- 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div class="col-sm-6 col-md-4">
                        <a href="#" style="color: black;">
                            <div class="thumbnail">
                                <img alt="야간의 경복궁" src="img/Kyung2.jpg">
                                    <h3><strong>야간에 이쁜 경복궁</strong></h3>
                                    <p>야간에도 아름다운 경복궁에서 연인과 데이트를...!</p>
                            </div>
                        </a>
                    </div>
                    <!--// 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div class="col-sm-6 col-md-4">
                        <a href="#" style="color: black;">
                            <div class="thumbnail">
                                <img alt="경복궁역에서" src="img/Kyungyuk.jpg">
                                    <h3><strong>경복궁역에서</strong></h3>
                                    <p>지옥철을 뚫고 도착한 3호선 경복궁역!</p>
                            </div>
                        </a>
                    </div>
                    <!--// 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div class="col-sm-6 col-md-4">
                        <a href="#" style="color: black;">
                            <div class="thumbnail">
                                <img alt="경복궁 견학" src="img/Kyung.jpg">
                                    <h3><strong>경복궁 견학</strong></h3>
                                    <p>우리나라 최고의 궁궐에서 견학을 하게 되었다.</p>
                            </div>
                        </a>
                    </div>
                    <!--// 게시물 하나 끝 -->
                </div>

            </div>
        </div> <!-- back end -->


        <footer>
            <hr>
            <address>
                Copyright&copy;2018. <a href="http://www.itpaper.co.kr">gazua.co.kr</a>. All rights resurved
            </address>
        </footer>
        <!-- Javascript -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyADQrU-P9ctHF0Qmtq1py2L3d3-l8a_2Ig"></script>
        <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

        <!-- Libraries -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.textcomplete/1.8.0/jquery.textcomplete.js"></script>
        <script type="text/javascript" src="plugins/jquery-comments-master/js/jquery-comments.js"></script>
        <script type="text/javascript" src="plugins/gmaps/gmaps.min.js"></script>
        <script src="plugins/like-dislike-master/js/like-dislike.min.js"></script>

        <!-- Data -->
        <script type="text/javascript" src="plugins/jquery-comments-master/data/comments-data.js"></script>

        <script type="text/javascript">
            $(function(){

                var counter = [[${reviewSupport.verygood},${reviewSupport.good},${reviewSupport.soso},${reviewSupport.bad}],
                			[${reviewSupport.family},${reviewSupport.couple},${reviewSupport.friend},${reviewSupport.solo}],
                			[${reviewSupport.spring},${reviewSupport.summer},${reviewSupport.autumn},${reviewSupport.winter}]];

                for(var i=0; i<3 ; i++){
                    for(var j=0; j<4; j++){
                        $("form:nth-child("+(i+2)+") li:nth-child("+(j+1)+") .hit").html(counter[i][j]);
                    }
                }

                $("#entry").click(function(){
                    var check_list = $(".filterInput:checked");


                    if (check_list.length == 0) {
                        alert("선택된 항목이 없습니다.");
                        return false;
                    } else {
                        alert("리뷰가 등록되었습니다.")
                    }

                    for (var i=0; i<check_list.length; i++){
                        var num1 = parseInt($(check_list[i]).val()/4);
                        var num2 = $(check_list[i]).val()%4;

                        counter[num1][num2]++;
                    }

                    for(var i=0; i<3 ; i++){
                        for(var j=0; j<4; j++){
                            $("form:nth-child("+(i+2)+") li:nth-child("+(j+1)+") .hit").html(counter[i][j]);
                        }
                    }
                });




                /** 표시할 위치에 대한 위도,경도 */
                var lat_value = ${readTourInfo.y};
                var lng_value = ${readTourInfo.x};

                /** 지도 표시하기 */
                var map = new GMaps({
                    el: '#gmap',        // 지도를 표시할 div의 id값.
                    lat: lat_value,     // 지도가 표시될 위도
                    lng: lng_value,     // 지도가 표시될 경도
                    zoomControl: true   // 줌 컨트롤 사용 여부
                });

                /** 표시중인 위치에 마커 추가 */
                // 필요한 만큼 반복하면 마커가 여러 개 표시된다.
               map.addMarker({
                // 마우스 오버시 노란 박스
                title: '${readTourInfo.name}',
                lat: lat_value,		// 마커가 표시될 위도
                lng: lng_value,		// 마커가 표시될 경도
                icon: {				// 사용자 정의 아이콘
                    url: "../assets/img/marker3.png",
                    scaledSize: new google.maps.Size(15, 15)
                },
                
            });

                var saveComment = function(data) {


                    // Convert pings to human readable format
                    $(data.pings).each(function(index, id) {
                        var user = usersArray.filter(function(user){return user.id == id})[0];
                        data.content = data.content.replace('@' + id, '@' + user.fullname);
                    });

                    return data;
                }
                $('#comments-container').comments({
                    profilePictureURL: 'https://viima-app.s3.amazonaws.com/media/user_profiles/user-icon.png',
                    currentUserId: 1,
                    roundProfilePictures: true,
                    textareaRows: 1,
                    enableAttachments: true,
                    enableHashtags: true,
                    enablePinging: true,
                    getUsers: function(success, error) {
                        setTimeout(function() {
                            success(usersArray);
                        }, 500);
                    },
                    getComments: function(success, error) {
                        setTimeout(function() {
                            success(commentsArray);
                        }, 500);
                    },
                    postComment: function(data, success, error) {
                        setTimeout(function() {
                            success(saveComment(data));
                        }, 500);
                    },
                    putComment: function(data, success, error) {
                        setTimeout(function() {
                            success(saveComment(data));
                        }, 500);
                    },
                    deleteComment: function(data, success, error) {
                        setTimeout(function() {
                            success();
                        }, 500);
                    },
                    upvoteComment: function(data, success, error) {
                        setTimeout(function() {
                            success(data);
                        }, 500);
                    },
                    uploadAttachments: function(dataArray, success, error) {
                        setTimeout(function() {
                            success(dataArray);
                        }, 500);
                    },
                });


            });
            $('#rating').likeDislike({
                initialValue: 0,
                click: function (value, l, d, event) {
                    var likes = $(this.element).find('.likes');
                    var dislikes = $(this.element).find('.dislikes');

                    likes.text(parseInt(likes.text()) + l);
                    dislikes.text(parseInt(dislikes.text()) + d);

                    // $.ajax({
                    //     url: 'url',
                    //     type: 'post',
                    //     data: 'value=' + value,
                    // });
                }
            });
            
        </script>
<%@ include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>



