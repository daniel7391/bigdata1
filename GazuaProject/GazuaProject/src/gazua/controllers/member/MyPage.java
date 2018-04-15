package gazua.controllers.member;

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
import gazua.model.TourInfoJoin;
import gazua.model.TourPlanJoin;
import gazua.service.MemberService;
import gazua.service.PhotoService;
import gazua.service.TourInfoJoinService;
import gazua.service.TourPlanJoinService;
import gazua.service.impl.MemberServiceImpl;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourInfoJoinServiceImpl;
import gazua.service.impl.TourPlanJoinServiceImpl;

/**
 * Servlet implementation class MyPage
 */
@WebServlet("/member/mypage.do")
public class MyPage extends BaseController {

	private static final long serialVersionUID = -5848845174089078488L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	TourPlanJoinService tourPlanJoinService;
	TourInfoJoinService tourInfoJoinService;
	PhotoService photoService;
	MemberService memberService;
	// --> import study.jsp.helper.PageHelper;
	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
	
		tourPlanJoinService = new TourPlanJoinServiceImpl(sqlSession, logger);
		tourInfoJoinService = new TourInfoJoinServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(sqlSession, logger);
		photoService = new PhotoServiceImpl(sqlSession, logger);
		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
		TourPlanJoin tourplanjoin = new TourPlanJoin();
		TourInfoJoin tourInfoJoin = new TourInfoJoin();
		Photo photo = new Photo();
		Photo photo2 = new Photo();
		Member member = new Member();
		Member readMember = new Member();
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		int totalCount = 0;
		List<TourPlanJoin> tourPlanJoinList = null;
		List<TourInfoJoin> tourInfoJoinList = null;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		tourplanjoin.setMember_id(loginInfo.getMember_id());
		tourInfoJoin.setMember_id(loginInfo.getMember_id());
		
		member.setMember_id(loginInfo.getMember_id());
		
		try {
			// 전체 게시물 수
			totalCount = tourPlanJoinService.selectTourPlanJoinCount2(tourplanjoin);
			readMember = memberService.selectMember(member);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 4, 5);

			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			tourplanjoin.setLimitStart(pageHelper.getLimitStart());
			tourplanjoin.setListCount(pageHelper.getListCount());
			
			tourPlanJoinList = tourPlanJoinService.selectTourPlanJoinList3(tourplanjoin);
			tourInfoJoinList = tourInfoJoinService.selectTourInfoJoin(tourInfoJoin);
			
			
			
			// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
			for (int i=0; i<tourPlanJoinList.size(); i++) {
				TourPlanJoin item = tourPlanJoinList.get(i);
				photo.setTourPlan_id(item.getId());
				
				Photo temp = photoService.selectOnePhotoByTourPlanId(photo);
				String temp2 = temp.getDir();
				
				item.setImagePath(temp2);
			}
			for (int i=0; i<tourInfoJoinList.size(); i++) {
				TourInfoJoin item = tourInfoJoinList.get(i);
				photo2.setTour_id(item.getId());
				
				Photo temp = photoService.selectOnePhotoByTourId(photo2);
				String temp2 = temp.getDir();
				
				item.setImagePath(temp2);
			}
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		logger.debug("dddfsdfds : " + readMember.getMember_profile_img());
		
		request.setAttribute("tourPlanJoinList", tourPlanJoinList);
		request.setAttribute("tourInfoJoinList", tourInfoJoinList);
		request.setAttribute("readMember", readMember);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "member/mypage";
	}
}
