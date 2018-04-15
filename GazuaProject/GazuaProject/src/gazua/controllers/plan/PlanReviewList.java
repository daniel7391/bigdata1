package gazua.controllers.plan;

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
import gazua.model.TourPlanJoin;
import gazua.service.PhotoService;
import gazua.service.TourPlanJoinService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourPlanJoinServiceImpl;

@WebServlet("/gazua/plan_review_list.do")
public class PlanReviewList extends BaseController {

	private static final long serialVersionUID = 6932927752756530460L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsDocumentService;
	TourPlanJoinService tourPlanJoinService;
	PhotoService photoService;
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
		
		tourPlanJoinService = new TourPlanJoinServiceImpl(sqlSession, logger);
	
		photoService = new PhotoServiceImpl(sqlSession, logger);
		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		int arrange = web.getInt("arrange");
		int people_level = web.getInt("people_level");

		TourPlanJoin tourplanjoin = new TourPlanJoin();
		Photo photo = new Photo();
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		tourplanjoin.setName(keyword);
		tourplanjoin.setIntro(keyword);
		tourplanjoin.setTheme(people_level);
		
		logger.debug("people_level="+tourplanjoin.getTheme());

		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<TourPlanJoin> tourPlanJoinList = null;
		
		if(arrange == 1){
			try {
				// 전체 게시물 수
				totalCount = tourPlanJoinService.selectTourPlanJoinCount(tourplanjoin);
				
				// 나머지 페이지 번호 계산하기
				// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
				pageHelper.pageProcess(page, totalCount, 9, 5);
	
				// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
				tourplanjoin.setLimitStart(pageHelper.getLimitStart());
				tourplanjoin.setListCount(pageHelper.getListCount());
				
				tourPlanJoinList = tourPlanJoinService.selectTourPlanJoinList(tourplanjoin);
				// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
				for (int i=0; i<tourPlanJoinList.size(); i++) {
					TourPlanJoin item = tourPlanJoinList.get(i);
					photo.setTourPlan_id(item.getId());
					
					Photo temp = photoService.selectOnePhotoByTourPlanId(photo);
					String temp2 = temp.getDir();
					
					item.setImagePath(temp2);
				}
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			} finally {
				sqlSession.close();
			}
		} else {
			try {
				// 전체 게시물 수
				totalCount = tourPlanJoinService.selectTourPlanJoinCount(tourplanjoin);
				
				// 나머지 페이지 번호 계산하기
				// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
				pageHelper.pageProcess(page, totalCount, 9, 5);
	
				// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
				tourplanjoin.setLimitStart(pageHelper.getLimitStart());
				tourplanjoin.setListCount(pageHelper.getListCount());
				
				tourPlanJoinList = tourPlanJoinService.selectTourPlanJoinList2(tourplanjoin);
				// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
				for (int i=0; i<tourPlanJoinList.size(); i++) {
					TourPlanJoin item = tourPlanJoinList.get(i);
					photo.setTourPlan_id(item.getId());
					
					Photo temp = photoService.selectOnePhotoByTourPlanId(photo);
					String temp2 = temp.getDir();
					
					item.setImagePath(temp2);
				}
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			} finally {
				sqlSession.close();
			}
		}
		

		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("tourPlanJoinList", tourPlanJoinList);
		// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
		request.setAttribute("keyword", keyword);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		// 갤러리 종류라면 View의 이름을 다르게 설정한다.
		String view = "gazua/plan_review_list";
		
		return view;
	}
	
}
