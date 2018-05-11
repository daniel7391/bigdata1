package gazua.controllers.tour;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.PageHelper;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.model.Photo;
import gazua.model.Tour;
import gazua.model.TourInfo;
import gazua.service.PhotoService;
import gazua.service.TourInfoService;
import gazua.service.TourService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;
import gazua.service.impl.TourServiceImpl;

@WebServlet("/gazua/plan.do")
public class Plan extends BaseController {
   private static final long serialVersionUID = -8575478089395934020L;

   /** (1) 사용하고자 하는 Helper 객체 선언 */
   Logger logger;
   SqlSession sqlSession;
   WebHelper web;
   
   TourInfoService tourInfoService;
   PhotoService photoService;
   PageHelper pageHelper;
   UploadHelper upload;
   
   TourService tourService;
   
   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      /** (2) 사용하고자하는 Helper+Service 객체 생성 */
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      
      photoService = new PhotoServiceImpl(sqlSession, logger);
      pageHelper = PageHelper.getInstance();
      upload = UploadHelper.getInstance();

      tourInfoService = new TourInfoServiceImpl(sqlSession, logger);
      tourService = new TourServiceImpl(sqlSession, logger);
      
      /** (3) 조회할 정보에 대한 Beans 생성 */
      Tour tour = new Tour();
      // 검색어
      String keyword = web.getString("keyword");
      TourInfo tourinfo = new TourInfo();
      Photo photo = new Photo();

      // 현재 페이지 수 --> 기본값은 1페이지로 설정함
      int page = web.getInt("page", 1);

      // 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
      tourinfo.setName(keyword);
      tourinfo.setIntro(keyword);
      
//      Member loginInfo = (Member) web.getSession("loginInfo");
//      if (loginInfo == null){
//			web.redirect(null, "로그인 후에 이용가능한 기능입니다.");
//      }
//      
//      logger.debug("로그인 :" +loginInfo.getMember_id());

      /** (4) 게시글 목록 조회 */
      List<Tour> tourList = null;
      int totalCount = 0;
      List<TourInfo> tourInfoList = null;
      List<TourInfo> test = null;

      try {
         // 전체 게시물 수
         totalCount = tourInfoService.selectTourInfoCount(tourinfo);
         tourList = tourService.selectTourList(tour);
         test = tourInfoService.selectTourInfoListSecond(tourinfo);
         // 나머지 페이지 번호 계산하기
         // --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
         pageHelper.pageProcess(page, totalCount, 5, 6);

         // 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
         tourinfo.setLimitStart(pageHelper.getLimitStart());
         tourinfo.setListCount(pageHelper.getListCount());   
         tourInfoList = tourInfoService.selectTourInfoList(tourinfo);
         for (int i=0; i<test.size(); i++) {
            TourInfo item = test.get(i);
            photo.setTour_id(item.getId());
            
            Photo temp = photoService.selectOnePhotoByTourId(photo);
            String temp2 = temp.getDir();
            
            item.setImagePath(temp2);
         }
      } catch (Exception e) {
         web.redirect(null, e.getLocalizedMessage());
         return null;
      } finally {
         sqlSession.close();
      }
      
      /** (5) 조회 결과를 View에 전달 */
      request.setAttribute("tourList", tourList);
      request.setAttribute("tourInfoList", tourInfoList);
      // 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
      request.setAttribute("keyword", keyword);
      // 페이지 번호 계산 결과를 View에 전달
      request.setAttribute("pageHelper", pageHelper);
      request.setAttribute("test", test);
      
      
      return "gazua/plan";
   }

}