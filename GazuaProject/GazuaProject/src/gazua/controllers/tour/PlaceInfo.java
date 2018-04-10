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
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Photo;
import gazua.model.Review;
import gazua.model.ReviewSupport;
import gazua.model.TourInfo;
import gazua.service.PhotoService;
import gazua.service.ReviewService;
import gazua.service.TourInfoService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.ReviewServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;


@WebServlet("/gazua/placeinfo.do")
public class PlaceInfo extends BaseController {

	private static final long serialVersionUID = -8569857991599340698L;
	
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
	ReviewService reviewService;
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
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		
		upload = UploadHelper.getInstance();
		
		int placeId = web.getInt("id");
		if (placeId == 0) {
			sqlSession.close();
			web.redirect(null, "먼가 이상합니다.");
			return null;
		}
		
		// 파라미터를 빈즈로 묶긔!
		TourInfo tourInfo = new TourInfo();
		tourInfo.setId(placeId);
		
		Photo photo = new Photo();
		photo.setTour_id(tourInfo.getId());
		
		Review review = new Review();
		review.setTour_id(tourInfo.getId());
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		TourInfo readTourInfo = null;
		Photo readPhoto = null;
		List<Review> readReview = null;
		ReviewSupport reviewSupport =new ReviewSupport();
		
		
		try {
			readTourInfo = tourInfoService.selectTourInfo(tourInfo);
			readPhoto = photoService.selectOnePhotoByTourId(photo);
			readReview = reviewService.selectReviewListByTourId(review);
			
			reviewSupport.setVerygood(reviewService.selectLikeLevel4Count(review));
			reviewSupport.setGood(reviewService.selectLikeLevel3Count(review));
			reviewSupport.setSoso(reviewService.selectLikeLevel2Count(review));
			reviewSupport.setBad(reviewService.selectLikeLevel1Count(review));
			reviewSupport.setFamily(reviewService.selectPeopleLevel4Count(review));
			reviewSupport.setCouple(reviewService.selectPeopleLevel3Count(review));
			reviewSupport.setFriend(reviewService.selectPeopleLevel2Count(review));
			reviewSupport.setSolo(reviewService.selectPeopleLevel1Count(review));
			reviewSupport.setSpring(reviewService.selectSeasonLevel4Count(review));
			reviewSupport.setSummer(reviewService.selectSeasonLevel3Count(review));
			reviewSupport.setAutumn(reviewService.selectSeasonLevel2Count(review));
			reviewSupport.setWinter(reviewService.selectSeasonLevel1Count(review));
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("reviewSupport", reviewSupport);
		request.setAttribute("readTourInfo", readTourInfo);
		request.setAttribute("readPhoto", readPhoto);
		request.setAttribute("readReview", readReview);
		request.setAttribute("tourInfo", tourInfo);
		request.setAttribute("tourInfoService", tourInfoService);
		
		String view = "place/placeinfo";

		return view;
	}

}
