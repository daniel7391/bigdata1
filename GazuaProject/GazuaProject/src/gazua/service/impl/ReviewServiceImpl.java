package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Review;
import gazua.service.ReviewService;

public class ReviewServiceImpl implements ReviewService{
	
	/** 처리 결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	SqlSession sqlSession;
	
	public ReviewServiceImpl(SqlSession sqlSession, Logger logger){
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<Review> selectReviewListByTourId(Review review) throws Exception {
		List<Review> result = null;
		
		try{
			//첨부파일이 없는 경우도 있으므로, 조회결과가 null인경우 예외를 발생시키지 않는다
			result = sqlSession.selectList("ReviewMapper.selectReviewListByTourId", review);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectLikeLevel4Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectLikeLevel4Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.1");
		}
		return result;
	}

	@Override
	public int selectLikeLevel3Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectLikeLevel3Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.2");
		}
		return result;
	}

	@Override
	public int selectLikeLevel2Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectLikeLevel2Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.3");
		}
		return result;
	}

	@Override
	public int selectLikeLevel1Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectLikeLevel1Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.4");
		}
		return result;
	}

	@Override
	public int selectPeopleLevel4Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectPeopleLevel4Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.5");
		}
		return result;
	}

	@Override
	public int selectPeopleLevel3Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectPeopleLevel3Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.6");
		}
		return result;
	}

	@Override
	public int selectPeopleLevel2Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectPeopleLevel2Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.7");
		}
		return result;
	}

	@Override
	public int selectPeopleLevel1Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectPeopleLevel1Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.8");
		}
		return result;
	}

	@Override
	public int selectSeasonLevel4Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectSeasonLevel4Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.9");
		}
		return result;
	}

	@Override
	public int selectSeasonLevel3Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectSeasonLevel3Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.10");
		}
		return result;
	}

	@Override
	public int selectSeasonLevel2Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectSeasonLevel2Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.11");
		}
		return result;
	}

	@Override
	public int selectSeasonLevel1Count(Review review) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectSeasonLevel1Count", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 갯수 조회에 실패했습니다.12");
		}
		return result;
	}

	@Override
	public void insertReview(Review review) throws Exception {
		try {
			int result = sqlSession.insert("ReviewMapper.insertReview", review);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 리뷰가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("리뷰 정보 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public int selectReviewCountByMemberId(Review review) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReviewMapper.selectReviewCountByMemberId", review);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}

}
