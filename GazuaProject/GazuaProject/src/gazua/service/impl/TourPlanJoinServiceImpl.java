package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.TourPlanJoin;
import gazua.service.TourPlanJoinService;

public class TourPlanJoinServiceImpl implements TourPlanJoinService{
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public TourPlanJoinServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<TourPlanJoin> selectTourPlanJoin() throws Exception {
		List<TourPlanJoin> result = null;

		try {
			result = sqlSession.selectList("TourPlanJoinMapper.selectTourPlanJoin");
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.1");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<TourPlanJoin> selectTourPlanJoin2() throws Exception {
		List<TourPlanJoin> result = null;
		
		try {
			result = sqlSession.selectList("TourPlanJoinMapper.selectTourPlanJoin2");
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.2");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<TourPlanJoin> selectTourPlanJoinList(TourPlanJoin tourPlanJoin) throws Exception {
		List<TourPlanJoin> result = null;
		
		try {
			result = sqlSession.selectList("TourPlanJoinMapper.selectTourPlanJoinList", tourPlanJoin);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.3");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<TourPlanJoin> selectTourPlanJoinList2(TourPlanJoin tourPlanJoin) throws Exception {
		List<TourPlanJoin> result = null;
		
		try {
			result = sqlSession.selectList("TourPlanJoinMapper.selectTourPlanJoinList2", tourPlanJoin);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.4");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<TourPlanJoin> selectTourPlanJoinList3(TourPlanJoin tourPlanJoin) throws Exception {
		List<TourPlanJoin> result = null;
		
		try {
			result = sqlSession.selectList("TourPlanJoinMapper.selectTourPlanJoinList3", tourPlanJoin);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.5");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectTourPlanJoinCount(TourPlanJoin tourPlanJoin) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("TourPlanJoinMapper.selectTourPlanJoinCount", tourPlanJoin);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.6");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectTourPlanJoinCount2(TourPlanJoin tourPlanJoin) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("TourPlanJoinMapper.selectTourPlanJoinCount2", tourPlanJoin);
			
		}  catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.1");
		}
		
		return result;
	}

}
