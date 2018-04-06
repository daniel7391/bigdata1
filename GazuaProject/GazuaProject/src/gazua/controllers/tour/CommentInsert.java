package gazua.controllers.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * Servlet implementation class CommentInsert
 */
@WebServlet("/gazua/CommentInsert")
public class CommentInsert extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6058740227530365814L;
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.mysite.service.BbsCommentService;
	CommentService commentService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		
		commentService=new CommentServiceImpl(sqlSession,logger);
		
		int tour_id=web.getInt("tour_id");
		
		String content=web.getString("content");
		String comment_user_name=web.getString("comment_user_name");
		int member_id=0;
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		if (loginInfo != null) {
			
		 comment_user_name = loginInfo.getMember_name2();
		 member_id=loginInfo.getMember_id();
		}
		
		logger.debug("tour_id="+tour_id);
		logger.debug("comment_user_name="+comment_user_name);
		logger.debug("content="+content);
		logger.debug("member_id="+member_id);
		
		if (tour_id == 0) {
			sqlSession.close();
			web.printJsonRt("여행지가 없습니다.");
			return null;
		}
		
		if (!regex.isValue(comment_user_name)) {
			sqlSession.close();
			web.printJsonRt("회원만 댓글 작성가능합니다.");
			return null;
				}
		
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		Comment comment= new Comment();
		comment.setTour_id(tour_id);
		comment.setComment_user_name(comment_user_name);
		comment.setContent(content);
		comment.setMember_id(member_id);
		logger.debug("comment >> " + comment.toString());
		
		Comment item=null;
		try{
			commentService.insertCommentTour(comment);
			item=commentService.selectCommentTour(comment);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		item.setComment_user_name(web.convertHtmlTag(item.getComment_user_name()));
		item.setContent(web.convertHtmlTag(item.getContent()));
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		return null;
	}
	
}
