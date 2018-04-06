package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.TourPlan;
import gazua.service.TourPlanService;

public class TourPlanServiceImpl implements TourPlanService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public TourPlanServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}


	@Override
	public List<TourPlan> selectTourPlanListByTime(TourPlan tourplan) throws Exception {

		List<TourPlan> result = null;

		try {
			result = sqlSession.selectList("TourPlanMapper.selectTourPlanListByTime", tourplan);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<TourPlan> selectTourPlanListByPopular(TourPlan tourplan) throws Exception {
		
		List<TourPlan> result = null;
		
		try {
			result = sqlSession.selectList("TourPlanMapper.selectTourPlanListByPopular", tourplan);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 일정 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("일정 목록 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public TourPlan selectPrevTourPlan(TourPlan tourplan) throws Exception {
		TourPlan result = null;

		try {
			// 이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("TourPlanMapper.selectPrevTourPlan", tourplan);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public TourPlan selectNextTourPlan(TourPlan tourplan) throws Exception {
		TourPlan result = null;

		try {
			// 다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("TourPlanMapper.selectNextTourPlan", tourplan);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public int selectTourPlanCount(TourPlan tourplan) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("TourPlanMapper.selectTourPlanCount", tourplan);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public TourPlan selectTourPlan(TourPlan tourplan) throws Exception {
		TourPlan result = null;

		try {
			result = sqlSession.selectOne("TourPlanMapper.selectTourPlan", tourplan);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}

		return result;
	}

}
