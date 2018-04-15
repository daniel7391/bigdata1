package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Photo;
import gazua.service.PhotoService;

public class PhotoServiceImpl implements PhotoService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public PhotoServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<Photo> selectPhotoListByTourId(Photo photo) throws Exception {
		List<Photo> result = null;

		try {
			result = sqlSession.selectList("PhotoMapper.selectPhotoListByTourId", photo);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 사진 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("사진 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Photo selectOnePhotoByTourId(Photo photo) throws Exception {
		Photo result = null;

		try {
			result = sqlSession.selectOne("PhotoMapper.selectOnePhotoByTourId", photo);
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
	public List<Photo> selectPhotoListByTourPlanId(Photo photo) throws Exception {
		List<Photo> result = null;

		try {
			result = sqlSession.selectList("PhotoMapper.selectTourPlanList", photo);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 사진 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("사진 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Photo selectOnePhotoByTourPlanId(Photo photo) throws Exception {
		Photo result = null;

		try {
			result = sqlSession.selectOne("PhotoMapper.selectOnePhotoByTourPlanId", photo);
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
	public List<Integer> selectTourIdByPlanId(Photo photo) throws Exception {
		List<Integer> result = null;

		try {
			result = sqlSession.selectList("PhotoMapper.selectTourIdByPlanId", photo);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 장소 목록2이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("장소 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectTourIdByPlanIdCount(Photo photo) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("PhotoMapper.selectTourIdByPlanIdCount", photo);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 장소 목록3이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("장소 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Photo> selectPhotoListByTourPlanId2(Photo photo) throws Exception {
		List<Photo> result = null;

		try {
			result = sqlSession.selectList("PhotoMapper.selectPhotoListByTourPlanId2", photo);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 사진 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("사진 목록 조회에 실패했습니다.");
		}

		return result;
	}

}
