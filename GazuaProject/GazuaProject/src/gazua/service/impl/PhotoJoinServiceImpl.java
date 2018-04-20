package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Photo;
import gazua.model.PhotoJoin;
import gazua.service.PhotoJoinService;

public class PhotoJoinServiceImpl implements PhotoJoinService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public PhotoJoinServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<PhotoJoin> selectPhotoJoinList(PhotoJoin photoJoin) throws Exception {
		List<PhotoJoin> result = null;

		try {
			result = sqlSession.selectList("PhotoJoinMapper.selectPhotoJoinList", photoJoin);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("사진 목록 조회에 실패했습니다.");
		}

		return result;
	}

}
