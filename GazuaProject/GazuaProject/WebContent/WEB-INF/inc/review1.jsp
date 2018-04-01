<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
  
               <!-- 링크 바 끝-->

                 <!-- 사이드바 시작-->
             <div class="container " >
                <div class="row ">
                <div class="searchbar col-sm-3 text-center" style="padding-left: 0px; padding-right: 0px;">
                    <div style="text-align: center"><font color=black size=3><strong>검색 옵션</strong></font></div>
                  


                  <!-- 기간 드롭다운-->
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
                <input type="text" class="form-control">
                </div>
            </div>
              
               <!-- 인기 버튼-->
            
               <div style="padding: 10px 1px 2px 3px">
                   <button data-state="true"  class="btn btn-ttc3 btn-default">인기순</button>
                   <button data-state="false" class="btn btn-ttc3 btn-default">최신순</button>
               </div>

                 <div style="text-align: center; padding: 10px 1px 1px 1px"><font color=black size=3><strong>여행 테마</strong></font></div>
                
                <!-- 여행 테마 버튼-->
                   <div  style="padding: 10px 1px 2px 3px">
                    <button data-theme="0" class="btn btn-ttc alone"  >나홀로 여행</button>
                    <button data-theme="1" class="btn btn-ttc with-friend">친구와 함께</button>
                   </div>

                   <div  style="padding: 5px 1px 2px 3px">
                    <button data-theme="2" class="btn btn-ttc with-family" >가족과 함께</button>
                    <button data-theme="3" class="btn btn-ttc couple">연인과 함께</button>
                   </div>
             
                    <div style="padding: 25px px 0px 0px">
                        <button type="button" class="btn btn-ttc2 btn-block"><strong>검색</strong></button>
                    </div>
                </div>
                  <!-- 사이드 바 끝-->
                <div class="board col-sm-9">
                   
            	  <!-- 게시물 정렬(masonry로 구현) 시작-->
                <ul id="grid">
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img1.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">제목</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img2.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img3.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img4.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img5.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img5.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img5.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                    <li class="item">
                        <div class="item-box">
                            <div class="item-content">
                                <a href="#"><img src="img/img5.jpg" class="img" /></a>
                                <h3 class="title">
                                    <a href="#" target="_blank">프로필</a>
                                </h3>
                                <p class="state">경복궁의 경치와... </p>
                                <p class="nick">작성자 닉네임 </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
                 <!-- 게시판 끝-->

        </div>
      
          

        
              <!--  페이지네이션 시작-->
        <div class="row text-center">

            <div class="col-md-12">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a>
                    </li>
                    <li class="active"><a href="#">1</a>
                    </li>
                    <li><a href="#">2</a>
                    </li>
                    <li><a href="#">3</a>
                    </li>
                    <li><a href="#">4</a>
                    </li>
                    <li><a href="#">5</a>
                    </li>
                    <li><a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>

        </div>
       		  <!--페이지네이션 끝-->

      
          <!-- 메인 끝-->
</div>
        <footer>
            <hr>
            <address>
                Copyright&copy;2013. <a href="http://www.itpaper.co.kr">itpaper.co.kr</a>. All rights resurved
            </address>
        </footer>
        <!-- Javascript -->
   
        <script src="plugins/masonry/masonry.pkgd.min.js"></script>
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
     
     


