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
import gazua.model.Comment;
import gazua.model.Likes;
import gazua.model.Photo;
import gazua.model.TourPlan;
import gazua.service.CommentService;
import gazua.service.LikesService;
import gazua.service.PhotoService;
import gazua.service.TourPlanService;
import gazua.service.impl.CommentServiceImpl;
import gazua.service.impl.LikesServiceImpl;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;

/**
 * Servlet implementation class TourPlanDeleteOk
 */
@WebServlet("/plan/tourplan_delete_ok.do")
public class TourPlanDeleteOk extends BaseController {
   private static final long serialVersionUID = -7284423435000778088L;
   Logger logger;
   // --> import org.apache.ibatis.session.SqlSession;
   SqlSession sqlSession;
   // --> import study.jsp.helper.WebHelper;
   WebHelper web;
   UploadHelper upload;
   
   LikesService likesService;
   PhotoService photoService;
   TourPlanService tourPlanService;
   CommentService commentService;
   
   
   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      upload = UploadHelper.getInstance();
      
      likesService = new LikesServiceImpl(sqlSession, logger);
      photoService = new PhotoServiceImpl(sqlSession, logger);
      tourPlanService = new TourPlanServiceImpl(sqlSession, logger);
      commentService = new CommentServiceImpl(sqlSession, logger);
      
      int tourplan_id = web.getInt("plan_id");
      
      TourPlan tourplan = new TourPlan();
      Photo photo = new Photo();
      Likes likes = new Likes();
      Comment comment = new Comment();
      
      tourplan.setId(tourplan_id);
      likes.setPlan_id(tourplan_id);
      photo.setTourPlan_id(tourplan_id);
      comment.setTourPlan_id(tourplan_id);
      
      try{
         likesService.deleteLikesByPlan(likes);
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }
      
      try{
         commentService.deleteCommentByTourPlanId(comment);
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }
      
      try{
         photoService.deletePhotoByTourPlanId(photo);
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }
      
      try{
         tourPlanService.deleteTourPlan(tourplan);
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }finally{
         sqlSession.commit();
      }
      
      sqlSession.close();
       web.redirect(web.getRootPath() + "/gazua/plan_review_list.do", "일정이 삭제 되었습니다.");

       return null;
   }
}