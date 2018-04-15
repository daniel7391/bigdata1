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
import gazua.model.Member;
import gazua.model.Review;
import gazua.service.ReviewService;
import gazua.service.impl.ReviewServiceImpl;


@WebServlet("/gazua/review_ok.do")
public class ReviewOk extends BaseController {

	private static final long serialVersionUID = -8079567002735062269L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	UploadHelper upload;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	ReviewService reviewService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		int tour_id = web.getInt("tour_id");
		int like_level = web.getInt("filterRating1");
		int people_level = web.getInt("filterRating2");
		int season = web.getInt("filterRating3");
		int member_id =2;
//		Map<String, String> paramMap = upload.getParamMap();
//		String tour_id = paramMap.get("tour_id");
//		String like_level = paramMap.get("filterRating1");
//		String people_level = paramMap.get("filterRating2");
//		String season = paramMap.get("filterRating3");
//		int member_id = 2;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo == null){
			web.redirect(null, "로그인하고 해라");
		}
		member_id = loginInfo.getMember_id();
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("tour_id=" + tour_id);
		logger.debug("like_level=" + like_level);
		logger.debug("people_level=" + people_level);
		logger.debug("season=" + season);
		logger.debug("member_id=" + member_id);
		
		Review review = new Review();
		review.setLike_level(like_level);
		review.setPeople_level(people_level);
		review.setSeason(season);
		review.setMember_id(member_id);
		review.setTour_id(tour_id);
		
		int count = 0;
		
		try {
			count = reviewService.selectReviewCountByMemberId(review);
		} catch (Exception e1) {
			sqlSession.close();
			web.redirect(null, e1.getLocalizedMessage());
			return null;
		}
		
		if(count == 0) {
			try {
				reviewService.insertReview(review);
				web.redirect(web.getRootPath() + "/gazua/placeinfo.do?id="+tour_id, "리뷰가 등록되었습니당.");
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		} else {
			sqlSession.close();
			web.redirect(null, "리뷰등록은 게시물당 한번만 해라..");
			return null;
		}
		
		sqlSession.close();
		return null;
	}
	
}
