package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.PhotoTourInfo;
import gazua.service.PhotoTourInfoService;

public class PhotoTourInfoServiceImpl implements PhotoTourInfoService {
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public PhotoTourInfoServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public List<PhotoTourInfo> selectTourNameByPhoto(PhotoTourInfo phototourinfo) throws Exception {
		List<PhotoTourInfo> result = null;
		try{
			result = sqlSession.selectList("PhotoTourInfoMapper.selectTourNameByPhoto", phototourinfo);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.8");
		}finally{
			sqlSession.commit();
		}
		return result;
	}

}
