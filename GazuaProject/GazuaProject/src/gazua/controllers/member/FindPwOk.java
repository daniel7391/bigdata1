package gazua.controllers.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.BaseController;
import gazua.helper.MailHelper;
import gazua.helper.Util;
import gazua.helper.WebHelper;
import gazua.model.Member;
import gazua.service.MemberService;
import gazua.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class FindPw_Ok
 */
@WebServlet("/member/findpw_ok.do")
public class FindPwOk extends BaseController {

	private static final long serialVersionUID = -6154564860987750551L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		if(web.getSession("loginInfo")!=null) {
			sqlSession.close();
			web.redirect(web.getRootPath()+"/gazua/main.do", "이미 로그인 중입니다.");
			return null;
		}
		
		String email = web.getString("email");
		
		logger.debug("email="+email);
		
		if(email == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요");
			return null;
		}
		
		String newPassword = util.getRandomPassword();
		
		Member member = new Member();
		member.setMember_email(email);
		member.setMember_pw(newPassword);
		
		System.out.println(newPassword);
		
		try {
			memberService.updateMemberPasswordByEmail(member);
		} catch(Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		String sender = "blueluby@gmail.com";
		String subject = "Gazua 비밀번호 변경 안내입니다.";
		String content = "회원님의 새로운 비밀번호는 <strong>"+ newPassword + "</storng> 입니다.";
		
		try {
			mail.sendMail(sender, email, subject, content);
		} catch (MessagingException e) {
			web.redirect(null, "메일 발송에 실패했습니다. 관리자에게 문의 바랍니다");
			return null;
		} 
		web.redirect(web.getRootPath()+"/gazua/main.do", "새로운 비밀번호가 메일로 발송되었습니다.");
		
		return null;
	}

}
