package gazua.controller.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gazua.helper.BaseController;
import gazua.helper.UploadHelper;
import gazua.helper.WebHelper;

/**
 * Servlet implementation class Download
 */
@WebServlet("/gazua/download.do")
public class Download extends BaseController {
	private static final long serialVersionUID = 2570051422527773375L;
	
	Logger logger;
	WebHelper web;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		
		String filePath = web.getString("file");
		String orginName = web.getString("orgin");
		
		if(filePath != null) {
			try {
				logger.debug("Create thumbnail Image --> "+filePath);
				upload.printFileStream(response, filePath, orginName);
			} catch (Exception e) {
				logger.debug(e.getLocalizedMessage());
			}
		}
		
		return null;
	}

}
