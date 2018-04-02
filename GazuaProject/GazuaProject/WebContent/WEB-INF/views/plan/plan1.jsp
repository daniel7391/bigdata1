<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="container">
       <div class="planHeader">
                    <div class="jumbotron">
                        <h1>일정 제목</h1>
                        <p>
                            <a class="btn btn-warning btn-sm" role="button">수정</a>
                        </p>
                    </div>
                </div>
                <div class="planBody">
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
		    <input type="text" placeholder="지역구로 검색">
		</li>
		<li>
		    <input type="text" placeholder="여행지명으로 검색">
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
                                                <h4 class="media-heading pull-left">창덕궁</h4>
                                                <p>
                                                Twitter Bootstrap 정말 좋은 것 같습니다.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="pull-right" style="padding-top:30px;">
                                                <button href="#" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></button>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <a class="pull-left" href="#"><img src="img/chang.jpg" width="60" height="60" align="Generic placeholder image"></a>
                                        <div class="media-body">
                                            <div class="clearfix">
                                                <h4 class="media-heading pull-left">창덕궁</h4>
                                                <p>
                                                Twitter Bootstrap 정말 좋은 것 같습니다.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="pull-right" style="padding-top:30px;">
                                                <button href="#" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></button>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <a class="pull-left" href="#"><img src="img/chang.jpg" width="60" height="60" align="Generic placeholder image"></a>
                                        <div class="media-body">
                                            <div class="clearfix">
                                                <h4 class="media-heading pull-left">창덕궁</h4>
                                                <p>
                                                Twitter Bootstrap 정말 좋은 것 같습니다.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="pull-right" style="padding-top:30px;">
                                                <button href="#" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-plus"></i></button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="planRight">
                        <div>
                            <div class="passData" style="width: 100%; height: 300px; background-color: #eee;">
                                <input type="text" class="first" placeholder="여행 간단 소개" style="height: 50px;">
                                <input type="text" class="second" placeholder="여행 일정 소개">
                                <div class="form-group">
                                    <label for="start">여행시작일</label>
                                    <input type="date" style="height: 24px;">
                                </div>
                                <div class="form-group">
                                    <label>일</label>
                                    <input type="text" placeholder="여행 일수" style="width: 80px">
                                </div>
                                <div class="form-group">
                                    <label>명</label>
                                    <input type="text" placeholder="여행 인원" style="width: 80px">
                                </div>
                                <div class="form-group">
                                    <label>여행테마</label>
                                    <button type="button" class="btn btn-default">나홀로 여행</button>
                                    <button type="button" class="btn btn-default">친구와 함께</button>
                                    <button type="button" class="btn btn-default">가족과 함께</button>
                                    <button type="button" class="btn btn-default">연인과 함께</button>
                                </div>
                            </div>

                            <div class="tab">
                                <ul class="tab-button clearfix">
                                    <li class="tab-button-item pull-left">
                                        <a class="tab-button-item-link selected" href="#tab-page-1">지도/일정</a>
                                    </li>
                                    <li class="tab-button-item pull-left">
                                        <a class="tab-button-item-link" href="#tab-page-2">스토리</a>
                                    </li>
                                </ul>

                                <div class="tab-panel">
                                    <div id="tab-page-1">
                                        <div class="tab-pane active" id="map">
                                            <div id="gmap"></div>
                                            <table>
                                                <!--JavaScript/js09/06-date(2)-->
                                                <thead>
                                                    <tr>
                                                        <th>Time</th>
                                                        <th>Day1/3월7일</th>
                                                        <th>Day2/3월8일</th>
                                                        <th>Day3/3월9일</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <tr class="item">
                                                        <td>AM 06:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 07:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 08:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 09:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 10:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 11:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 12:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 01:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 02:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 03:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 04:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 05:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 06:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 07:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 08:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 09:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 10:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>PM 11:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                     <tr class="item">
                                                        <td>AM 00:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 01:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 02:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 03:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 04:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                    <tr class="item">
                                                        <td>AM 05:00</td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                        <td><input type="text" class="input"/></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div id="tab-page-2" class="hide">
                                        <ul>
                                            <li>
                                                <ul class="DayPlan">
                                                    <li>Day.1&nbsp;2018.03.07</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul class="DayPlan">
                                                    <li>Day.2&nbsp;2018.03.08</li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul class="DayPlan">
                                                    <li>Day.3&nbsp;2018.03.09</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>
        </div>
