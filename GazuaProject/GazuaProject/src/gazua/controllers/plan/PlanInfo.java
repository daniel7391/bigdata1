package gazua.controllers.plan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Photo;
import gazua.model.ReviewSupport;
import gazua.model.TourPlan;
import gazua.service.PhotoService;
import gazua.service.TourPlanService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;


@WebServlet("/gazua/planinfo.do")
public class PlanInfo extends BaseController {

	private static final long serialVersionUID = -4503110495523824817L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsDocumentService;
	TourPlanService tourPlanService;
	PhotoService photoService;
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
		
		tourPlanService = new TourPlanServiceImpl(sqlSession, logger);
		photoService = new PhotoServiceImpl(sqlSession, logger);
		
		upload = UploadHelper.getInstance();
		
		int planId = web.getInt("id");
		if (planId == 0) {
			sqlSession.close();
			web.redirect(null, "먼가 이상합니다.");
			return null;
		}
		
		// 파라미터를 빈즈로 묶긔!
		TourPlan tourPlan = new TourPlan();
		tourPlan.setId(planId);
		
		Photo photo = new Photo();
		photo.setTourPlan_id(tourPlan.getId());
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		TourPlan readTourPlan = null;
		Photo readPhoto = null;
		ReviewSupport reviewSupport =new ReviewSupport();
		
		
		try {
			readTourPlan = tourPlanService.selectTourPlan(tourPlan);
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("reviewSupport", reviewSupport);
		request.setAttribute("readTourPlan", readTourPlan);
		request.setAttribute("tourPlan", tourPlan);
		request.setAttribute("tourPlanService", tourPlanService);
		
		String view = "place/planinfo";

		return view;
	}

}
