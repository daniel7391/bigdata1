package gazua.controller.member;

import gazua.helper.BaseController;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;
import gazua.dao.MyBatisConnectionFactory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/member/login_ok.do")
public class LoginOk extends BaseController {
	private static final long serialVersionUID = -6516297851235197689L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		if(web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath()+"/gazua/main.do", "이미 로그인 하셨습니다.");
			return null;
		}
		
		String member_user_id = web.getString("member_user_id");
		String member_user_pw = web.getString("member_user_pw");
		
		logger.debug("member_user_id="+member_user_id);
		logger.debug("member_user_pw="+member_user_pw);
		
		if(member_user_id == null || member_user_pw == null) {
			sqlSession.close();
			web.redirect(null, "아이디나 비밀번호가 없습니다");
			return null;
		}
		
		Member member = new Member();
		member.setMember_user_id(member_user_id);
		member.setMember_pw(member_user_pw);
		
		Member loginInfo = null;
		
		try {
			loginInfo = memberService.selectLoginInfo(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		logger.debug("로그인 성공");
		logger.debug("LoginInfo >> " + loginInfo.toString());
		
		web.setSession("loginInfo", loginInfo);
		
		String movePage = request.getHeader("referer");
		if(movePage == null) {
			movePage = web.getRootPath() + "/gazua/main.do";
		}
		
		sqlSession.close();
		web.redirect(movePage, null);
		
		return null;
	}

}
