package gazua.controllers.tour;

import java.io.IOException;
import java.util.ArrayList;
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
import gazua.service.TourPlanService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourInfoServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;

@WebServlet("/gazua/tourinfolist2.do")
public class TourInfoList2 extends BaseController {
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
	TourPlanService tourPlanService;
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
		tourPlanService = new TourPlanServiceImpl(sqlSession, logger);
		
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();

		List<Integer> tourIdList = null;
		List<TourInfo> tourInfoList = new ArrayList();
		Photo photo = new Photo();
		TourInfo tourinfo = new TourInfo();
		TourInfo item = new TourInfo();
		
		int plan_id = web.getInt("plan_id");
		photo.setTourPlan_id(plan_id);
		
		try {
			tourIdList = photoService.selectTourIdByPlanId(photo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("플랜아뒤" + plan_id);
		logger.debug("우아1" + tourIdList.size());
		for(int i = 0; i<tourIdList.size(); i++) {
			tourinfo.setId(tourIdList.get(i));
			
			try {
				item = tourInfoService.selectTourInfo(tourinfo);
				tourInfoList.add(i,item);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		for (int i=0; i<tourInfoList.size(); i++) {
			TourInfo item2 = tourInfoList.get(i);
			photo.setTour_id(item2.getId());
			
			Photo temp = new Photo();
			
			try {
				temp = photoService.selectOnePhotoByTourId(photo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String temp2 = temp.getDir();
			
			item2.setImagePath(temp2);
		}

		sqlSession.close();
		logger.debug("우아2" + tourInfoList.size());
		
		request.setAttribute("tourInfoList", tourInfoList);
		// 갤러리 종류라면 View의 이름을 다르게 설정한다.
		String view = "gazua/tourinfolist2";

		return view;
	}
}
