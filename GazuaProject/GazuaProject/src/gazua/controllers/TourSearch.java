package gazua.controllers;

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
import gazua.model.Tour;
import gazua.service.TourService;
import gazua.service.impl.TourServiceImpl;

/**
 * Servlet implementation class PagingTest
 */
@WebServlet("/gazua/head_list.do")
public class TourSearch extends HttpServlet {

   private static final long serialVersionUID = 1446613133120184414L;
   
   Logger logger;
   SqlSession sqlSession;
   WebHelper web;
   
   TourService tourService;
   
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      response.setContentType("application/json");
      
      logger = LogManager.getFormatterLogger(request.getRequestURI());
      sqlSession = MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      
      tourService = new TourServiceImpl(sqlSession, logger);
      
      Tour tour = new Tour();
      List<Tour> tourList = null;
      try{
         tourList = tourService.selectTourList(tour);
      }catch (Exception e) {
         web.printJsonRt(e.getLocalizedMessage());
         return;
      } finally {
         sqlSession.close();
      }
      
      for(int i = 0; i<tourList.size(); i++){
         Tour temp = tourList.get(i);
         temp.setTourLocation_gu(web.convertHtmlTag(temp.getTourLocation_gu()));
      }
      Map<String, Object> data = new HashMap<String, Object>();
      data.put("rt", "OK");
      data.put("item", tourList);
      
      ObjectMapper mapper = new ObjectMapper();
      mapper.writeValue(response.getWriter(), data);
   }
   

}