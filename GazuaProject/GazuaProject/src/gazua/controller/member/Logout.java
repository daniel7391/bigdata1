package gazua.controller.member;

import gazua.helper.BaseController;
import gazua.helper.WebHelper;
import gazua.model.Member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/member/logout.do")
public class Logout extends BaseController {
	private static final long serialVersionUID = 414940135532743921L;
	
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		
		//로그인 중인 데이터 가져오기
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		//로그인 중이 아니라면 이 페이지 동작시키지 않는다.
		if(loginInfo == null) {
			web.redirect(web.getRootPath()+"/gazua/main.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		//로그아웃
		//모든 세션 삭제
		web.removeAllSession();
		
		//페이지 이동
		web.redirect(web.getRootPath()+"/gazua/main.do", "로그아웃 되었습니다");
		
		
		return null;
	}
}
