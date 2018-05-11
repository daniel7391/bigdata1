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
import gazua.model.TourInfo;
import gazua.service.LikesService;
import gazua.service.TourInfoService;
import gazua.service.impl.LikesServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;


@WebServlet("/gazua/likes_ok.do")
public class LikeOk extends BaseController {
	
	private static final long serialVersionUID = -8730923679352071803L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsCommentService;
	TourInfoService tourInfoService;
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
		tourInfoService = new TourInfoServiceImpl(sqlSession, logger);
		likesService = new LikesServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		
		int tour_id = web.getInt("tour_id");
		
		TourInfo tourinfo = new TourInfo();
		tourinfo.setId(tour_id);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo == null){
			web.redirect(null, "로그인하고 눌러주세요!");
		}
		
		Likes likes1 = new Likes();
		likes1.setMember_id(loginInfo.getMember_id());
		likes1.setTour_id(tour_id);
		
		logger.debug("tour_id" + tour_id);
		
		int count = 0;
		
		try {
			count = likesService.selectLikesCountByMemberId(likes1);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if (count == 0) {
			try {
				tourInfoService.updateLikes(tourinfo);
				likesService.insertLikesByPlace(likes1);
				web.redirect(web.getRootPath() + "/gazua/placeinfo.do?id="+tour_id, "좋아요가 등록되었습니당.");
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		} else {
			try {
				tourInfoService.dedateLikes(tourinfo);
				likesService.deleteLikesByPlace(likes1);
				web.redirect(web.getRootPath() + "/gazua/placeinfo.do?id="+tour_id, "좋아요가 취소되었습니당.");
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
