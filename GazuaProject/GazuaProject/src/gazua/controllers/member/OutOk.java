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
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Comment;
import gazua.model.Likes;
import gazua.model.Member;
import gazua.model.Photo;
import gazua.model.Review;
import gazua.model.TourPlan;
import gazua.service.CommentService;
import gazua.service.LikesService;
import gazua.service.MemberService;
import gazua.service.PhotoService;
import gazua.service.ReviewService;
import gazua.service.TourPlanService;
import gazua.service.impl.CommentServiceImpl;
import gazua.service.impl.LikesServiceImpl;
import gazua.service.impl.MemberServiceImpl;
import gazua.service.impl.PhotoServiceImpl;
import gazua.service.impl.ReviewServiceImpl;
import gazua.service.impl.TourPlanServiceImpl;

@WebServlet("/member/out_ok.do")
public class OutOk extends BaseController {

   private static final long serialVersionUID = -7525599863974448087L;
   /** (1) 사용하고자 하는 Helper 객체 선언 */
   // --> import org.apache.logging.log4j.Logger;
   Logger logger;
   // --> import org.apache.ibatis.session.SqlSession;
   SqlSession sqlSession;
   // --> import study.jsp.helper.WebHelper;
   WebHelper web;
   // --> import study.jsp.helper.UploadHelper;
   UploadHelper upload;
   // --> import study.jsp.mysite.service.MemberService;
   MemberService memberService;
   
   LikesService likesService;
   CommentService commentService;
   TourPlanService tourPlanService;
   PhotoService photoService;
   ReviewService reviewService;
   
   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {

      /** (2) 사용하고자 하는 Helper+Service 객체 생성 */
      // --> import org.apache.logging.log4j.LogManager;
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      // --> import study.jsp.mysite.service.impl.MemberServiceImpl;
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      upload = UploadHelper.getInstance();
      // --> import study.jsp.mysite.service.impl.MemberServiceImpl;
      memberService = new MemberServiceImpl(sqlSession, logger);
      
      likesService = new LikesServiceImpl(sqlSession, logger);
      commentService = new CommentServiceImpl(sqlSession, logger);
      tourPlanService = new TourPlanServiceImpl(sqlSession, logger);
      photoService = new PhotoServiceImpl(sqlSession, logger);
      reviewService = new ReviewServiceImpl(sqlSession, logger);
      
      Likes likes = new Likes();
      Likes likes2 = new Likes();
      Comment comment = new Comment();
      Comment comment2	= new Comment();
      TourPlan tourplan = new TourPlan();
      Photo photo = new Photo();
      Review review = new Review();
      List<TourPlan> tourplanList = null;
      
      /** (3) 로그인 여부 검사 */
      // 로그인 중이 아니라면 탈퇴할 수 없다.
      if (web.getSession("loginInfo") == null) {
         web.redirect(web.getRootPath() + "/gazua/main.do", "로그인 후에 이용 가능합니다.");
         return null;
      }

      /** (4) 파라미터 받기 */
      String member_Pw = web.getString("member_pw");
      logger.debug("member_pw=" + member_Pw);

      if (member_Pw == null) {
         sqlSession.close();
         web.redirect(null, "비밀번호를 입력하세요.");
         return null;
      }

      /** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
      // 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득.
      Member loginInfo = (Member) web.getSession("loginInfo");
      Member member = new Member();
      member.setMember_id(loginInfo.getMember_id());
      member.setMember_pw(member_Pw);
      
      likes.setMember_id(member.getMember_id());
      comment.setMember_id(member.getMember_id());
      tourplan.setMember_id(member.getMember_id());
      review.setMember_id(member.getMember_id());
      
      
      /** (6) Service를 통한 탈퇴 시도 */
      // 회원의 여행일정 정보 받아오기
      int result = 0;
      try {
         // 회원의 클릭한 좋아요 삭제
         likesService.deleteLikesByOut(likes);
         // 회원의 댓글 삭제
         commentService.deleteCommentByOut(comment);
         // 회원의 리뷰 삭제
         reviewService.deleteReviewByMemberId(review);
         // 회원 여행 일정 게시물 찾기
         try{
            tourplanList = tourPlanService.selectTourPlanByMemberId(tourplan);
            for(int i = 0; i<tourplanList.size(); i++){
            	  comment2.setTourPlan_id(tourplanList.get(i).getId());
            	  likes2.setPlan_id(tourplanList.get(i).getId());
            	  commentService.deleteCommentByTourPlanId(comment2);
            	  likesService.deleteLikesByPlan(likes2);
            }
         }catch (Exception e) {
            web.redirect(null, e.getLocalizedMessage());
            return null;
         }
         
         for(int i = 0; i<tourplanList.size(); i++){
            photo.setTourPlan_id(tourplanList.get(i).getId());
            photoService.deletePhotoByTourPlanId(photo);
         }
         
         // 회원 여행 일정 게시물 삭제
         if(tourplanList.size() > 0 ){
            tourPlanService.deleteTourPlanByMemberId(tourplan);
         }
         
         // 비밀번호 검사 --> 비밀번호가 잘못된 경우 예외발생
         memberService.selectMemberPasswordCount(member);
         // 탈퇴처리
         memberService.deleteMember(member);
      } catch (Exception e) {
         web.redirect(null, e.getLocalizedMessage());
         return null;
      } finally {
         sqlSession.close();
      }
      
      // 탈퇴되었다면 프로필 이미지를 삭제한다.
      upload.removeFile(loginInfo.getMember_profile_img());

      /** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
      web.removeAllSession();
      web.redirect(web.getRootPath() + "/gazua/main.do", "탈퇴되었습니다.");
      return null;
   }

}