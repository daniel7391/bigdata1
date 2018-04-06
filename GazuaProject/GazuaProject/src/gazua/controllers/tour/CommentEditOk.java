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
 * Servlet implementation class CommentEditOk
 */
@WebServlet("/gazua/CommentEditOk")
public class CommentEditOk extends BaseController {

	/**
	 * 
	 */

	private static final long serialVersionUID = 1434239734949589352L;
	
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		commentService= new CommentServiceImpl(sqlSession, logger);
		
		
		int comment_id=web.getInt("comment_id");
		String content=web.getString("content");
		String comment_user_name=web.getString("comment_user_name");
		int member_id=0;
		
		logger.debug("comment_id="+comment_id);
		logger.debug("content="+content);
		logger.debug("member_id="+member_id);
		
	
		
		Member loginInfo = (Member)web.getSession("loginInfo");
		
		if (loginInfo != null) {
			try {
				// 소유권 판정을 위하여 사용하는 임시 객체
				Comment temp = new Comment();
				temp.setComment_id(comment_id);
				temp.setMember_id(loginInfo.getMember_id());

				if (commentService.selectCommentCountByMemberId(temp) > 0) {
					// 소유권을 의미하는 변수 변경
					
					// 입력되지 않은 정보들 갱신
					comment_user_name = loginInfo.getMember_name2();
					
					member_id = loginInfo.getMember_id();
				}
			} catch (Exception e) {
				sqlSession.close();
				web.printJsonRt(e.getLocalizedMessage());
				return null;
			}
		}
		
		logger.debug("comment_id="+comment_id);
		logger.debug("comment_user_name="+comment_user_name);
		logger.debug("content="+content);
		logger.debug("member_id="+member_id);
		if (comment_id == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		if (!regex.isValue(comment_user_name)) {
			sqlSession.close();
			web.printJsonRt("본인의 글만 수정이 가능합니다.");
			return null;
		}
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		Comment comment=new Comment();
		
		comment.setComment_id(comment_id);
		comment.setComment_user_name(comment_user_name);
		comment.setContent(content);
		comment.setMember_id(member_id);
		logger.debug(comment.toString());
		
		Comment item=null;
		
		try{
			commentService.updateComment(comment);
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
