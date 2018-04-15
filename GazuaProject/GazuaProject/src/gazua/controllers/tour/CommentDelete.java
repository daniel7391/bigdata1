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
import gazua.helper.WebHelper;
import gazua.model.Comment;
import gazua.model.Member;
import gazua.service.CommentService;
import gazua.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class CommentDelete
 */
@WebServlet("/gazua/CommentDelete.do")
public class CommentDelete extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 855544836276936038L;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	CommentService commentService;
	
		
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService= new CommentServiceImpl(sqlSession, logger);
		
		
		int comment_id=web.getInt("comment_id");
		if(comment_id==0){
			sqlSession.close();
			web.redirect(null, "덧글번호가 없습니다.");
			return null;
		}
		
		
		Comment comment=new Comment();
		comment.setComment_id(comment_id);
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			comment.setMember_id(loginInfo.getMember_id());
		}
		
		int commentCount = 0; 
		try {
			commentCount = commentService.selectCommentCountByMemberId(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (5) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myComment = commentCount > 0;
		logger.debug("myComment = " + myComment);
		request.setAttribute("myComment", myComment);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("comment_id", comment_id);
		
	
		return "gazua/comment_delete";
	}

       
    /**
     * @see HttpServlet#HttpServlet()
     */


}
