package gazua.controllers.member;

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
import gazua.helper.RegexHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/member/id_check.do")
public class IdCheck extends BaseController {

	
	private static final long serialVersionUID = -8994043517346783937L;
	Logger logger;
	
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		
		// 회원가입 처리를 위한 Service객체
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		String member_user_id = web.getString("member_user_id");
		
		
		logger.debug("member_user_id=" + member_user_id);
		
		Member member = new Member();
		member.setMember_user_id(member_user_id);
		
		try{
			memberService.selectUserIdCount(member);
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		return null;
	}
	
       
   

}
