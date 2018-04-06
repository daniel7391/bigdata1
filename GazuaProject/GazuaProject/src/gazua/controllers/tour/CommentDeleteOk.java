package gazua.controllers.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.RegexHelper;
import gazua.helper.WebHelper;
import gazua.model.Comment;
import gazua.model.Member;
import gazua.service.CommentService;
import gazua.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class CommentDeleteOk
 */
@WebServlet("/gazua/CommentDeleteOk.do")
public class CommentDeleteOk extends BaseController {

	/**
	 * 
	 */
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	RegexHelper regex;
	
	CommentService commentService;
	private static final long serialVersionUID = 7117383104364543375L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		commentService= new CommentServiceImpl(sqlSession,logger);
		
		int comment_id=web.getInt("comment_id");
		
		logger.debug("comment_id"+ comment_id);
		
		if(comment_id==0){
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다");
			return null;
		}
	
		
		Comment comment=new Comment();
		comment.setComment_id(comment_id);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo!=null){
			comment.setMember_id(loginInfo.getMember_id());
		}
		
		try{
			if(commentService.selectCommentCountByMemberId(comment)==1){
			commentService.deleteComment(comment);}
			else{
				sqlSession.close();
				web.printJsonRt("본인의 댓글이 아닙니다.");
				return null;
			}
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("comment_id", comment_id);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
	
       
  
}
