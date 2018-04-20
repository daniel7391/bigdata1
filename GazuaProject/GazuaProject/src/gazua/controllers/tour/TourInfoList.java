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
import gazua.model.Photo;
import gazua.model.Tour;
import gazua.model.TourInfo;
import gazua.service.PhotoService;
import gazua.service.TourInfoService;
import gazua.service.TourService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;
import gazua.service.impl.TourServiceImpl;

@WebServlet("/gazua/tourinfolist.do")
public class TourInfoList extends BaseController {
	private static final long serialVersionUID = -7786870605257149925L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsDocumentService;
	TourInfoService tourInfoService;
	PhotoService photoService;
	TourService tourService;
	// --> import study.jsp.helper.PageHelper;
	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		tourInfoService = new TourInfoServiceImpl(sqlSession, logger);
		photoService = new PhotoServiceImpl(sqlSession, logger);
		tourService = new TourServiceImpl(sqlSession, logger);
		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();

//		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
//		String category = web.getString("category");
//		request.setAttribute("category", category);

		/** (4) 존재하는 게시판인지 판별하기 */
//		try {
//			String bbsName = bbs.getBbsName(category);
//			request.setAttribute("bbsName", bbsName);
//		} catch (Exception e) {
//			sqlSession.close();
//			web.redirect(null, e.getLocalizedMessage());
//			return null;
//		}

		/** (5) 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		int keyword2 =web.getInt("location_gu");
		
		TourInfo tourinfo = new TourInfo();
		Photo photo = new Photo();
		Tour tour = new Tour();
		Tour tour2 = new Tour();
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		tourinfo.setName(keyword);
		tourinfo.setIntro(keyword);
		tourinfo.setTourCode(keyword2);
		tour.setTourCode(keyword2);
		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<TourInfo> tourInfoList = null;
		
		
		try {
			// 전체 게시물 수
			totalCount = tourInfoService.selectTourInfoCount(tourinfo);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 8, 5);

			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			tourinfo.setLimitStart(pageHelper.getLimitStart());
			tourinfo.setListCount(pageHelper.getListCount());
			
			tourInfoList = tourInfoService.selectTourInfoList(tourinfo);
			tour2 = tourService.selectTour(tour);
			// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
			for (int i=0; i<tourInfoList.size(); i++) {
				TourInfo item = tourInfoList.get(i);
				photo.setTour_id(item.getId());
				
				Photo temp = photoService.selectOnePhotoByTourId(photo);
				String temp2 = temp.getDir();
				
				item.setMeetCnt(photoService.selectCountTourInfoWithTourPlan(photo));
				item.setImagePath(temp2);
			}
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		

		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("tourInfoList", tourInfoList);
		request.setAttribute("tour2", tour2);
		
		// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
		request.setAttribute("keyword", keyword);
		request.setAttribute("keyword2", keyword2);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		// 갤러리 종류라면 View의 이름을 다르게 설정한다.
		String view = "gazua/tourinfolist";

		return view;
	}
}
