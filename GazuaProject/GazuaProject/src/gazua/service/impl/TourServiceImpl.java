package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Tour;
import gazua.service.TourService;

public class TourServiceImpl implements TourService{
	
	/** 처리 결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	SqlSession sqlSession;
	
	public TourServiceImpl(SqlSession sqlSession, Logger logger){
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<Tour> selectTourList(Tour tour) throws Exception {
		List<Tour> result = null;
		
		try{
			//첨부파일이 없는 경우도 있으므로, 조회결과가 null인경우 예외를 발생시키지 않는다
			result = sqlSession.selectList("TourMapper.selectTourList", tour);
			if (result == null) {
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			throw new Exception("조회된 장소 목록이 없습니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		
		return result;
	}
	

	@Override
	public Tour selectTour(Tour tour) throws Exception {
		Tour result = null;
		
		try{
			result = sqlSession.selectOne("TourMapper.selectTour", tour);
			
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 파일에 대한 요청입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectTourCount(Tour tour) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("TourMapper.selectTourCount", tour);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("Tour게시물 수 조회에 실패했습니다.");
		}

		return result;
	}
	

}
