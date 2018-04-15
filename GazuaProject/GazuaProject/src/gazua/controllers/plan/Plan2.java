package gazua.controllers.plan;

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
import gazua.helper.WebHelper;

@WebServlet("/plan/review.do")
public class Plan2 extends BaseController {
   private static final long serialVersionUID = -8575478089395934020L;

   /** (1) 사용하고자 하는 Helper 객체 선언 */
   Logger logger;
   SqlSession sqlSession;
   WebHelper web;

   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      /** (2) 사용하고자하는 Helper+Service 객체 생성 */
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      
      try{
      }catch(Exception e){
         web.redirect(null, e.getLocalizedMessage());
      }finally{
         sqlSession.close();
      }
      
      return "plan/review";
   }

}