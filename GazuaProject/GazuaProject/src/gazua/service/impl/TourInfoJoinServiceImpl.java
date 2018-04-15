package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.TourInfoJoin;
import gazua.service.TourInfoJoinService;

public class TourInfoJoinServiceImpl implements TourInfoJoinService{
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public TourInfoJoinServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<TourInfoJoin> selectTourInfoJoin(TourInfoJoin tourInfoJoin) throws Exception {
		List<TourInfoJoin> result = null;

		try {
			result = sqlSession.selectList("TourInfoJoinMapper.selectTourInfoJoin", tourInfoJoin);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 장소 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("장소 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectTourInfoJoinCount(TourInfoJoin tourInfoJoin) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("TourInfoJoinMapper.selectTourInfoJoinCount", tourInfoJoin);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 장소 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("장소 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

}
