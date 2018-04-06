package gazua.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Likes;
import gazua.service.LikesService;

public class LikesServiceImpl implements LikesService {
	
	/** 처리 결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	SqlSession sqlSession;
	
	public LikesServiceImpl(SqlSession sqlSession, Logger logger){
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertLikesByPlace(Likes likes) throws Exception {
		try {
			int result = sqlSession.insert("LikesMapper.insertLikesByPlace", likes);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 좋아요가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("좋아요 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void deleteLikesByPlace(Likes likes) throws Exception {
		try {
			int result = sqlSession.insert("LikesMapper.deleteLikesByPlace", likes);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 좋아요가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("좋아요 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public int selectLikesCountByMemberId(Likes likes) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("LikesMapper.selectLikesCountByMemberId", likes);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("좋아요 수 조회에 실패했습니다.");
		}

		return result;
	}

}
