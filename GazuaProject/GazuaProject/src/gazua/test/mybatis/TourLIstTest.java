package gazua.test.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import gazua.dao.MyBatisConnectionFactory;
import gazua.model.Tour;

public class TourLIstTest {
	public static void main(String[] args) {
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		
		List<Tour> list = null;
		
		try{
			list = sqlSession.selectList("TourMapper.selectTourList", null);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 조회에 실패했습니다.");
			return;
		} finally {
			sqlSession.close();
		}
		for (int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
}
