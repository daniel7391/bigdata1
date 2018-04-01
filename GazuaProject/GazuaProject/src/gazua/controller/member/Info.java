package gazua.controller.member;

import gazua.helper.BaseController;
import gazua.helper.WebHelper;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Info
 */
@WebServlet("/member/info.do")
public class Info extends BaseController {
	private static final long serialVersionUID = -5003766044517713940L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		
		return "member/info";
	}

}
