package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.TourInfo;
import gazua.service.TourInfoService;

public class TourInfoServiceImpl implements TourInfoService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public TourInfoServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}


	@Override
	public List<TourInfo> selectTourInfoList(TourInfo tourinfo) throws Exception {

		List<TourInfo> result = null;

		try {
			result = sqlSession.selectList("TourInfoMapper.selectTourInfoList", tourinfo);
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
	public TourInfo selectPrevTourInfo(TourInfo tourinfo) throws Exception {
		TourInfo result = null;

		try {
			// 이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("TourInfoMapper.selectPrevTourInfo", tourinfo);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public TourInfo selectNextTourInfo(TourInfo tourinfo) throws Exception {
		TourInfo result = null;

		try {
			// 다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("TourInfoMapper.selectNextTourInfo", tourinfo);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public int selectTourInfoCount(TourInfo tourinfo) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("TourInfoMapper.selectTourInfoCount", tourinfo);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public TourInfo selectTourInfo(TourInfo tourinfo) throws Exception {
		TourInfo result = null;

		try {
			result = sqlSession.selectOne("TourInfoMapper.selectTourInfo", tourinfo);
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


	@Override
	public void updateLikes(TourInfo tourinfo) throws Exception {
		try {
			int result = sqlSession.update("TourInfoMapper.updateLikes", tourinfo);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("좋아요수 갱신에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void dedateLikes(TourInfo tourinfo) throws Exception {
		try {
			int result = sqlSession.update("TourInfoMapper.dedateLikes", tourinfo);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("좋아요수 갱신에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	
	@Override
	public List<TourInfo> selectTourInfoListSecond(TourInfo tourinfo) throws Exception {
		List<TourInfo> result = null;

		try {
			result = sqlSession.selectList("TourInfoMapper.selectTourInfoListsecond", tourinfo);
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
	
}
