package gazua.controllers.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import gazua.dao.MyBatisConnectionFactory;
import gazua.helper.WebHelper;
import gazua.model.TourInfo;
import gazua.service.TourInfoService;
import gazua.service.impl.TourInfoServiceImpl;

/**
 * Servlet implementation class PlanSearching
 */
@WebServlet("/gazua/plan_searching.do")
public class PlanSearching extends HttpServlet {

   private static final long serialVersionUID = -8339911114449461380L;
   
   Logger logger;
   SqlSession sqlSession;
   WebHelper web;
   
   TourInfoService tourInfoService;
   
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      response.setContentType("application/json");
      
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      
      tourInfoService = new TourInfoServiceImpl(sqlSession, logger);
      
      TourInfo tourinfo = new TourInfo();
      
      List<TourInfo> item = null;
      
      try{
         item = tourInfoService.selectTourInfoListSecond(tourinfo);
      }catch(Exception e){
         web.printJsonRt(e.getLocalizedMessage());
         return;
      }finally{
         sqlSession.close();
      }
      
      for(int i = 0; i<item.size(); i++){
         TourInfo temp = item.get(i);
         temp.setName(web.convertHtmlTag(temp.getName()));
      }
      
      Map<String, Object> data = new HashMap<String, Object>();
      data.put("rt", "OK");
      data.put("item", item);
      
      ObjectMapper mapper = new ObjectMapper();
      mapper.writeValue(response.getWriter(), data);
      
   }
}