package gazua.controllers.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
		
		List<Member> item=null;
		try{
			item= memberService.selectidList(member);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}
		
		
		finally {
			sqlSession.close();
		}
		for (int i=0; i<item.size(); i++){
			Member temp=item.get(i);
			temp.setMember_user_id(web.convertHtmlTag(temp.getMember_user_id()));
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
