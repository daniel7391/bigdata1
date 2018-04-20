package gazua.controllers.plan;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.RegexHelper;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.model.Photo;
import gazua.model.TourPlan;
import gazua.service.PhotoService;
import gazua.service.TourPlanService;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;

/**
 * Servlet implementation class TourPlanWriteOk
 */
@WebServlet("/plan/tourplan_write_ok.do")
public class TourPlanWriteOk extends BaseController {

   private static final long serialVersionUID = -3124932334013469961L;
   Logger logger;
   // --> import org.apache.ibatis.session.SqlSession;
   SqlSession sqlSession;
   // --> import study.jsp.helper.WebHelper;
   WebHelper web;
   // --> import study.jsp.helper.UploadHelper;
   UploadHelper upload;
   // --> import study.jsp.helper.RegexHelper;
   RegexHelper regex;
   
   TourPlanService tourplanService;
   PhotoService photoService;
   
   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      upload = UploadHelper.getInstance();
      regex = RegexHelper.getInstance();
      tourplanService = new TourPlanServiceImpl(sqlSession, logger);
      photoService = new PhotoServiceImpl(sqlSession, logger);
      
      /** (3) 파일이 포함된 POST 파라미터 받기 */
      try {
         upload.multipartRequest(request);
      } catch (Exception e) {
         sqlSession.close();
         web.redirect(null, "multipart 데이터가 아닙니다.");
         return null;
      }
      
      
      Map<String, String> paramMap = upload.getParamMap();
      
      String name = paramMap.get("planname");
      String intro = paramMap.get("intro");
      String intro_main = paramMap.get("intro_main");
      String startDate = paramMap.get("startDate");
      String days = paramMap.get("days");
      String people = paramMap.get("people");
      String theme = paramMap.get("theme");
      
      logger.debug("name >> " + name);
      logger.debug("intro >> " + intro);
      logger.debug("intro_main >> " + intro_main);
      logger.debug("startDate >> " + startDate);
      logger.debug("days >> " + days);
      logger.debug("people >> " + people);
      logger.debug("theme >> " + theme);
      logger.debug("theme2 >> " );
      
      int tempCount = 0;
      
      for(int i = 1; i<9999; i++){
         if(paramMap.get("plan_list_"+i+"_1") == null){
            break;
         }
         
         tempCount = i;
         
         for(int j = 1; j<6; j++){
            logger.debug(paramMap.get("plan_list_"+i+"_"+j));
         }
      }
      
//      for(int i=1; ;i++){
//         list.add(paramMap.get("plan_list_1_");
//      }
//      plan_photo.put("plan_list_1",);
//      
//      plan_photo.put("plan_list_1", "plan");

      // 작성자 아이피 주소 가져오기
//      String ipAddress = web.getClientIP();
      // 회원 일련번호 --> 비 로그인인 경우 0
      int memberId = 0;
      
      // 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
      Member loginInfo = (Member) web.getSession("loginInfo");
      if (loginInfo != null) {
         memberId = loginInfo.getMember_id();
      }
      
      if (!regex.isValue(name)) {
         sqlSession.close();
         web.redirect(null, "name 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(intro)) {
         sqlSession.close();
         web.redirect(null, "intro 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(intro_main)) {
         sqlSession.close();
         web.redirect(null, "intro_main 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(startDate)) {
         sqlSession.close();
         web.redirect(null, "startDate 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(days)) {
         sqlSession.close();
         web.redirect(null, "days 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(people)) {
         sqlSession.close();
         web.redirect(null, "people 이름를 입력하세요.");
         return null;
      }
      if (!regex.isValue(theme)) {
         sqlSession.close();
         web.redirect(null, "theme 이름를 입력하세요.");
         return null;
      }
      if(paramMap.get("plan_list_1_5") == null) {
    	  sqlSession.close();
		web.redirect(null, "관광명소는 최소 1개는 가야합니다.");
		return null;
      }
      
      TourPlan tourplan = new TourPlan();
      tourplan.setName(name);
      tourplan.setIntro(intro);
      tourplan.setIntro_main(intro_main);
      tourplan.setStartDate(startDate);
      tourplan.setDays(Integer.parseInt(days));
      tourplan.setPeople(Integer.parseInt(people));
      tourplan.setTheme(Integer.parseInt(theme));
      tourplan.setMember_id(memberId);
    
      
      logger.debug("touplan >> " + tourplan.toString());
      
      
      
      try{
         tourplanService.insertTourPlan(tourplan);
         
         
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }
      
      
      try{
    	  for(int i =1; i<=tempCount; i++) {
         	 Photo tempPhoto = new Photo();
         	 
         	 tempPhoto.setDate(paramMap.get("plan_list_"+i+"_"+1)+", "+paramMap.get("plan_list_"+i+"_"+2));
         	 tempPhoto.setName(paramMap.get("plan_list_"+i+"_"+3));
         	 tempPhoto.setContents(paramMap.get("plan_list_"+i+"_"+4));
         	 tempPhoto.setTour_id(Integer.parseInt(paramMap.get("plan_list_"+i+"_"+5)));
         	 tempPhoto.setTourPlan_id(tourplan.getId());
         	 photoService.insertPhotoByPlan(tempPhoto);
          }
      } catch (Exception e) {
    	  sqlSession.close();
          web.redirect(null, e.getLocalizedMessage());
          return null;
      }
      
      try{
    	  for(int i =1; i<=tempCount; i++) {
         	 Photo tempPhoto = new Photo();
         	 tempPhoto.setTour_id(Integer.parseInt(paramMap.get("plan_list_"+i+"_"+5)));
         	 tempPhoto = photoService.selectOnePhotoByTourId(tempPhoto);
         	 photoService.updateDirByTourId(tempPhoto);
          }
      } catch (Exception e) {
    	  sqlSession.close();
          web.redirect(null, e.getLocalizedMessage());
          return null;
      }
      
      logger.debug("템프카운트: "+ tempCount);
      
      
      sqlSession.close();
      web.redirect(web.getRootPath() + "/gazua/planinfo.do?id="+tourplan.getId(), "일정등록되었습니당");
      
      return null;
   }

}