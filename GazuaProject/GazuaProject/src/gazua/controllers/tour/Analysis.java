package gazua.controllers.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.helper.BaseController;
import gazua.helper.WebHelper;
import gazua.service.CommentService;

/**
 * Servlet implementation class CommentDelete
 */
@WebServlet("/gazua/analysis.do")
public class Analysis extends BaseController {

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
		
		
	
		return "gazua/analysis";
	}

       
    /**
     * @see HttpServlet#HttpServlet()
     */


}
