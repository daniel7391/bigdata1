package gazua.controllers.member;

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
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/member/findId.do")
public class FindId extends BaseController {
	private static final long serialVersionUID = -5811666008033584691L;
	
	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		web = WebHelper.getInstance(request, response);
		
		if(web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath()+"/index.do", "이미 로그인 중입니다.");
			return null;
		}
		
		response.setContentType("application/json");
		
		MemberService memberService;

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);

		memberService = new MemberServiceImpl(sqlSession, logger);
		
		String email = web.getString("find_id_email");
		String name = web.getString("find_id_name");
		logger.debug("email="+email);
		logger.debug("name="+name);
		
		if(email == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요");
			return null;
		}
		/*if(name == null) {
			sqlSession.close();
			web.redirect(null, "이름을 입력해주세요");
			return null;
		}*/
		
		Member member = new Member();
		member.setMember_email(email);
		member.setMember_name(name);
		Member item = null;
		try {
			item = memberService.selectFindMemberId(member);
		}catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
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
