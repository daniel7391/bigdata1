package gazua.controllers.member;

import gazua.helper.BaseController;
import gazua.helper.WebHelper;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindPw
 */
@WebServlet("/member/findpw.do")
public class FindPw extends BaseController {
	private static final long serialVersionUID = 8570336147208044690L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		
		if(web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath()+"/main.do", "이미 로그인 중입니다");
			return null;
		}
		return "member/find_pw";
	}

}
