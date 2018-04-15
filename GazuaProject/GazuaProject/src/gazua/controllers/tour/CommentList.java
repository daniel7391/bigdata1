package gazua.controllers.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import gazua.helper.WebHelper;
import gazua.model.Comment;
import gazua.service.CommentService;
import gazua.service.impl.CommentServiceImpl;

/**
 * Servlet implementation class CommentList
 */
@WebServlet("/gazua/CommentList")
public class CommentList extends BaseController {
	
	
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.BbsCommentService;
	CommentService commentService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 3972597210826618805L;
	
	
	

	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		int tour_id = web.getInt("tour_id");
		logger.debug("tour_id=" + tour_id);
		if (tour_id == 0) {
			sqlSession.close();
			web.printJsonRt("여행지가 없습니다.");
			return null;
		}
		Comment comment= new Comment();
		comment.setTour_id(tour_id);
		
		List<Comment> item=null;
		
		try{
			item= commentService.selectCommentListTour(comment);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		for (int i=0; i<item.size(); i++){
			Comment temp=item.get(i);
			temp.setComment_user_name(web.convertHtmlTag(temp.getComment_user_name()));
			temp.setContent(web.convertHtmlTag(temp.getContent()));
			
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
	
}
