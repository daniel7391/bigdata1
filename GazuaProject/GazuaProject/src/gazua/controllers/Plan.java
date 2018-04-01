package gazua.controllers;
//package gazua.controller;
//
//import gazua.dao.MyBatisConnectionFactory;
//import gazua.helper.BaseController;
//import gazua.helper.WebHelper;
//
//import java.io.IOException;
//import javax.servlet.Servlet;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//
///**
// * Servlet implementation class Plan
// */
//@WebServlet("/Plan")
//public class Plan extends BaseController implements Servlet {
//	private static final long serialVersionUID = 3312840367773758645L;
//	
//	Logger logger;
//	SqlSession sqlSession;
//	WebHelper web;
//
//	@Override
//	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		/** (2) 사용하고자하는 Helper+Service 객체 생성 */
//		logger = LogManager.getFormatterLogger(request.getRequestURI());
//		sqlSession = MyBatisConnectionFactory.getSqlSession();
//		web = WebHelper.getInstance(request, response);
//		
//		try{
//		}catch(Exception e){
//			web.redirect(null, e.getLocalizedMessage());
//		}finally{
//			sqlSession.close();
//		}
//		
//		return "plan/plan";
//	}
//
//
//}
