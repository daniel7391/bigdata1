package gazua.controllers.tour;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.WebHelper;
import gazua.model.Comment;
import gazua.service.CommentService;
import gazua.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class CommentEdit
 */
@WebServlet("/gazua/CommentEdit")
public class CommentEdit extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8876629953045234513L;

	// --> import org.apache.logging.log4j.Logger;
		Logger logger;
		// --> import org.apache.ibatis.session.SqlSession;
		SqlSession sqlSession;
		// --> import study.jsp.helper.WebHelper;
		WebHelper web;
		// --> import study.jsp.mysite.service.BbsCommentService;
		CommentService commentService;
	
	
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		commentService=new CommentServiceImpl(sqlSession, logger);
		
		int comment_id=web.getInt("comment_id");
		
		if(comment_id==0){
			sqlSession.close();
			web.redirect(null, "댓글번호가 지정되지 않았습니다.");
			return null;
		}
		
		Comment comment= new Comment();
		comment.setComment_id(comment_id);
		
		Comment readComment=null;
		
		try{
			readComment=commentService.selectCommentTour(comment);
		}catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		

		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("comment", readComment);

		return "gazua/comment_edit";
		
		
	}
	

}
