package gazua.controllers.tour;

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
import gazua.model.Likes;
import gazua.model.Member;
import gazua.model.TourPlan;
import gazua.service.LikesService;
import gazua.service.TourPlanService;
import gazua.service.impl.LikesServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;


@WebServlet("/gazua/likes_ok3.do")
public class LikeOk3 extends BaseController {
	
	private static final long serialVersionUID = -8730923679352071803L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsCommentService;
	TourPlanService tourPlanService;
	LikesService likesService;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
//		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		tourPlanService = new TourPlanServiceImpl(sqlSession, logger);
		likesService = new LikesServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		
		int plan_id = web.getInt("plan_id");
		
		TourPlan tourplan = new TourPlan();
		tourplan.setId(plan_id);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo == null){
			web.redirect(null, "로그인 후 눌러주세요!");
		}
		
		Likes likes1 = new Likes();
		likes1.setMember_id(loginInfo.getMember_id());
		likes1.setPlan_id(plan_id);
		
		logger.debug("plan_id" + plan_id);
		
		int count = 0;
		
		try {
			count = likesService.selectLikesCountByMemberIdAndPlan(likes1);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if (count == 0) {
			try {
				tourPlanService.updateLikes(tourplan);
				likesService.insertLikesByPlan(likes1);
				web.redirect(web.getRootPath() + "/gazua/planinfo.do?id="+plan_id, "추천 등록되었습니당.");
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		} else {
			try {
				tourPlanService.dedateLikes(tourplan);
				likesService.deleteLikesByPlan(likes1);
				web.redirect(web.getRootPath() + "/gazua/planinfo.do?id="+plan_id, "추천 취소되었습니당.");
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		sqlSession.close();
	
		return null;
	}

}
