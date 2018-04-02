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
import gazua.model.TourInfo;
import gazua.service.PhotoService;
import gazua.service.TourInfoService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/gazua/main.do")
public class MainPage extends BaseController {
	private static final long serialVersionUID = 7451188376237341861L;
	
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;

	TourInfoService tourInfoService;
	PhotoService photoService;
	// --> import study.jsp.helper.PageHelper;
	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		tourInfoService = new TourInfoServiceImpl(sqlSession, logger);
		photoService = new PhotoServiceImpl(sqlSession, logger);
		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		String keyword = web.getString("keyword");

		TourInfo tourinfo = new TourInfo();
		Photo photo = new Photo();
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		tourinfo.setName(keyword);
		tourinfo.setIntro(keyword);

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
			// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
			for (int i=0; i<tourInfoList.size(); i++) {
				TourInfo item = tourInfoList.get(i);
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


		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("tourInfoList", tourInfoList);
		// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
		request.setAttribute("keyword", keyword);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "gazua/main";
	}

}
