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
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.model.Photo;
import gazua.model.PhotoTourInfo;
import gazua.model.ReviewSupport;
import gazua.model.TourPlan;
import gazua.service.MemberService;
import gazua.service.PhotoService;
import gazua.service.PhotoTourInfoService;
import gazua.service.TourPlanService;
import gazua.service.impl.MemberServiceImpl;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.PhotoTourInfoServiceImpl;
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
	MemberService memberService;
	PhotoTourInfoService photoTourInfoService;
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
		photoTourInfoService = new PhotoTourInfoServiceImpl(sqlSession, logger);
		
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		upload = UploadHelper.getInstance();
		
		int planId = web.getInt("id");
		if (planId == 0) {
			sqlSession.close();
			web.redirect(null, "먼가 이상합니다.");
			return null;
		}
		
		int planIdCount = 0;
		
		// 파라미터를 빈즈로 묶긔!
		TourPlan tourPlan = new TourPlan();
		tourPlan.setId(planId);
		
		Photo photo = new Photo();
		photo.setTourPlan_id(tourPlan.getId());
		
		PhotoTourInfo phototourinfo = new PhotoTourInfo();
		phototourinfo.setTourPlan_id(tourPlan.getId());
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		TourPlan readTourPlan = new TourPlan();
		Photo readPhoto = new Photo();
		List<PhotoTourInfo> readPhotoTourInfoList = null;
		
		ReviewSupport reviewSupport =new ReviewSupport();
		Member member = new Member();
		Member readMember = new Member();
		
		try {
			readTourPlan = tourPlanService.selectTourPlan(tourPlan);
			readPhoto = photoService.selectOnePhotoByTourPlanId(photo);
			
			readPhotoTourInfoList = photoTourInfoService.selectTourNameByPhoto(phototourinfo);
			
			member.setMember_id(readTourPlan.getMember_id());
			readMember = memberService.selectMember(member);
			planIdCount = photoService.selectTourIdByPlanIdCount(photo);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		logger.debug("member_id = " + member.getMember_id());
		logger.debug("name2 = " + readMember.getMember_name2());
		logger.debug("readPhoto = " + readPhoto.getDir());
		logger.debug("profile_img = " + readMember.getMember_profile_img());
		
		/** (7) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("reviewSupport", reviewSupport);
		request.setAttribute("readTourPlan", readTourPlan);
		request.setAttribute("readMember", readMember);
		request.setAttribute("readPhoto", readPhoto);
		request.setAttribute("planIdCount", planIdCount);
		request.setAttribute("readPhotoTourInfoList", readPhotoTourInfoList);
		
		String view = "gazua/planinfo";

		return view;
	}

}
